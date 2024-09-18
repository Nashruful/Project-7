import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class MyProjectCardClosed extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 8),
      child: Container(
        height: 108,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.3),
              spreadRadius: 2,
              blurRadius: 5,
              offset: Offset(0, 3),
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 117.79,
                height: 94,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(19),
                  color: Color(0x4E2EB5),
                ),
                child: Center(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(19),
                    child: Image.asset(
                      'assets/logo.png',
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Flutter Bootcamp',
                        style: TextStyle(
                          fontSize: 9,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFFC4C4C4),
                        ),
                      ),
                      SizedBox(height: 2),
                      const Text(
                        'Lorem ipsum sfgl...',
                        style: TextStyle(
                          color: Color(0xFF4E2EB5),
                          fontSize: 15,
                        ),
                      ),
                      SizedBox(height: 2),
                      RatingBar.builder(
                        itemSize: 16,
                        initialRating: 5,
                        minRating: 1,
                        direction: Axis.horizontal,
                        allowHalfRating: false,
                        itemCount: 5,
                        itemBuilder: (context, _) => Icon(
                          Icons.star,
                          color: Colors.amber,
                        ),
                        onRatingUpdate: (rating) {},
                      ),
                      const Text(
                        'App',
                        style: TextStyle(
                          color: Color(0xFFC4C4C4),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Center(
                  child: IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.edit_off_outlined,
                        color: Color(0xFF4E2EB5),
                      )))
            ],
          ),
        ),
      ),
    );
  }
}
