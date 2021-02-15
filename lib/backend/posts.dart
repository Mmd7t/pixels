import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:pixels/models/news.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

class Posts {
  static const String posts =
      'https://script.google.com/macros/s/AKfycbzrAKWM3ikEHpOYnA4EMG--LLtUVeLW7Aqn0OIgTShzvei6J9-YGC9IAg/exec';

  static Future<List<NewsModel>> getPostsSheet() async {
    var dir = await getTemporaryDirectory();
    File file = new File(dir.path + "/" + 'posts.json');
    if (file.existsSync()) {
      print("Loading from cacheeeeeeeeeeeeee");
      var jsonData = file.readAsStringSync();
      var jsonNews = convert.jsonDecode(jsonData) as List;
      return jsonNews.map((json) => NewsModel.fromJson(json)).toList();
    } else {
      print("Loading from APIIIIIIIIIIII");
      var response = await http.get(posts);

      if (response.statusCode == 200) {
        var jsonResponse = response.body;
        var jsonNews = convert.jsonDecode(jsonResponse) as List;

        //save json in local file
        file.writeAsStringSync(jsonResponse, flush: true, mode: FileMode.write);
        return jsonNews.map((json) => NewsModel.fromJson(json)).toList();
      } else {
        return null;
      }
    }
  }
}
