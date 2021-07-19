import 'package:flutter/material.dart';
import 'package:pixels/pages/courses_resources/cources_resources_page.dart';
import 'package:pixels/pages/news/news_page.dart';
import 'package:pixels/widgets/dices.dart';
import 'package:pixels/pages/home/hint_circle.dart';
import 'package:pixels/pages/home/home_header.dart';
import 'package:pixels/widgets/navigation.dart';
import '../../constants.dart';
import '../news/news_page.dart';

class Home extends StatelessWidget {
  static const String routeName = 'home';
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            SizedBox.expand(child: VariousDiscs()),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                HomeHeader(isHome: true),
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
                    OutlinedButton(
                      child: const Text(
                        'Courses Resources',
                        style: const TextStyle(color: Colors.white),
                        softWrap: true,
                      ),
                      style: OutlinedButton.styleFrom(
                        side: BorderSide(color: Constants.color2, width: 2),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 30, vertical: 12),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                      ),
                      onPressed: () {
                        circularNavigate(
                          context,
                          page: CourcesResourcesPage(),
                          offset: Offset(size.width / 2, size.height / 2),
                        );
                      },
                    ),
                    OutlinedButton(
                      child: const Text(
                        'Pixels News',
                        style: const TextStyle(color: Colors.white),
                        softWrap: true,
                      ),
                      style: OutlinedButton.styleFrom(
                        side: BorderSide(color: Constants.color2, width: 2),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 30, vertical: 12),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                      ),
                      onPressed: () {
                        circularNavigate(
                          context,
                          page: NewsPage(),
                          offset: Offset(size.width / 2, size.height / 2),
                        );
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
