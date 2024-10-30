import 'dart:async';
import 'package:butter/const.dart';
import 'package:butter/models/categories_model.dart';
import 'package:butter/models/product_models.dart';
import 'package:butter/pages/order_page.dart';
import 'package:butter/widgets/category_item.dart';
import 'package:butter/widgets/product_item.dart';
import 'detail_Page.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentCategory = 0;
  final StreamController<List<Category>> _categoriesController =
      StreamController<List<Category>>();
  final StreamController<List<ProductModel>> _productsController =
      StreamController<List<ProductModel>>();

  @override
  void initState() {
    super.initState();
    _categoriesController.add(categories);
    _productsController.add(products);
  }

  @override
  void dispose() {
    _categoriesController.close();
    _productsController.close();
    super.dispose();
  }

  Future<List<String>> _loadOrders() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getStringList('orders') ?? [];
  }

  void _showOrders() async {
    List<String> orders = await _loadOrders();
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Your Orders'),
          content: SingleChildScrollView(
            child: ListBody(
              children: orders.isNotEmpty
                  ? orders.map((order) => Text(order)).toList()
                  : [Text('No orders placed')],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: Text('Close'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final isWideScreen = screenSize.width > 600; 
    return Scaffold(
      appBar: AppBar(
        backgroundColor: transparent,
        elevation: 0,
        centerTitle: true,
        leadingWidth: 80,
        leading: Row(
          children: [
            const SizedBox(width: 35),
            Container(
              width: 40,
              height: 40,
              padding: const EdgeInsets.all(7),
              decoration: BoxDecoration(
                  color: grey, borderRadius: BorderRadius.circular(10)),
              child: Image.asset('assets/icon/dash.png'),
            ),
          ],
        ),
        title: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(width: 5),
            Text(
              'Liong Tahu Metal',
              style: poppins.copyWith(fontSize: 16, color: black),
            ),
            const SizedBox(width: 5),
          ],
        ),
        actions: [
          Row(
            children: [
              Container(
                width: 40,
                height: 40,
                padding: const EdgeInsets.all(7),
                decoration: BoxDecoration(
                    color: grey, borderRadius: BorderRadius.circular(10)),
                child: Image.asset('assets/profile.png'),
              ),
              const SizedBox(width: 35),
            ],
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(vertical: 20),
        children: [
          const SizedBox(height: 30),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 35),
          ),
          const SizedBox(height: 35),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 35),
            child: Text(
              'Categories',
              style: poppins.copyWith(
                  color: black, fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          const SizedBox(height: 10),
          StreamBuilder<List<Category>>(
            stream: _categoriesController.stream,
            builder: (context, snapshot) {
              if (!snapshot.hasData) {
                return const Center(child: CircularProgressIndicator());
              }
              final categoriesData = snapshot.data!;
              return SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Row(
                  children: List.generate(
                    categoriesData.length,
                    (index) => Padding(
                      padding: EdgeInsets.only(
                        left: index == 0 ? 35 : 20,
                        right: index == categoriesData.length - 1 ? 35 : 20,
                      ),
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            currentCategory = index;
                          });
                        },
                        child: CategoryItem(
                          category: categoriesData[index],
                          selected: currentCategory == index,
                        ),
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 35),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'All Menu',
                  style: poppins.copyWith(
                      fontSize: 20, fontWeight: FontWeight.bold),
                ),
                // GestureDetector(
                //   onTap: _showOrders, // Show orders on tap
                //   child: Row(
                //     children: [
                //       Text(
                //         'View Orders',
                //         style: poppins.copyWith(color: orange, fontSize: 14),
                //       ),
                //       const SizedBox(width: 5),
                //       Container(
                //         padding: const EdgeInsets.all(3),
                //         decoration: BoxDecoration(
                //           color: orange,
                //           borderRadius: BorderRadius.circular(5),
                //         ),
                //         child: const Icon(
                //           Icons.arrow_forward_ios_rounded,
                //           color: white,
                //           size: 10,
                //         ),
                //       ),
                //     ],
                //   ),
                // ),
              ],
            ),
          ),
          const SizedBox(height: 20),
          StreamBuilder<List<ProductModel>>(
            stream: _productsController.stream,
            builder: (context, snapshot) {
              if (!snapshot.hasData) {
                return const Center(child: CircularProgressIndicator());
              }
              final productsData = snapshot.data!;
              return SizedBox(
                height: isWideScreen ? 600 : 500,
                child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: isWideScreen ? 5 : 2,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                  ),
                  scrollDirection: Axis.vertical,
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: productsData.length,
                  itemBuilder: (context, index) {
                    return ProductItem(
                      product: productsData[index],
                    );
                  },
                ),
              );
            },
          ),
        ],
      ),
      bottomNavigationBar: Container(
        height: 100,
        color: white,
        child: Align(
          alignment: Alignment.topCenter,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              const Icon(
                Icons.home_filled,
                color: red,
                size: 30,
              ),
              // const Icon(
              //   Icons.favorite_outline_rounded,
              //   color: grey,
              //   size: 30,
              // ),
              IconButton(
                icon: const Icon(Icons.receipt, color: grey, size: 30), // Added receipt icon
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => OrderPage())
                    );
                },
              ),
              const Icon(
                Icons.notifications_outlined,
                color: grey,
                size: 30,
              ),
              Stack(
                alignment: AlignmentDirectional.center,
                children: [
                  const Icon(
                    Icons.shopping_cart_outlined,
                    color: grey,
                    size: 30,
                  ),
                  // Positioned(
                  //   right: 0,
                  //   child: FutureBuilder<List<String>>(
                  //     future: _loadOrders(),
                  //     builder: (context, snapshot) {
                  //       if (!snapshot.hasData) {
                  //         return Container(); 
                  //       }
                  //       final orders = snapshot.data!;
                  //       return Container(
                  //         padding: const EdgeInsets.all(2),
                  //         decoration: const BoxDecoration(
                  //           shape: BoxShape.circle,
                  //           color: red,
                  //         ),
                  //         child: Text(
                  //           '${orders.length}', 
                  //           style: const TextStyle(
                  //             color: white,
                  //             fontSize: 12,
                  //           ),
                  //         ),
                  //       );
                  //     },
                  //   ),
                  // ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
