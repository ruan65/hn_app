import 'package:built_value/built_value.dart';
import 'package:built_collection/built_collection.dart';
part 'article.g.dart';

abstract class Article implements Built<Article, ArticleBuilder> {

  int get id;
  bool get deleted;
  String get type;
  String get by;
  int get time;
  String get text;
  bool get dead;
  int get parent;
  int get poll;
  BuiltList<int> get kids;
  String get url;
  int get score;
  String get title;
  BuiltList<int> get parts;
  int get descendants;


  Article._();
  factory Article([updates(ArticleBuilder b)]) = _$Article;
}