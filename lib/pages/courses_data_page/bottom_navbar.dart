import 'package:flutter/material.dart';
import 'package:pixels/widgets/clippers.dart';
import 'package:pixels/widgets/dices.dart';
import 'package:provider/provider.dart';
import '../../provider/bottom_navbar_provider.dart';

class MBottomNavBar extends StatefulWidget {
  @override
  _MBottomNavBarState createState() => _MBottomNavBarState();
}

class _MBottomNavBarState extends State<MBottomNavBar> {
  var iconsList = [
    Icons.book_rounded,
    Icons.video_collection_rounded,
    Icons.dashboard_rounded,
    Icons.insert_drive_file_rounded,
  ];
  var iconsOutlineList = [
    Icons.book_outlined,
    Icons.video_collection_outlined,
    Icons.dashboard_outlined,
    Icons.insert_drive_file_outlined,
  ];

  @override
  Widget build(BuildContext context) {
    var cPage = Provider.of<BottomNavBarProvider>(context);
    int length = 4;
    return Container(
      height: 100,
      child: Stack(
        children: [
          Positioned(
            bottom: 0,
            child: ClipPath(
              clipper: BottomNavClipper(length),
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: 50,
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.1),
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 40,
            width: MediaQuery.of(context).size.width,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: List.generate(
                length,
                (index) => AnimatedContainer(
                  alignment: Alignment.center,
                  duration: const Duration(milliseconds: 200),
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: (cPage.currentPage == index)
                        ? Border.all(color: Colors.pink[800], width: 3)
                        : Border.fromBorderSide(BorderSide.none),
                    color: (cPage.currentPage == index)
                        ? Colors.white.withOpacity(0.3)
                        : Colors.white.withOpacity(0.1),
                  ),
                  child: IconButton(
                    icon: Icon(
                      (cPage.currentPage == index)
                          ? iconsList[index]
                          : iconsOutlineList[index],
                    ),
                    iconSize: (cPage.currentPage == index) ? 28 : 16,
                    splashColor: Colors.transparent,
                    color: Colors.white,
                    onPressed: () {
                      makeDiscs(50);
                      cPage.setCurrentPage(index);
                    },
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 10,
            width: MediaQuery.of(context).size.width,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: List.generate(
                length,
                (index) => Padding(
                  padding: (index == 1)
                      ? const EdgeInsets.symmetric(horizontal: 0)
                      : const EdgeInsets.all(0.0),
                  child: AnimatedOpacity(
                    curve: Curves.easeInOut,
                    opacity: (cPage.currentPage == index) ? 1.0 : 0.0,
                    duration: const Duration(milliseconds: 350),
                    child: CircleAvatar(
                      maxRadius: 6,
                      backgroundColor: Colors.pink[800],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
