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
  List<int> _ids = [
    19288241,
    19278848,
    19287021,
    19286970,
    19285105,
    19287964,
    19287151,
    19288693,
    19287809,
    19286216
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: ListView(
        children: _ids.map((id) => Text('id: $id')).toList(),
      ),
    );
  }

  Widget _buildItem(Article article) {
    return Padding(
      key: Key(article.text),
      padding: const EdgeInsets.all(12.0),
      child: ExpansionTile(
          title: Text(
            article.text,
            style: TextStyle(fontSize: 25),
          ),
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Text('score: ${article.score}'),
                IconButton(
                  icon: Icon(Icons.launch),
                  onPressed: () async {
                    final fakeUrl = 'http://${article.url}';
                    if (await canLaunch(fakeUrl)) {
                      launch(fakeUrl);
                    }
                  },
                ),
              ],
            ),
          ]),
    );
  }
}
