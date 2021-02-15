import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:pixels/models/track.dart';
import 'package:pixels/provider/track_provider.dart';
import 'package:pixels/widgets/blur_filter.dart';
import 'package:pixels/widgets/dices.dart';
import 'package:pixels/widgets/navigation.dart';
import 'package:provider/provider.dart';

import '../courses_data_page/courses_data_page.dart';

class Carousel extends StatefulWidget {
  @override
  _CarouselState createState() => _CarouselState();
}

class _CarouselState extends State<Carousel> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    var track = Provider.of<TrackProvider>(context);
    return Positioned.fill(
      child: FutureBuilder(
        future: track.selectedTrack(),
        builder: (context, snapshot) {
          List<TrackModel> data = snapshot.data;
          if (!snapshot.hasData) {
            return Center(child: CircularProgressIndicator());
          } else {
            return CarouselSlider.builder(
              itemCount: data.length,
              itemBuilder: (context, index) {
                if (index == 0) {
                  return IgnorePointer(child: SizedBox());
                } else {
                  return Stack(
                    overflow: Overflow.visible,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 15,
                        ),
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
/*-----------------  Learn More Btn  --------------------------------------------------------------------*/
                            child: Column(
                              children: [
                                const SizedBox(height: 60),
                                Text(
                                  data[index].name,
                                  style: Theme.of(context)
                                      .textTheme
                                      .headline6
                                      .copyWith(fontWeight: FontWeight.bold),
                                ),
                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.all(12.0),
                                    child: Text(
                                      data[index].description,
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
                                ),
                                FlatButton(
                                  onPressed: () {
                                    circularNavigate(
                                      context,
                                      page: CoursesDataPage(
                                          indexOfSelectedCourse: index),
                                      offset: Offset(
                                        size.width / 2,
                                        size.height * 0.88,
                                      ),
                                    );
                                  },
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 25,
                                    vertical: 12,
                                  ),
                                  color: Colors.pink[800].withOpacity(0.8),
                                  child: Text('See Resources'),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        top: -30,
                        left: 0,
                        right: 0,
                        child: CircleAvatar(
                          radius: 38,
                          backgroundColor: Colors.pink[800],
                          child: CircleAvatar(
                            radius: 34,
                            backgroundColor: Colors.white,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Image.network(
                                data[index].logo,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
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
