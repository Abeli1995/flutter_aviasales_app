import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_aviasales_app/icons/custom_icons_icons.dart';
import 'package:flutter_aviasales_app/styles/color/colors.dart';
import 'package:flutter_aviasales_app/styles/font/text_styles.dart';
import 'package:flutter_aviasales_app/widgets/concert_card.dart';
import '../../../data/models/offer_model.dart';
import '../../../data/services/api_service.dart';
import '../../search_modal.dart';

class AviasalesScreen extends StatefulWidget {
  const AviasalesScreen({super.key});

  @override
  State<AviasalesScreen> createState() => _AviasalesScreenState();
}

class _AviasalesScreenState extends State<AviasalesScreen> {
  List<Offer> offers = [];

  //может удалить _controllerTo?
  final TextEditingController _controllerTo = TextEditingController();
  final TextEditingController _controllerWhere = TextEditingController();

  @override
  void initState() {
    super.initState();
    fetchOffers();
  }

//TODO: add shared prefs to store the data in first input

  Future<void> fetchOffers() async {
    try {
      final apiService = ApiService();
      final fetchedOffers = await apiService.fetchOffers();
      setState(() {
        offers = fetchedOffers;
      });
    } catch (e) {
      print('Failed to load offers: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(120.0),
        child: AppBar(
          toolbarHeight: 120,
          title: const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Поиск дешевых\n   авиабилетов',
                style: TextStyle(
                  fontSize: 22,
                  fontFamily: 'SF-Pro-Display-Semibold',
                ),
              ),
            ],
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            Container(
              // height: 130,
              // width: 500,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                color: MyColors.darkGrey,
              ),
              child: Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  color: MyColors.lightGrey,
                ),
                child: Column(
                  children: [
                    Row(
                      children: [
                        const Padding(
                          padding: EdgeInsets.only(top: 40, right: 10),
                          child:
                              //TODO: change to custom Icon (something wrong when adding
                              Icon(
                            CustomIcons.search,
                            color: Colors.black,
                          ),
                        ),
                        Expanded(
                          child: TextFormField(
                            controller: _controllerWhere,
                            decoration: InputDecoration(
                              border: const UnderlineInputBorder(),
                              hintText: 'Откуда - Москва',
                              hintStyle: CustomTextStyle.textSearch,
                            ),
                            inputFormatters: [
                              FilteringTextInputFormatter.allow(
                                  RegExp(r'[а-яА-ЯёЁ]')),
                            ],
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 35),
                      child: GestureDetector(
                        onTap: () {
                          showCustomModalBottomSheet(
                            context,
                            _controllerWhere,
                            _controllerTo,
                          );
                        },
                        child: AbsorbPointer(
                          child: TextFormField(
                            // controller: _controllerWhere,
                            decoration: InputDecoration(
                              hintText: 'Куда - Турция',
                              hintStyle: CustomTextStyle.textSearch,
                              border: InputBorder.none,
                            ),
                            inputFormatters: [
                              FilteringTextInputFormatter.allow(
                                RegExp(r'[а-яА-ЯёЁ]'),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 32),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Музыкально отлететь',
                style: CustomTextStyle.title1,
              ),
            ),
            const SizedBox(height: 25),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: offers
                    .map(
                      (offer) => Padding(
                        padding: const EdgeInsets.only(right: 67),
                        child: ConcertCard(
                          imageUrl: imageUrls[offer.id] ?? '',
                          title: offer.title,
                          town: offer.town,
                          price: 'от ${offer.price} Р',
                        ),
                      ),
                    )
                    .toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _controllerWhere.dispose();
    _controllerTo.dispose();
    super.dispose();
  }
}
