// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'article.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$Article extends Article {
  @override
  final int id;
  @override
  final bool deleted;
  @override
  final String type;
  @override
  final String by;
  @override
  final int time;
  @override
  final String text;
  @override
  final bool dead;
  @override
  final int parent;
  @override
  final int poll;
  @override
  final BuiltList<int> kids;
  @override
  final String url;
  @override
  final int score;
  @override
  final String title;
  @override
  final BuiltList<int> parts;
  @override
  final int descendants;

  factory _$Article([void updates(ArticleBuilder b)]) =>
      (new ArticleBuilder()..update(updates)).build();

  _$Article._(
      {this.id,
      this.deleted,
      this.type,
      this.by,
      this.time,
      this.text,
      this.dead,
      this.parent,
      this.poll,
      this.kids,
      this.url,
      this.score,
      this.title,
      this.parts,
      this.descendants})
      : super._() {
    if (id == null) {
      throw new BuiltValueNullFieldError('Article', 'id');
    }
    if (deleted == null) {
      throw new BuiltValueNullFieldError('Article', 'deleted');
    }
    if (type == null) {
      throw new BuiltValueNullFieldError('Article', 'type');
    }
    if (by == null) {
      throw new BuiltValueNullFieldError('Article', 'by');
    }
    if (time == null) {
      throw new BuiltValueNullFieldError('Article', 'time');
    }
    if (text == null) {
      throw new BuiltValueNullFieldError('Article', 'text');
    }
    if (dead == null) {
      throw new BuiltValueNullFieldError('Article', 'dead');
    }
    if (parent == null) {
      throw new BuiltValueNullFieldError('Article', 'parent');
    }
    if (poll == null) {
      throw new BuiltValueNullFieldError('Article', 'poll');
    }
    if (kids == null) {
      throw new BuiltValueNullFieldError('Article', 'kids');
    }
    if (url == null) {
      throw new BuiltValueNullFieldError('Article', 'url');
    }
    if (score == null) {
      throw new BuiltValueNullFieldError('Article', 'score');
    }
    if (title == null) {
      throw new BuiltValueNullFieldError('Article', 'title');
    }
    if (parts == null) {
      throw new BuiltValueNullFieldError('Article', 'parts');
    }
    if (descendants == null) {
      throw new BuiltValueNullFieldError('Article', 'descendants');
    }
  }

  @override
  Article rebuild(void updates(ArticleBuilder b)) =>
      (toBuilder()..update(updates)).build();

  @override
  ArticleBuilder toBuilder() => new ArticleBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Article &&
        id == other.id &&
        deleted == other.deleted &&
        type == other.type &&
        by == other.by &&
        time == other.time &&
        text == other.text &&
        dead == other.dead &&
        parent == other.parent &&
        poll == other.poll &&
        kids == other.kids &&
        url == other.url &&
        score == other.score &&
        title == other.title &&
        parts == other.parts &&
        descendants == other.descendants;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc(
                    $jc(
                        $jc(
                            $jc(
                                $jc(
                                    $jc(
                                        $jc(
                                            $jc(
                                                $jc(
                                                    $jc(
                                                        $jc($jc(0, id.hashCode),
                                                            deleted.hashCode),
                                                        type.hashCode),
                                                    by.hashCode),
                                                time.hashCode),
                                            text.hashCode),
                                        dead.hashCode),
                                    parent.hashCode),
                                poll.hashCode),
                            kids.hashCode),
                        url.hashCode),
                    score.hashCode),
                title.hashCode),
            parts.hashCode),
        descendants.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('Article')
          ..add('id', id)
          ..add('deleted', deleted)
          ..add('type', type)
          ..add('by', by)
          ..add('time', time)
          ..add('text', text)
          ..add('dead', dead)
          ..add('parent', parent)
          ..add('poll', poll)
          ..add('kids', kids)
          ..add('url', url)
          ..add('score', score)
          ..add('title', title)
          ..add('parts', parts)
          ..add('descendants', descendants))
        .toString();
  }
}

class ArticleBuilder implements Builder<Article, ArticleBuilder> {
  _$Article _$v;

  int _id;
  int get id => _$this._id;
  set id(int id) => _$this._id = id;

  bool _deleted;
  bool get deleted => _$this._deleted;
  set deleted(bool deleted) => _$this._deleted = deleted;

  String _type;
  String get type => _$this._type;
  set type(String type) => _$this._type = type;

  String _by;
  String get by => _$this._by;
  set by(String by) => _$this._by = by;

  int _time;
  int get time => _$this._time;
  set time(int time) => _$this._time = time;

  String _text;
  String get text => _$this._text;
  set text(String text) => _$this._text = text;

  bool _dead;
  bool get dead => _$this._dead;
  set dead(bool dead) => _$this._dead = dead;

  int _parent;
  int get parent => _$this._parent;
  set parent(int parent) => _$this._parent = parent;

  int _poll;
  int get poll => _$this._poll;
  set poll(int poll) => _$this._poll = poll;

  ListBuilder<int> _kids;
  ListBuilder<int> get kids => _$this._kids ??= new ListBuilder<int>();
  set kids(ListBuilder<int> kids) => _$this._kids = kids;

  String _url;
  String get url => _$this._url;
  set url(String url) => _$this._url = url;

  int _score;
  int get score => _$this._score;
  set score(int score) => _$this._score = score;

  String _title;
  String get title => _$this._title;
  set title(String title) => _$this._title = title;

  ListBuilder<int> _parts;
  ListBuilder<int> get parts => _$this._parts ??= new ListBuilder<int>();
  set parts(ListBuilder<int> parts) => _$this._parts = parts;

  int _descendants;
  int get descendants => _$this._descendants;
  set descendants(int descendants) => _$this._descendants = descendants;

  ArticleBuilder();

  ArticleBuilder get _$this {
    if (_$v != null) {
      _id = _$v.id;
      _deleted = _$v.deleted;
      _type = _$v.type;
      _by = _$v.by;
      _time = _$v.time;
      _text = _$v.text;
      _dead = _$v.dead;
      _parent = _$v.parent;
      _poll = _$v.poll;
      _kids = _$v.kids?.toBuilder();
      _url = _$v.url;
      _score = _$v.score;
      _title = _$v.title;
      _parts = _$v.parts?.toBuilder();
      _descendants = _$v.descendants;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(Article other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$Article;
  }

  @override
  void update(void updates(ArticleBuilder b)) {
    if (updates != null) updates(this);
  }

  @override
  _$Article build() {
    _$Article _$result;
    try {
      _$result = _$v ??
          new _$Article._(
              id: id,
              deleted: deleted,
              type: type,
              by: by,
              time: time,
              text: text,
              dead: dead,
              parent: parent,
              poll: poll,
              kids: kids.build(),
              url: url,
              score: score,
              title: title,
              parts: parts.build(),
              descendants: descendants);
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'kids';
        kids.build();

        _$failedField = 'parts';
        parts.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'Article', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
