import 'dart:convert';

import 'package:pixels/models/facebook_posts.dart';

import '../constants.dart';
import 'package:http/http.dart' as http;

class FacePostsServices {
/*---------------------------------------------------------------------------------*/
  List data = [];
  fetchPostData() async {
    try {
      final response = await http.get(facebookUrl);
      if (response.statusCode == 200) {
        Iterable i = json.decode(response.body)['feed']['data'];
        data = i.map((e) => Data.fromJson(e)).toList();
        return data;
      }
    } catch (e) {
      return await e;
    }
  }

  stFetchPostData() async* {
    yield await fetchPostData();
  }

/*---------------------------------------------------------------------------------*/
/*---------------------------------------------------------------------------------*/
  List attachmentsData = [];
  fetchAttachmentsData() async {
    try {
      final response = await http.get(facebookUrl);
      if (response.statusCode == 200) {
        Iterable i =
            json.decode(response.body)['feed']['data']['attachments']['data'];
        data = i.map((e) => AttachmentsData.fromJson(e)).toList();
        return data;
      }
    } catch (e) {
      return await e;
    }
  }

  stFetchAttachmentsData() async* {
    yield await fetchAttachmentsData();
  }
/*---------------------------------------------------------------------------------*/

}
