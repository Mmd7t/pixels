import 'package:flutter/material.dart';
import 'package:pixels/pages/courses_resources/cources_resources_page.dart';
import 'package:pixels/pages/news/news_page.dart';
import 'package:pixels/widgets/dices.dart';
import 'package:pixels/pages/home/hint_circle.dart';
// import 'package:pixels/pages/home/home_center_box.dart';
import 'package:pixels/pages/home/home_header.dart';
import 'package:pixels/widgets/navigation.dart';

class Home extends StatelessWidget {
  static const String routeName = 'home';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            SizedBox.expand(
              child: VariousDiscs(),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                HomeHeader(),
                // HomeCenterBox(),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(25),
                    child: InteractiveViewer(
                      child: Image.asset(
                        'assets/pixels_comm.jpg',
                      ),
                    ),
                  ),
                ),
                Column(
                  children: [
                    OutlineButton(
                      child: Text('Courses Resources'),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 30, vertical: 12),
                      borderSide: BorderSide(color: Colors.pink[700], width: 2),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      onPressed: () {
                        circularNavigate(
                          context,
                          page: CourcesResourcesPage(),
                          offset: Offset(
                            MediaQuery.of(context).size.width / 2,
                            MediaQuery.of(context).size.height / 2,
                          ),
                        );
                      },
                    ),
                    const SizedBox(height: 5),
                    OutlineButton(
                      child: Text('Pixels News'),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 30, vertical: 12),
                      borderSide: BorderSide(color: Colors.pink[700], width: 2),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => NewsPage()));
                      },
                    ),
                  ],
                ),
                HintCircle(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
