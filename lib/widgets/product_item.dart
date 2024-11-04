import 'package:butter_app_project/const.dart';
import 'package:butter_app_project/model/product_models.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProductItem extends StatefulWidget {
  final ProductModel product;

  const ProductItem({
    Key? key,
    required this.product,
  }) : super(key: key);

  @override
  _ProductItemState createState() => _ProductItemState();
}

class _ProductItemState extends State<ProductItem> {
  int quantity = 0;


  Future<void> _updateQuantity(int delta) async {
    setState(() {
      quantity += delta;
      if (quantity < 0) quantity = 0;
    });

    // Save order to SharedPreferences
    final prefs = await SharedPreferences.getInstance();
    List<String> orders = prefs.getStringList('orders') ?? [];

    String orderEntry = '${widget.product.name}: $quantity';
    if (orders.contains(orderEntry)) {
      orders.remove(orderEntry);
    }
    orders.add(orderEntry);

    await prefs.setStringList('orders', orders);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        alignment: AlignmentDirectional.bottomCenter,
        children: [
          Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
                color: white,
                borderRadius: BorderRadius.circular(30),
                boxShadow: [
                  BoxShadow(
                      color: grey.withOpacity(0.5),
                      spreadRadius: 5,
                      blurRadius: 5,
                      offset: const Offset(2, 5))
                ]),
          ),
          Container(
            width: MediaQuery.of(context).size.width / 2,
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Hero(
                  tag: widget.product.name,
                  child: Image.asset(
                    'assets/${widget.product.imageCard}',
                    width: 100,
                    height: 50,
                    fit: BoxFit.fill,
                  ),
                ),
                const SizedBox(height: 20),
                Text(
                  widget.product.name,
                  maxLines: 1,
                  style: poppins.copyWith(
                      color: black, fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 12),
                RichText(
                    text: TextSpan(
                        style: poppins.copyWith(fontWeight: FontWeight.bold),
                        children: [
                      TextSpan(
                          text: '${widget.product.formattedPrice}',
                          style: poppins.copyWith(fontSize: 22, color: black)),
                    ])),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                      icon: const Icon(Icons.remove),
                      onPressed: () => _updateQuantity(-1),

                    ),
                    Text(
                      '$quantity',
                      style: poppins.copyWith(fontSize: 20),
                    ),
                    IconButton(
                      icon: const Icon(Icons.add),
                      onPressed: () => _updateQuantity(1),
                    ),
                    ElevatedButton(
                      onPressed: () {

                      },
                      child: Text('Orders'),
                    )
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}