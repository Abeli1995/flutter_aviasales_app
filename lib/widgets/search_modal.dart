import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_aviasales_app/icons/custom_icons_icons.dart';
import 'package:flutter_aviasales_app/styles/color/colors.dart';
import 'package:flutter_aviasales_app/styles/font/text_styles.dart';
import 'package:flutter_aviasales_app/widgets/helper_card_in_modal.dart';
import 'package:flutter_aviasales_app/widgets/reference_city_card_in_modal.dart';
import 'package:flutter_aviasales_app/widgets/screens/modal_helper_screens/burning_ticket_screen.dart';
import 'package:flutter_aviasales_app/widgets/screens/modal_helper_screens/difficult_road_screen.dart';
import 'package:flutter_aviasales_app/widgets/screens/modal_helper_screens/weekend_screen.dart';

void showCustomModalBottomSheet(
  BuildContext context,
  TextEditingController controllerWhere,
  TextEditingController controllerTo,
) {
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    builder: (context) {
      return Container(
        margin: const EdgeInsets.only(top: 40),
        padding: const EdgeInsets.symmetric(horizontal: 16),
        decoration: BoxDecoration(
          color: MyColors.darkGrey,
          borderRadius: BorderRadius.circular(16),
        ),
        // height: double.infinity,
        child: Center(
          child: Column(
            // mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              //small line at the top
              Container(
                margin: const EdgeInsets.symmetric(vertical: 16),
                height: 5.0,
                width: 50.0,
                decoration: BoxDecoration(
                  color: MyColors.superLightGrey,
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    color: MyColors.lightGrey),
                child: Column(
                  children: [
                    TextFormField(
                      textAlignVertical: TextAlignVertical.center,
                      textAlign: TextAlign.start,
                      controller: controllerWhere,
                      decoration: InputDecoration(
                        contentPadding: const EdgeInsets.only(top: 16),
                        prefixIcon: const Icon(CustomIcons.airplane_second),
                        border: InputBorder.none,
                        hintStyle: CustomTextStyle.textSearch,
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16),
                      child: Divider(
                        color: MyColors.superLightGrey,
                      ),
                    ),
                    TextFormField(
                      controller: controllerTo,
                      decoration: InputDecoration(
                        prefixIcon: const Icon(
                          CustomIcons.search,
                          color: Colors.white,
                        ),
                        suffixIcon: Container(
                          padding: const EdgeInsets.only(right: 5, bottom: 5),
                          child: IconButton(
                            //TODO: add close feature with controller
                            onPressed: () {
                              controllerTo.clear();
                            },
                            icon: const Icon(Icons.clear),
                          ),
                        ),
                        hintText: 'Куда - Турция',
                        hintStyle: const TextStyle(
                          fontSize: 16,
                          fontFamily: 'SF-Pro-Display-Semibold',
                        ),
                        border: InputBorder.none,
                      ),
                      inputFormatters: [
                        FilteringTextInputFormatter.allow(
                            RegExp(r'[а-яА-ЯёЁ]')),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 24),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  //TODO: create custom to add others
                  HelperCard(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const DifficultRoad(),
                        ),
                      );
                    },
                    text: 'Сложный\n маршрут',
                    color: MyColors.green,
                    icon: CustomIcons.road_map,
                  ),
                  HelperCard(
                    onTap: () {
                      controllerTo.text = 'Куда угодно';
                    },
                    text: 'Куда угодно',
                    color: MyColors.specialBlue,
                    icon: CustomIcons.globe,
                  ),
                  HelperCard(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const WeekendScreen(),
                        ),
                      );
                    },
                    text: 'Выходные',
                    color: MyColors.specialDarkBlue,
                    icon: CustomIcons.calendart,
                  ),
                  HelperCard(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const BurningTicketScreen(),
                        ),
                      );
                    },
                    text: 'Горящие\n  билеты',
                    color: MyColors.specialRed,
                    icon: CustomIcons.fire,
                  ),
                ],
              ),
              Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 24, horizontal: 16),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  color: MyColors.lightGrey,
                ),
                child: Column(
                  children: [
                    ReferenceCityCard(
                      onTap: () {
                        controllerTo.text = 'Стамбул';
                      },
                      title: 'Стамбул',
                      imageUrl: 'assets/images/stambul.png',
                      controllerTo: controllerTo,
                      controllerWhere: controllerWhere,
                    ),
                    ReferenceCityCard(
                      onTap: () {
                        controllerTo.text = 'Сочи';
                      },
                      title: 'Сочи',
                      imageUrl: 'assets/images/sochi.png',
                      controllerTo: controllerTo,
                      controllerWhere: controllerWhere,
                    ),
                    ReferenceCityCard(
                      onTap: () {
                        controllerTo.text = 'Пхукет';
                      },
                      title: 'Пхукет',
                      imageUrl: 'assets/images/phuket.png',
                      controllerTo: controllerTo,
                      controllerWhere: controllerWhere,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      );
    },
  );
}
