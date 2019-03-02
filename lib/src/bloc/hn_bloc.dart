import 'package:rxdart/rxdart.dart';

import 'package:http/http.dart' as http;
import 'package:hn_app/src/article.dart';

class HackerNewsBloc {
  Stream<List<Article>> get articles => _articlesSubject.stream;

  final _articlesSubject = BehaviorSubject<List<Article>>();

  var _articles = <Article>[];

  HackerNewsBloc() {}

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

  Future<List<Article>> _getArticles() async {
    final futureArticles = _ids.map((id) => _getArticle(id));
    return await Future.wait(futureArticles);
  }

  Future<Article> _getArticle(int id) async {
    final storyUrl = 'https://hacker-news.firebaseio.com/v0/item/$id.json';

    final storyResp = await http.get(storyUrl);

    if (storyResp.statusCode != 200) return null;
    return parseArticle(storyResp.body);
  }
}