import 'dart:ui';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:pixels/constants.dart';
import 'package:pixels/pages/tracks_page/carousel.dart';
import 'package:pixels/pages/tracks_page/track_header.dart';
import 'package:pixels/provider/track_provider.dart';
import 'package:pixels/widgets/blur_filter.dart';
import 'package:pixels/widgets/dices.dart';
import 'package:provider/provider.dart';

class TrackPage extends StatefulWidget {
  static String routeName = 'trackPage';

  @override
  _TrackPageState createState() => _TrackPageState();
}

class _TrackPageState extends State<TrackPage> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    var track = Provider.of<TrackProvider>(context);

    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            SizedBox.expand(
              child: VariousDiscs(),
            ),
            Column(
              children: [
                TracksHeader(),
                Padding(
                  padding: const EdgeInsets.only(bottom: 15),
                  child: BlurFilter(
                    borderRadius: BorderRadius.circular(20),
                    sigma: 8,
                    child: Container(
                      width: size.width * 0.8,
                      height: 60,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.pink[800], width: 2.5),
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.white.withOpacity(0.15),
                      ),
                      child: Text(
                        tracksNames[track.trackType],
                        style: Theme.of(context).textTheme.headline6.copyWith(
                              fontWeight: FontWeight.bold,
                              letterSpacing: 2,
                            ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Stack(
                    children: [
                      Container(
                        alignment: Alignment.center,
                        child: IgnorePointer(
                          child: BlurFilter(
                            borderRadius: BorderRadius.circular(150),
                            sigma: 8,
                            child: Container(
                              width: size.width * 0.8,
                              height: size.width * 0.8,
                              alignment: Alignment.center,
                              padding: const EdgeInsets.all(15),
                              decoration: BoxDecoration(
                                // borderRadius: BorderRadius.circular(20),
                                border: Border.all(
                                    color: Colors.pink[800], width: 2.5),
                                color: Colors.white.withOpacity(0.15),
                                shape: BoxShape.circle,
                              ),
                              child: AnimatedTextKit(
                                isRepeatingAnimation: false,
                                animatedTexts: [
                                  TypewriterAnimatedText(
                                    tracksDiscription[track.trackType],
                                    textAlign: TextAlign.center,
                                    textStyle: Theme.of(context)
                                        .textTheme
                                        .headline6
                                        .copyWith(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                          letterSpacing: 2,
                                          height: 2,
                                        ),
                                    speed: const Duration(milliseconds: 200),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      Carousel(),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
