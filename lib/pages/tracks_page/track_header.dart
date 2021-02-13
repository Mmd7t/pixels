import 'package:flutter/material.dart';
import 'package:pixels/widgets/navigation.dart';
import 'package:pixels/widgets/star_widget.dart';

import '../info/info.dart';

class TracksHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          IconButton(
            icon: Icon(Icons.info_outline_rounded),
            iconSize: 30,
            onPressed: () {
              circularNavigate(
                context,
                page: PixelsInfo(),
                offset: Offset(50, 100),
              );
            },
          ),
          CircleAvatar(
            radius: MediaQuery.of(context).size.width * 0.18,
            child: Hero(
              tag: 'pixelsAbout',
              transitionOnUserGestures: true,
              child: Image.asset('assets/pixels_white.png'),
            ),
            backgroundColor: Theme.of(context).primaryColor.withOpacity(0.5),
          ),
          Hero(
            tag: 'pixelsStar',
            transitionOnUserGestures: true,
            child: Material(
              color: Colors.transparent,
              child: StarWidget(size: 50),
            ),
          ),
        ],
      ),
    );
  }
}
