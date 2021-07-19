import 'package:flutter/material.dart';
import 'package:pixels/widgets/dices.dart';
import 'components/info_box1.dart';
import 'components/info_box2.dart';

class PixelsInfo extends StatefulWidget {
  @override
  _PixelsInfoState createState() => _PixelsInfoState();
}

class _PixelsInfoState extends State<PixelsInfo> {
  PageController controller = PageController(initialPage: 0);
  List boxes;
  @override
  void initState() {
    super.initState();
    boxes = [InfoBoxOne(controller: controller), InfoBoxTwo()];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          VariousDiscs(),
          PageView.builder(
            controller: controller,
            scrollDirection: Axis.vertical,
            onPageChanged: (value) => setState(() => makeDiscs()),
            itemCount: 2,
            itemBuilder: (context, index) => boxes[index],
          ),
        ],
      ),
    );
  }
}
