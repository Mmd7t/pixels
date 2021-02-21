import 'package:flutter/material.dart';
import 'package:pixels/models/facebook_posts.dart';
import 'package:pixels/pages/news/post_btn.dart';
import 'package:pixels/widgets/blur_filter.dart';
import 'package:provider/provider.dart';

import 'post_boxes/post_box.dart';

class PostsList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<Data> data = Provider.of<List<Data>>(context);
    return ListView.builder(
      itemCount: data.length,
      itemBuilder: (context, index) {
        var time = (data[index].createdTime.split('T'))[0];
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            BlurFilter(
              sigma: 5.0,
              borderRadius: BorderRadius.circular(20),
              child: Container(
                padding: const EdgeInsets.all(10),
                margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.white.withOpacity(0.2),
                ),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Container(
                          child: Image.asset('assets/pixels_white.png'),
                          padding: const EdgeInsets.all(3.0),
                          width: 50,
                          height: 50,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color: Theme.of(context).primaryColor,
                            shape: BoxShape.circle,
                          ),
                        ),
                        const SizedBox(width: 8),
                        Text(
                          'Pixels Egypt',
                          style: Theme.of(context).textTheme.subtitle1.copyWith(
                                fontWeight: FontWeight.bold,
                              ),
                        ),
                        Spacer(),
                        Text(
                          '$time',
                          style: Theme.of(context).textTheme.caption,
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    //Box is here
                    PostBox(index: index),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0)
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
  }
}
