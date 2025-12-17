import 'package:easy_rating_bar/widgets/custom_rating_bar.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Text('Heart',style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),),
            Center(
              child: CustomRatingBar(
                itemCount: 5,
                allowHalfRating: true,
                size: 40,
                initialRating: 0,
                activeColor: Colors.red,
                iconType: RatingIconType.heart,
                onRatingChanged: (rating) {
                  debugPrint('Rating: $rating');
                },
              ),
            ),
            SizedBox(height: 20),
            Text('Emoji',style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),),
            Center(
              child: CustomRatingBar(
                itemCount: 5,
                allowHalfRating: true,
                size: 40,
                initialRating: 0,
                iconType: RatingIconType.emoji,
                onRatingChanged: (rating) {
                  debugPrint('Rating: $rating');
                },
              ),
            ),
            SizedBox(height: 20),
            Text('Stars',style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),),
            Center(
              child: CustomRatingBar(
                itemCount: 5,
                allowHalfRating: false,
                size: 40,
                initialRating: 0,
                animationDuration: Duration(microseconds: 2),
                iconType: RatingIconType.star,
                onRatingChanged: (rating) {
                  debugPrint('Rating: $rating');
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
