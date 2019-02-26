import 'package:flutter/material.dart';
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
  List<Article> _articles = articles;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: ListView(
        children: _articles.map(_buildItem).toList(),
      ),
    );
  }

  Widget _buildItem(Article article) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: ListTile(
          title: Text(
            article.text,
            style: TextStyle(fontSize: 25),
          ),
          subtitle: Text('${article.commentsCount} comments'),
          onTap: () async {
            final fakeUrl = 'http://${article.domain}';
            if(await canLaunch(fakeUrl)) {
              launch(fakeUrl);
            }
          },
        ),
      ),
    );
  }
}
