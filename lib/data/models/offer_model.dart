//модель для маленькой карточки в main

class Offer {
  final int id;
  final String title;
  final String town;
  final int price;

  Offer(
      {required this.id,
      required this.title,
      required this.town,
      required this.price});

  factory Offer.fromJson(Map<String, dynamic> json) {
    return Offer(
      id: json['id'],
      title: json['title'],
      town: json['town'],
      price: json['price']['value'],
    );
  }
}
