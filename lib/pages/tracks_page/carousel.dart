import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:pixels/models/track.dart';
import 'package:pixels/provider/bottom_navbar_provider.dart';
import 'package:pixels/provider/track_provider.dart';
import 'package:pixels/widgets/blur_filter.dart';
import 'package:pixels/widgets/dices.dart';
import 'package:pixels/widgets/loading.dart';
import 'package:pixels/widgets/navigation.dart';
import 'package:provider/provider.dart';
import 'package:vs_scrollbar/vs_scrollbar.dart';
import '../../constants.dart';
import '../courses_data_page/courses_data_page.dart';

class Carousel extends StatefulWidget {
  final CarouselController carouselController;

  const Carousel({Key key, this.carouselController}) : super(key: key);

  @override
  _CarouselState createState() => _CarouselState();
}

class _CarouselState extends State<Carousel> {
  var scrollControllers;
  @override
  Widget build(BuildContext context) {
    // var size = MediaQuery.of(context).size;
    var track = Provider.of<TrackProvider>(context);
    return Positioned.fill(
      child: FutureBuilder(
        future: track.selectedTrack(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Center(child: Loading());
          } else {
            List<TrackModel> data = snapshot.data;
            scrollControllers =
                List.generate(data.length, (index) => ScrollController());
            return CarouselSlider.builder(
              carouselController: widget.carouselController,
              itemCount: data.length,
              itemBuilder: (context, index, n) {
                if (index == 0) {
                  return IgnorePointer(child: SizedBox());
                } else {
                  return CarouselCard(
                    name: data[index].name,
                    description: data[index].description,
                    logo: data[index].logo,
                    index: index,
                    scrollControllers: scrollControllers,
                  );
                }
              },
              options: CarouselOptions(
                enlargeCenterPage: true,
                enlargeStrategy: CenterPageEnlargeStrategy.height,
                aspectRatio: 4 / 3.9,
                viewportFraction: 0.8,
                onScrolled: (value) {
                  setState(() {
                    makeDiscs();
                  });
                },
              ),
            );
          }
        },
      ),
    );
  }
}

class CarouselCard extends StatelessWidget {
  final String name;
  final String description;
  final String logo;
  final int index;
  final List scrollControllers;

  const CarouselCard(
      {Key key,
      this.name,
      this.description,
      this.logo,
      this.index,
      this.scrollControllers})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var cPage = Provider.of<BottomNavBarProvider>(context);
    return Stack(
      clipBehavior: Clip.none,
      alignment: Alignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: BlurFilter(
            borderRadius: BorderRadius.circular(20),
            sigma: 8,
            child: Container(
              width: size.width,
              height: size.height * 0.5,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.white.withOpacity(0.2),
              ),
              alignment: Alignment.bottomCenter,
              child: Column(
                children: [
                  const SizedBox(height: 60),
/*---------------------------------------------------------------------------------------------*/
/*---------------------------------------  Course Name  ---------------------------------------*/
/*---------------------------------------------------------------------------------------------*/
                  Text(
                    name,
                    style: Theme.of(context)
                        .textTheme
                        .headline6
                        .copyWith(fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
/*---------------------------------------------------------------------------------------------*/
/*---------------------------------------  Description  ---------------------------------------*/
/*---------------------------------------------------------------------------------------------*/
                  Expanded(
                    child: Container(
                      margin: const EdgeInsets.all(8.0),
                      decoration: BoxDecoration(
                        color: Theme.of(context).primaryColor.withOpacity(0.35),
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(
                          color: Theme.of(context).primaryColor,
                          width: 1.3,
                        ),
                      ),
                      child: VsScrollbar(
                        controller: scrollControllers[index],
                        showTrackOnHover: true,
                        isAlwaysShown: true,
                        scrollbarFadeDuration:
                            const Duration(milliseconds: 500),
                        scrollbarTimeToFade: const Duration(milliseconds: 500),
                        style: VsScrollbarStyle(
                          hoverThickness: 10.0,
                          radius: Radius.circular(10),
                          thickness: 6.0,
                          color: Constants.color2,
                        ),
                        child: ListView(
                          controller: scrollControllers[index],
                          shrinkWrap: true,
                          physics: BouncingScrollPhysics(),
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                description,
                                style: Theme.of(context)
                                    .textTheme
                                    .subtitle1
                                    .copyWith(
                                      height: 1.5,
                                      wordSpacing: 1.2,
                                    ),
                                textAlign: TextAlign.center,
                                softWrap: true,
                                textWidthBasis: TextWidthBasis.parent,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),

/*---------------------------------------------------------------------------------------------*/
/*------------------------------------  See Resources Btn  ------------------------------------*/
/*---------------------------------------------------------------------------------------------*/
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: TextButton(
                      style: TextButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        padding: const EdgeInsets.symmetric(
                          horizontal: 25,
                          vertical: 12,
                        ),
                        backgroundColor: Constants.color2.withOpacity(0.8),
                      ),
                      onPressed: () {
                        cPage.setCurrentPage(0);
                        circularNavigate(
                          context,
                          page: CoursesDataPage(indexOfSelectedCourse: index),
                          offset: Offset(
                            size.width / 2,
                            size.height,
                          ),
                        );
                      },
                      child: const Text(
                        'See Resources',
                        style: const TextStyle(color: Colors.white),
                        softWrap: true,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
/*---------------------------------------------------------------------------------------------*/
/*---------------------------------------  Course Logo  ---------------------------------------*/
/*---------------------------------------------------------------------------------------------*/
        Positioned(
          top: (size.height > 600) ? -30 : 0,
          left: 0,
          right: 0,
          child: CircleAvatar(
            radius: 38,
            backgroundColor: Constants.color2,
            child: CircleAvatar(
              radius: 34,
              backgroundColor: Colors.white,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: logo == ''
                    ? FlutterLogo()
                    : Image.network(
                        logo,
                        fit: BoxFit.cover,
                      ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
