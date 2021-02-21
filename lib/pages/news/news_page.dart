import 'package:flutter/material.dart';
import 'package:pixels/models/facebook_posts.dart';
import 'package:pixels/pages/news/posts_list.dart';
import 'package:pixels/widgets/dices.dart';
import 'package:provider/provider.dart';

class NewsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<Data> data = Provider.of<List<Data>>(context);
    return Scaffold(
      body: Stack(
        children: [
          SizedBox.expand(
            child: VariousDiscs(),
          ),
          Align(
            alignment: Alignment.center,
            child: (data == null)
                ? Center(child: CircularProgressIndicator())
                : PostsList(),
          ),
        ],
      ),
    );
  }
}
