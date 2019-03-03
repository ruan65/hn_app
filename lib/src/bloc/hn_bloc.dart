import 'dart:async';
import 'dart:collection';

import 'package:hn_app/src/article.dart';
import 'package:http/http.dart' as http;
import 'package:rxdart/rxdart.dart';

const BASE_URL = 'https://hacker-news.firebaseio.com/v0';

enum StoriesType { NEW, POPULAR }

class HackerNewsBloc {

  final HashMap<int, Article> _cachedArticles = HashMap();

  Stream<bool> get isLoading => _isLoadingSubject.stream;

  final _isLoadingSubject = BehaviorSubject<bool>.seeded(false);

  Stream<List<Article>> get articles => _articlesSubject.stream;
  final _articlesSubject = BehaviorSubject<UnmodifiableListView<Article>>();

  Sink<StoriesType> get storiesTypeSink => _storiesTypeController.sink;
  final _storiesTypeController = StreamController<StoriesType>();

  HackerNewsBloc() {
    _initializeArticles();
    _storiesTypeController.stream.listen((storiesType) async {
      updateArticles(await _getIds(storiesType));
    });
  }

  Future<void> _initializeArticles() async {
    updateArticles(await _getIds(StoriesType.POPULAR));
  }

  Future<List<int>> _getIds(StoriesType type) async {

    final partPath = type == StoriesType.POPULAR ? 'topstories' : 'newstories';
    final url = '$BASE_URL/$partPath.json';

    final response = await http.get(url);
    if(response.statusCode != 200) return [];
    return parseStoriesIds(response.body).take(75).toList();
  }

  void updateArticles(List<int> ids) async {
    _isLoadingSubject.add(true);
    final articles = await Future.wait(ids.map((id) => _getArticle(id)));
    _articlesSubject.add(UnmodifiableListView(articles));
    _isLoadingSubject.add(false);
  }

  Future<Article> _getArticle(int id) async {
    if(!_cachedArticles.containsKey(id)) {
      final storyUrl = '$BASE_URL/item/$id.json';

      final storyResp = await http.get(storyUrl);

      if (storyResp.statusCode == 200) {
        _cachedArticles[id] = parseArticle(storyResp.body);
      }
    }
    return _cachedArticles[id];
  }

  void close() {
    _storiesTypeController.close();
    _articlesSubject.close();
  }
}
