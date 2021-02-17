import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:pixels/backend/face_posts_data.dart';
import 'package:pixels/constants.dart';
import 'package:pixels/models/facebook_posts.dart';
import 'package:pixels/pages/news/post_box.dart';
import 'package:pixels/pages/news/post_btn.dart';
import 'package:pixels/pages/news/post_with_image.dart';
import 'package:pixels/widgets/dices.dart';

class NewsPage extends StatefulWidget {
  @override
  _NewsPageState createState() => _NewsPageState();
}

class _NewsPageState extends State<NewsPage> {
  FacePostsServices facePostsServices = FacePostsServices();
  @override
  void initState() {
    super.initState();
    facePostsServices.fetchPostData();
    facePostsServices.fetchAttachmentsData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SizedBox.expand(
            child: VariousDiscs(),
          ),
          Align(
            alignment: Alignment.center,
            child: StreamBuilder(
              stream: facePostsServices.stFetchPostData(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  List<Data> data = snapshot.data;
                  return ListView.builder(
                    itemCount: data.length,
                    itemBuilder: (context, index) {
                      Data facebookPostsData = data[index];
                      return Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          PostWithImage(
                            description: facebookPostsData.message,
                            imgUrl: facebookPostsData.fullPicture,
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 10.0)
                                    .copyWith(bottom: 8.0),
                            child: Row(
                              children: [
                                PostBtn(
                                  isFavBtn: true,
                                  icon: Icons.favorite_border,
                                  onClick: () {},
                                ),
                                const SizedBox(width: 8.0),
                                PostBtn(
                                  isFavBtn: false,
                                  icon: Icons.share_outlined,
                                  onClick: () {},
                                ),
                              ],
                            ),
                          ),
                        ],
                      );
                    },
                  );
                } else {
                  return CircularProgressIndicator();
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
