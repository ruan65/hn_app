import 'package:hn_app/src/article.dart';
import 'dart:convert';

List<int> parseTopStories(String jsonString) {

  final parsed = jsonDecode(jsonString);
  final listOfIds = List<int>.from(parsed);

  return listOfIds;
}

Article parseArticle(String jsonString) {
  final parsed = jsonDecode(jsonString);

  return Article.fromJson(parsed);
}