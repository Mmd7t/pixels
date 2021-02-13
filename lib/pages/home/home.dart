import 'package:flutter/material.dart';
import 'package:pixels/widgets/dices.dart';
import 'package:pixels/pages/home/hint_circle.dart';
import 'package:pixels/pages/home/home_center_box.dart';
import 'package:pixels/pages/home/home_header.dart';

class Home extends StatefulWidget {
  static String routeName = 'home';

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
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
                HomeCenterBox(),
                HintCircle(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
