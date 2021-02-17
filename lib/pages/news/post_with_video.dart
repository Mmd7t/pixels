import 'package:flutter/material.dart';
import 'package:pixels/widgets/blur_filter.dart';

class PostWithVideo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
                      'description',
                      style: TextStyle(
                        fontSize: 16,
                        height: 1.5,
                      ),
                      textAlign: TextAlign.justify,
                    ),
                    const SizedBox(height: 15),
                    Text('video'),
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
