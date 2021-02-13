import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:pixels/models/track.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

class Tracks {
  static const String csTrack =
      'https://script.google.com/macros/s/AKfycbw6SsPYaeaBsW7tPioaaEbidRtwGFEIGuf9UgIpVRgj-Q2gUMGn0xEP/exec';
  static const String powerTrack =
      'https://script.google.com/macros/s/AKfycbznQl9P4dNE98pUrbdcrdNZrMM0cC2Lzyc-jUaeGjE0Igeg6bg3U_ojpQ/exec';
  static const String mechanicalTrack =
      'https://script.google.com/macros/s/AKfycbzwGx8IndHddTgIH5p3eDb1lDvwCKmFRS4ZNxMB3UfqgYDSsfaCmwPV/exec';

  static Future<List<TrackModel>> getTrackFromSheet({
    trackUrl,
    trackFileName,
  }) async {
    var dir = await getTemporaryDirectory();
    File file = new File(dir.path + "/" + trackFileName);
    if (file.existsSync()) {
      print("Loading from cache");
      var jsonData = file.readAsStringSync();
      var jsonTrack = convert.jsonDecode(jsonData) as List;
      return jsonTrack.map((json) => TrackModel.fromJson(json)).toList();
    } else {
      print("Loading from API");
      var response = await http.get(trackUrl);

      if (response.statusCode == 200) {
        var jsonResponse = response.body;
        var jsonTrack = convert.jsonDecode(jsonResponse) as List;

        //save json in local file
        file.writeAsStringSync(jsonResponse, flush: true, mode: FileMode.write);
        return jsonTrack.map((json) => TrackModel.fromJson(json)).toList();
      } else {
        return null;
      }
    }
  }
}
