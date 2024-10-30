import 'package:intl/intl.dart';

class ProductModel {
  String imageCard, name;
  String formattedPrice;

  var price;

  ProductModel({
    required this.imageCard,
    required this.name,
    required double price,
    // required this.description,
  }) : formattedPrice = NumberFormat.currency(
            locale: 'id_ID', symbol: 'Rp', decimalDigits: 0).format(price); // Format price when initializing
}

class Special {
  final String name, image;

  Special({required this.name, required this.image});
}

List<ProductModel> products = [
  ProductModel(
      imageCard: 'category/Liong Tahu.jpg',
      name: 'Liong Tahu',
      price: 55000,
      ),
];

