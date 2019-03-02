import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:url_launcher/url_launcher.dart';

import 'src/article.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  List<Widget> _getArticleList(List<int> ids) => ids
      .map(
        (id) => FutureBuilder<Article>(
              future: _getArticle(id),
              builder: (BuildContext context, AsyncSnapshot<Article> sn) {
                if (sn.connectionState == ConnectionState.done && sn.hasData) {
                  return _buildItem(sn.data);
                } else {
                  return Center(child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: CircularProgressIndicator(),
                  ));
                }
              },
            ),
      )
      .toList();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: ListView(
        children: _getArticleList(_ids),
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
