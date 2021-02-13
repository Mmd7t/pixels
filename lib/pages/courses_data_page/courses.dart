import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pixels/provider/track_provider.dart';
import 'package:pixels/pages/courses_data_page/course_card.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

class Articles extends StatefulWidget {
  final int index;

  const Articles(this.index);

  @override
  _ArticlesState createState() => _ArticlesState();
}

class _ArticlesState extends State<Articles>
    with SingleTickerProviderStateMixin {
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
          List coursesList = [data.course1, data.course2, data.course3];
          return Container(
            alignment: Alignment.center,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                coursesList.length,
                (indexx) => Column(
                  children: [
                    (coursesList[indexx] != '')
                        ? ScaleTransition(
                            scale: animation,
                            child: CourseCard(
                              text: 'Course ${indexx + 1}',
                              onClick: () {
                                launch(coursesList[indexx]);
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
          // return Container(
          //   alignment: Alignment.center,
          //   child: Column(
          //     mainAxisAlignment: MainAxisAlignment.center,
          //     children: [
          //       (data.course1 != '')
          //           ? CourseCard(
          //               index: indexx,
          //               text: 'Course 1',
          //               onClick: () {
          //                 launch(data.course1);
          //               },
          //             )
          //           : const SizedBox(),
          //       const SizedBox(height: 10),
          //       (data.course2 != '')
          //           ? CourseCard(
          //               text: 'Course 2',
          //               onClick: () {
          //                 launch(data.course2);
          //               },
          //             )
          //           : const SizedBox(),
          //       const SizedBox(height: 10),
          //       (data.course3 != '')
          //           ? CourseCard(
          //               text: 'Course 3',
          //               onClick: () {
          //                 launch(data.course3);
          //               },
          //             )
          //           : const SizedBox(),
          //     ],
          //   ),
          // );
        }
      },
    );
  }
}
