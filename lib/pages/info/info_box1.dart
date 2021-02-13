import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:pixels/widgets/blur_filter.dart';
import 'package:pixels/widgets/star_widget.dart';

class InfoBoxOne extends StatefulWidget {
  final PageController controller;

  const InfoBoxOne({Key key, this.controller}) : super(key: key);
  @override
  _InfoBoxOneState createState() => _InfoBoxOneState();
}

class _InfoBoxOneState extends State<InfoBoxOne> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
      width: size.width,
      height: size.height,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0).copyWith(top: 30),
            child: Hero(
              tag: 'pixelsAbout',
              transitionOnUserGestures: true,
              child: Image.asset(
                'assets/pixels_white.png',
                width: MediaQuery.of(context).size.width * 0.3,
              ),
            ),
          ),
          Hero(
            tag: 'pixelsStar',
            transitionOnUserGestures: true,
            child: Material(
              color: Colors.transparent,
              child: StarWidget(size: 60),
            ),
          ),
          const SizedBox(height: 10),
          BlurFilter(
            sigma: 8,
            borderRadius: BorderRadius.circular(200),
            child: Container(
              width: size.width * 0.9,
              height: size.width * 0.9,
              alignment: Alignment.center,
              padding: const EdgeInsets.all(30),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white.withOpacity(0.15),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    "PIXELS",
                    style: Theme.of(context).textTheme.headline5.copyWith(
                          letterSpacing: 2,
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                  AnimatedTextKit(
                    isRepeatingAnimation: false,
                    animatedTexts: [
                      TypewriterAnimatedText(
                        "is a non-profit organization established in faculty of Engineering in Helwan University in 2014, empowers individuals technically, academically and the required knowledge and projects in different engineering fields.",
                        textStyle: TextStyle(
                          height: 1.5,
                          wordSpacing: 0.6,
                          letterSpacing: 1,
                          fontSize:
                              Theme.of(context).textTheme.subtitle1.fontSize,
                        ),
                        textAlign: TextAlign.center,
                        speed: const Duration(milliseconds: 100),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                ],
              ),
            ),
          ),
          const SizedBox(height: 30),
          Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: Colors.white, width: 1.5),
            ),
            child: IconButton(
              icon: Icon(Icons.arrow_downward_outlined),
              onPressed: () {
                widget.controller.animateToPage(
                  1,
                  duration: const Duration(milliseconds: 1200),
                  curve: Curves.fastOutSlowIn,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
