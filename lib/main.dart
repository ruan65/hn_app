import 'dart:collection';

import 'package:flutter/material.dart';
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
      title: 'Hacker News',
      theme: ThemeData(
        primarySwatch: Colors.blue,
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
        currentIndex: 1,
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.art_track), title: Text('New')),
          BottomNavigationBarItem(
              icon: Icon(Icons.bookmark), title: Text('Best')),
        ],
        onTap: (i) {
          print('index: $i');
        },
      ),
    );
  }

  Widget _buildItem(Article article) {
    print(article);
    return Padding(
      key: Key(article.title),
      padding: const EdgeInsets.all(12.0),
      child: ExpansionTile(
          title: Text(
            article.title,
            style: TextStyle(fontSize: 25),
          ),
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Text('type: ${article.type}'),
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
