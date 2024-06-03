import 'package:flutter/material.dart';
import 'package:flutter_aviasales_app/icons/custom_icons_icons.dart';
import 'package:flutter_aviasales_app/styles/font/text_styles.dart';

final Map<int, String> imageUrls = {
  1: 'assets/images/first_image.png',
  2: 'assets/images/second_image.png',
  3: 'assets/images/third_image.png',
};

class ConcertCard extends StatelessWidget {
  const ConcertCard({
    super.key,
    required this.imageUrl,
    required this.title,
    required this.town,
    required this.price,
  });

  final String imageUrl; //image
  final String title;
  final String town;
  final String price;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 133,
      height: 216,
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              image: DecorationImage(
                  image: AssetImage(imageUrl), fit: BoxFit.cover),
            ),
            height: 132,
            width: 133,
          ),
          const SizedBox(height: 8),
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              title,
              style: CustomTextStyle.textSearch,
            ),
          ),
          const SizedBox(height: 4),
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              town,
              style: CustomTextStyle.title4,
            ),
          ),
          const SizedBox(height: 4),
          Row(
            children: [
              const Icon(CustomIcons.airplane),
              Text(
                price,
                style: CustomTextStyle.title4,
              ),
            ],
          )
        ],
      ),
    );
  }
}
