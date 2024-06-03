import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_aviasales_app/icons/custom_icons_icons.dart';
import 'package:intl/intl.dart';
import '../styles/color/colors.dart';
import '../styles/font/text_styles.dart';

void showSecondSearchModal(
  BuildContext context,
  TextEditingController controllerWhere,
  TextEditingController controllerFrom,
) {
  DateTime? selectedDate;

  showModalBottomSheet(
    isScrollControlled: true,
    context: context,
    builder: (BuildContext context) {
      //made for reverse
      return StatefulBuilder(
        builder: (BuildContext context, StateSetter setState) {
          void swapLocations() {
            String tempFrom = controllerFrom.text;
            String tempWhere = controllerWhere.text;
            setState(() {
              controllerFrom.text = tempWhere;
              controllerWhere.text = tempFrom;
            });
          }

          return Container(
            margin: const EdgeInsets.only(top: 40),
            padding: const EdgeInsets.symmetric(horizontal: 16),
            decoration: BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.circular(16),
            ),
            child: Center(
              child: Column(
                children: <Widget>[
                  const SizedBox(
                    height: 47,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      color: MyColors.lightGrey,
                    ),
                    child: Column(
                      children: [
                        TextFormField(
                          controller: controllerFrom,
                          textAlignVertical: TextAlignVertical.center,
                          textAlign: TextAlign.start,
                          decoration: InputDecoration(
                            suffixIcon: Container(
                              padding: const EdgeInsets.only(right: 5, top: 5),
                              child: IconButton(
                                onPressed: () {
                                  swapLocations();
                                },
                                icon: const Icon(CustomIcons.up_and_down),
                              ),
                            ),
                            //for text
                            contentPadding:
                                const EdgeInsets.only(left: 20, top: 20),
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
                          textAlign: TextAlign.start,
                          controller: controllerWhere,
                          decoration: InputDecoration(
                            contentPadding:
                                const EdgeInsets.only(left: 20, top: 5),
                            suffixIcon: Container(
                              padding:
                                  const EdgeInsets.only(right: 5, bottom: 5),
                              child: IconButton(
                                onPressed: () {
                                  controllerWhere.clear();
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
                  const SizedBox(height: 13),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              foregroundColor: Colors.white),
                          onPressed: () async {
                            final DateTime? pickedDate = await showDatePicker(
                              context: context,
                              locale: const Locale('ru'),
                              initialDate: selectedDate ?? DateTime.now(),
                              firstDate: DateTime(2000),
                              lastDate: DateTime(2100),
                            );

                            if (pickedDate != null) {
                              setState(() {
                                selectedDate = pickedDate;
                              });
                            }
                          },
                          child: Row(
                            children: [
                              if (selectedDate == null) ...[
                                const Icon(CustomIcons.plus, size: 16),
                                const SizedBox(width: 8),
                              ],
                              Text(selectedDate != null
                                  ? DateFormat('dd MMM, E', 'ru')
                                      .format(selectedDate!)
                                  : 'обратно'),
                            ],
                          ),
                        ),
                        const SizedBox(width: 8),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              foregroundColor: Colors.white),
                          onPressed: () async {
                            final DateTime? pickedDate = await showDatePicker(
                              context: context,
                              locale: const Locale('ru'),
                              initialDate: selectedDate ?? DateTime.now(),
                              firstDate: DateTime(2000),
                              lastDate: DateTime(2100),
                            );

                            if (pickedDate != null) {
                              setState(() {
                                selectedDate = pickedDate;
                              });
                            }
                          },
                          child: Text(
                            selectedDate != null
                                ? DateFormat('dd MMM, E', 'ru')
                                    .format(selectedDate!)
                                : DateFormat('dd MMM, E', 'ru').format(
                                    DateTime.now(),
                                  ),
                          ),
                        ),
                        const SizedBox(width: 8),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              foregroundColor: Colors.white),
                          onPressed: () {},
                          child: const Row(
                            children: [
                              Icon(CustomIcons.user_small),
                              SizedBox(width: 8),
                              Text('1, эконом'),
                            ],
                          ),
                        ),
                        const SizedBox(width: 8),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              foregroundColor: Colors.white),
                          onPressed: () {},
                          child: const Icon(CustomIcons.settings),
                        ),
                      ],
                    ),
                  ),
                  //TODO: add flights
                  Container(
                    child: Column(
                      children: [
                        Text('Прямые рейсы', style: CustomTextStyle.title2),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      );
    },
  );
}
