import 'dart:convert' as convert;
import 'package:pixels/models/facebook_posts.dart';

import '../constants.dart';
import 'package:http/http.dart' as http;

class FacePostsServices {
/*---------------------------------------------------------------------------------*/
  // static Future<List<Data>> getFacebookData() async {
  //   var dir = await getTemporaryDirectory();
  //   File file = new File(dir.path + "/" + 'facebookData.json');
  //   if (file.existsSync()) {
  //     print("Loading from cache");
  //     var jsonData = file.readAsStringSync();
  //     var jsonTrack = convert.jsonDecode(jsonData)['posts']['data'] as List;
  //     return jsonTrack.map((json) => Data.fromJson(json)).toList();
  //   } else {
  //     print("Loading from API");
  //     var response = await http.get(facebookUrl);

  //     if (response.statusCode == 200) {
  //       var jsonResponse = response.body;
  //       var jsonTrack =
  //           convert.jsonDecode(jsonResponse)['posts']['data'] as List;

  //       //save json in local file
  //       file.writeAsStringSync(jsonResponse, flush: true, mode: FileMode.write);
  //       return jsonTrack.map((json) => Data.fromJson(json)).toList();
  //     } else {
  //       return null;
  //     }
  //   }
  // }
  static Future<List<Data>> getFacebookData() async {
    print("Loading from API");
    var response = await http.get(facebookUrl);

    if (response.statusCode == 200) {
      var jsonResponse = response.body;
      var jsonTrack = convert.jsonDecode(jsonResponse)['posts']['data'] as List;
      return jsonTrack.map((json) => Data.fromJson(json)).toList();
    } else {
      return null;
    }
  }
}
