import 'package:flutter/material.dart';
import 'package:pixels/models/facebook_posts.dart';
import 'package:pixels/widgets/blur_filter.dart';
import 'package:provider/provider.dart';

class PostWithImage extends StatelessWidget {
  final String description;
  final String imgUrl;

  const PostWithImage({Key key, this.description, this.imgUrl})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    // Data value = Provider.of<Data>(context);
    return BlurFilter(
      sigma: 5.0,
      borderRadius: BorderRadius.circular(25),
      child: Container(
        padding: const EdgeInsets.all(10),
        margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25),
          color: Colors.white.withOpacity(0.2),
        ),
        child: Column(
          children: [
            Row(
              children: [
                Container(
                  child: Image.asset('assets/pixels_white.png'),
                  padding: const EdgeInsets.all(3.0),
                  width: 50,
                  height: 50,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: Theme.of(context).primaryColor,
                    shape: BoxShape.circle,
                  ),
                ),
                const SizedBox(width: 8),
                Text(
                  'Pixels Egypt',
                  style: Theme.of(context).textTheme.subtitle1.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Container(
              child: LayoutBuilder(
                builder: (context, constraints) => Column(
                  children: [
                    Text(
                      '$description',
                      style: TextStyle(
                        fontSize: 16,
                        height: 1.5,
                      ),
                      textAlign: TextAlign.justify,
                    ),
                    const SizedBox(height: 15),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(15),
                      child: Container(
                        width: constraints.maxWidth,
                        decoration: BoxDecoration(
                          color: Colors.red,
                        ),
                        child: Image.network(
                          imgUrl,
                          fit: BoxFit.cover,
                          alignment: Alignment.topCenter,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
