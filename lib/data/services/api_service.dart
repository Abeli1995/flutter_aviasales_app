import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/offer_model.dart';

class ApiService {
  static const String _url =
      'https://run.mocky.io/v3/214a1713-bac0-4853-907c-a1dfc3cd05fd';

  Future<List<Offer>> fetchOffers() async {
    final response = await http.get(Uri.parse(_url));

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      return (data['offers'] as List)
          .map((offerJson) => Offer.fromJson(offerJson))
          .toList();
    } else {
      throw Exception('Failed to load offers');
    }
  }
}
