import 'package:butter/models/product_models.dart';

class Cart {
  ProductModel? product;
  int? quantity;

  Cart({required this.product, required this.quantity});
}
