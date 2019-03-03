import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hn_app/src/bloc/hn_bloc.dart';
import 'package:url_launcher/url_launcher.dart';

import 'src/article.dart';

void main() => runApp(MyApp(HackerNewsBloc()));

class MyApp extends StatelessWidget {
  final HackerNewsBloc _bloc;

  MyApp(this._bloc);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Hacker News',
      theme: ThemeData(
        primarySwatch: Colors.deepOrange,
      ),
      home: MyHomePage(
        title: 'Hacker News Top',
        bloc: _bloc,
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  final HackerNewsBloc bloc;

  MyHomePage({Key key, this.title, this.bloc}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: LoadingInfo(widget.bloc.isLoading),
        title: Text(widget.title),
      ),
      body: StreamBuilder<UnmodifiableListView<Article>>(
        builder: (context, snapshot) => ListView(
              children:
                  snapshot.data.map((article) => _buildItem(article)).toList(),
            ),
        stream: widget.bloc.articles,
        initialData: UnmodifiableListView<Article>([]),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.art_track), title: Text('Best')),
          BottomNavigationBarItem(
              icon: Icon(Icons.bookmark), title: Text('New')),
        ],
        onTap: (i) {
          widget.bloc.storiesTypeSink
              .add(i == 0 ? StoriesType.POPULAR : StoriesType.NEW);
          setState(() {
            _currentIndex = i;
          });
        },
      ),
    );
  }

  Widget _buildItem(Article article) {
    return Padding(
      key: Key(article.title),
      padding: const EdgeInsets.all(12.0),
      child: ExpansionTile(
          title: Text(
            article.title,
            style: TextStyle(fontSize: 20),
          ),
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Text('${article.descendants} comments'),
//                Text('type: ${article.type}'),
                IconButton(
                  icon: Icon(Icons.launch),
                  onPressed: () async {
                    final url = article.url;
                    print('url: $url');
                    if (await canLaunch(url)) {
                      launch(url);
                    }
                  },
                ),
              ],
            ),
          ]),
    );
  }
}

class LoadingInfo extends StatefulWidget {
  final Stream<bool> _isLoading;

  LoadingInfo(this._isLoading);

  @override
  _LoadingInfoState createState() => _LoadingInfoState();
}

class _LoadingInfoState extends State<LoadingInfo>
    with TickerProviderStateMixin {
  AnimationController _controller;

  @override
  void initState() {
    _controller =
        AnimationController(vsync: this, duration: Duration(seconds: 1));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: widget._isLoading,
        builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {
//          snapshot.hasData && snapshot.data ? Icon(FontAwesomeIcons.hackerNews) : Container(),
        _controller.forward().then((_) => _controller.reverse());
          return FadeTransition(
//            opacity: _controller,
            opacity: Tween(begin: .5, end: 1.0).animate(
              CurvedAnimation(parent: _controller, curve: Curves.easeIn)
            ),
            child: Icon(FontAwesomeIcons.hackerNewsSquare),
          );
        });
  }
}
