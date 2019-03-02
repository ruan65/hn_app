import 'dart:async';
import 'dart:collection';

import 'package:hn_app/src/article.dart';
import 'package:http/http.dart' as http;
import 'package:rxdart/rxdart.dart';

enum StoriesType { NEW, POPULAR }

class HackerNewsBloc {
  Stream<List<Article>> get articles => _articlesSubject.stream;
  final _articlesSubject = BehaviorSubject<UnmodifiableListView<Article>>();

  Sink<StoriesType> get storiesTypeSink => _storiesTypeController.sink;
  final _storiesTypeController = StreamController<StoriesType>();

  HackerNewsBloc() {
    updateArticles(topIds);
    _storiesTypeController.stream.listen((storiesType) {
      updateArticles(storiesType == StoriesType.NEW ? newIds : topIds);
    });
  }

  void updateArticles(List<int> ids) async {
    final articles = await Future.wait(ids.map((id) => _getArticle(id)));
    _articlesSubject.add(UnmodifiableListView(articles));
  }

  Future<Article> _getArticle(int id) async {
    final storyUrl = 'https://hacker-news.firebaseio.com/v0/item/$id.json';

    final storyResp = await http.get(storyUrl);

    if (storyResp.statusCode != 200) return null;
    return parseArticle(storyResp.body);
  }
}

List<int> newIds = [
  19289836,
  19289782,
  19278839,
  19289865,
  19279788,
  19280927,
  19290044,
  19289583,
  19278848,
  19281222,
  19280864,
  19279251,
  19290069,
  19290059,
  19289353,
  19289848,
  19289509,
  19283865,
  19289771,
  19281213,
  19288905,
  19289755,
  19287962,
  19278915,
  19287772,
  19279300,
  19287809,
];

List<int> topIds = [
  19287964,
  19286970,
  19279715,
  19287021,
  19273955,
  19285105,
  19282346,
  19289381,
  19290011,
  19288077,
  19281420,
  19281834,
  19286216,
  19280341,
  19283743
];
