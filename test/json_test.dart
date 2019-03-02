import 'package:hn_app/src/article.dart';
import 'package:http/http.dart' as http;
import 'package:test/test.dart';

void main() {
  test('parses topstories.json', () {
    const jsonString =
        """[19275315,19271556,19274692,19270689,19254008,19274417,19274006,19273964,19270815,19272768,19257350,19270106,19267418,19265525,19266614,19255690,19260808,19263294,19261019,19256970,19268612,19266766,19266142,19265049,19265513,19253804,19264106,19257648,19255422,19255263,19258447,19264876,19254903,19263686,19275050,19275046,19275033,19274785,19274756,19274454,19274326,19274036,19273736,19273696,19273664,19273444,19273359,19273228,19273194,19272263,19272154,19272020,19271732,19271604,19271476,19271248]""";
    expect(parseTopStories(jsonString).first, 19275315);
    expect(parseTopStories(jsonString).last, 19271248);
    const emptyListStr = '[]';
    expect(parseTopStories(emptyListStr), []);
  });

  test('parses item.json', () {
    const jsonString = """
    {"by":"dhouston","descendants":71,"id":8863,"kids":[9224,8917,8952,8884,8887,8869,8940,8908,8958,9005,8873,9671,9067,9055,8865,8881,8872,8955,10403,8903,8928,9125,8998,8901,8902,8907,8894,8870,8878,8980,8934,8943,8876],"score":104,"time":1175714200,"title":"My YC app: Dropbox - Throw away your USB drive","type":"story","url":"http://www.getdropbox.com/u/2/screencast.html"}
    """;
    expect(parseArticle(jsonString).by, 'dhouston');
  });

  test('parses item.json with some nulls', () {
    const jsonString = """
    {"descendants":71,"id":8863, "score":104,"time":1175714200,"title":"My YC app: Dropbox - Throw away your USB drive","type":"story"}
    """;
    expect(parseArticle(jsonString).by, null);
  });

  test('parses item.json over network', () async {
    final url = 'https://hacker-news.firebaseio.com/v0/topstories.json';

    final response = await http.get(url);

    if (response.statusCode == 200) {
      final idList = parseTopStories(response.body);
      if(idList.isNotEmpty) {
        final id = idList.first;

        final storyUrl = 'https://hacker-news.firebaseio.com/v0/item/$id.json';

        final storyResp = await http.get(storyUrl);

        if(storyResp.statusCode == 200) {
          final article = parseArticle(storyResp.body);
          expect(article.id, isNotNull);
          expect(article.url, contains('http'));
          print(storyResp.body);
        }
      }
    }
  });
}
