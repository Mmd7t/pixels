import 'package:flutter/material.dart';
import 'package:pixels/pages/courses_data_page/drive.dart';
import 'package:pixels/widgets/dices.dart';
import 'package:provider/provider.dart';
import '../../provider/bottom_navbar_provider.dart';
import 'courses.dart';
import 'books.dart';
import 'videos.dart';
import 'bottom_navbar.dart';

class CoursesDataPage extends StatelessWidget {
  static String routeName = 'coursePage';
  final int indexOfSelectedCourse;

  const CoursesDataPage({Key key, this.indexOfSelectedCourse})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    var cPage = Provider.of<BottomNavBarProvider>(context);
    var pages = [
      Books(indexOfSelectedCourse),
      Videos(indexOfSelectedCourse),
      Articles(indexOfSelectedCourse),
      Drive(indexOfSelectedCourse),
    ];
    return Scaffold(
      body: Stack(
        children: [
          VariousDiscs(),
          pages[cPage.currentPage],
        ],
      ),
      bottomNavigationBar: MBottomNavBar(),
    );
  }
}
