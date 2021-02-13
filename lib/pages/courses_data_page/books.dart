import 'package:flutter/material.dart';
import 'package:pixels/provider/track_provider.dart';
import 'package:pixels/pages/courses_data_page/course_card.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

class Books extends StatefulWidget {
  final int index;

  const Books(this.index);

  @override
  _BooksState createState() => _BooksState();
}

class _BooksState extends State<Books> with SingleTickerProviderStateMixin {
  AnimationController _controller;

  Animation animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 800));
    animation = Tween(begin: 0.2, end: 1.0).animate(
        CurvedAnimation(parent: _controller, curve: Curves.easeOutBack));
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var track = Provider.of<TrackProvider>(context);
    return FutureBuilder(
      future: track.selectedTrack(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return Center(child: CircularProgressIndicator());
        } else {
          var data = snapshot.data[widget.index];

          List booksList = [data.book1, data.book2, data.book3];
          return Container(
            alignment: Alignment.center,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                booksList.length,
                (indexx) => Column(
                  children: [
                    (booksList[indexx] != '')
                        ? ScaleTransition(
                            scale: animation,
                            child: CourseCard(
                              text: 'Book ${indexx + 1}',
                              onClick: () {
                                launch(booksList[indexx]);
                              },
                            ),
                          )
                        : const SizedBox(),
                    const SizedBox(height: 10),
                  ],
                ),
              ),
            ),
          );
        }
      },
    );
  }
}
