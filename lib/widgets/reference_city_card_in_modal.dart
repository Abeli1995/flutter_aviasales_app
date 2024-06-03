import 'package:flutter/material.dart';
import 'package:flutter_aviasales_app/styles/color/colors.dart';
import 'package:flutter_aviasales_app/widgets/search_modal_second.dart';

class ReferenceCityCard extends StatelessWidget {
  const ReferenceCityCard({
    super.key,
    required this.title,
    required this.imageUrl,
    required this.onTap,
    required this.controllerTo,
    required this.controllerWhere,
  });

  final String title;
  final String imageUrl;
  final VoidCallback onTap;
  final TextEditingController controllerTo;
  final TextEditingController controllerWhere;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: () {
            onTap();
            showSecondSearchModal(
              context,
              //TODO: add right controllers
              controllerTo,
              controllerWhere,
            );
          },
          child: Row(
            children: [
              Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  // color: Colors.red,
                  borderRadius: BorderRadius.circular(8),
                  image: DecorationImage(
                    image: AssetImage(imageUrl),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(
                width: 8,
                height: 8,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontFamily: 'SF-Pro-Display-Semibold',
                    ),
                  ),
                  const Text(
                    'Популярное направление',
                    style: TextStyle(
                      fontSize: 14,
                      fontFamily: 'SF-Pro-Display-Regular',
                      color: MyColors.superLightGrey,
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 4),
          child: Divider(
            color: MyColors.superLightGrey,
          ),
        ),
      ],
    );
  }
}
