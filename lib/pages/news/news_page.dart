import 'package:flutter/material.dart';
import 'package:pixels/backend/posts.dart';
import 'package:pixels/models/news.dart';
import 'package:pixels/pages/news/post_box.dart';
import 'package:pixels/pages/news/post_btn.dart';
import 'package:pixels/widgets/dices.dart';

class NewsPage extends StatelessWidget {
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
            child: FutureBuilder(
              future: Posts.getPostsSheet(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  List<NewsModel> data = snapshot.data;
                  return ListView.builder(
                    itemCount: data.length,
                    itemBuilder: (context, index) {
                      NewsModel newsModel = data[index];
                      return Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          PostBox(
                            description: newsModel.description,
                            imgUrl: newsModel.imgs[0],
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
