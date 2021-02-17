import 'package:flutter/material.dart';
import 'package:pixels/models/facebook_posts.dart';
import 'package:pixels/pages/news/post_with_image.dart';
import 'package:pixels/pages/news/post_with_link.dart';
import 'package:pixels/pages/news/post_with_video.dart';
import 'package:provider/provider.dart';

import 'post_with_album.dart';

class PostBox extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<AttachmentsData>(
      builder: (context, value, child) {
        switch (value.mediaType) {
          case 'photo':
            return PostWithImage();
            break;
          case 'album':
            return PostWithAlbum();
            break;
          case 'link':
            return PostWithLink();
            break;
          case 'video':
            return PostWithVideo();
            break;
          default:
            return Container();
        }
      },
    );
  }
}
