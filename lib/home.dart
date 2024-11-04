import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:butter_app_project/data/data_menu.dart';



class Fitur_Home extends StatefulWidget implements PreferredSizeWidget{
  const Fitur_Home({super.key});


  @override
  State<Fitur_Home> createState() => _Fitur_HomeState();

  @override
  Size get preferredSize => Size.fromHeight(150);

}

class _Fitur_HomeState extends State<Fitur_Home> {
 int activeIndex = 0 ;
  @override
  Widget build(BuildContext context) {
    return AppBar(
          flexibleSpace: SingleChildScrollView(
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
              // crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                CarouselSlider(
                    items: [
                      Image(image: NetworkImage(
                          "https://media.istockphoto.com/id/1478964957/id/vektor/tahu-goreng-atau-tahu-bau-makanan-jalanan-tradisional-asia-vektor-ilustrasi-kartun.jpg?s=612x612&w=0&k=20&c=_NEzYiY43uOIcpltN7jaTabOrFJnqS4-N6TOu3jk4mQ="),
                        fit: BoxFit.fill,),
                      Image(image: NetworkImage("https://png.pngtree.com/png-vector/20221006/ourmid/pngtree-mie-ayam-png-image_6288625.png")),
                      Image(image: NetworkImage("https://png.pngtree.com/png-vector/20220710/ourmid/pngtree-spicy-chili-devil-noodles-illustration-vector-image-png-image_5830474.png")),
                      // Image(image: NetworkImage("https://i.gojekapi.com/darkroom/gofood-indonesia/v2/images/uploads/d97085a0-c243-486a-9816-da5c2562e39f_Go-Biz_20221118_211149.jpeg?auto=format"))
            
                    ],
                    options: CarouselOptions(
                        height: 150,
                        autoPlay: true,
                        viewportFraction: 1.0,
                      autoPlayCurve: Curves.fastOutSlowIn,
                      autoPlayAnimationDuration: Duration(milliseconds: 5000),
                      autoPlayInterval: Duration(seconds: 5),
                      enableInfiniteScroll: false,
                      aspectRatio: 2.0,
                      enlargeCenterPage: true,
                      onPageChanged: (index , reason){
                          setState(() {
                            activeIndex = index ;
                          });
                      }
                    )),

                // AnimatedSmoothIndicator(
                //     effect : WormEffect(
                //       dotColor: Colors.grey,
                //       dotHeight: 5,
                //       dotWidth: 18,
                //       spacing: 5
                //     ),
                //     activeIndex: activeIndex,
                //     count: widget.item.lenght),

                // Row(
                //   // crossAxisAlignment: CrossAxisAlignment.center,
                //   mainAxisAlignment: MainAxisAlignment.spaceAround,
                //   children: [
                //     Container(
                //       padding: EdgeInsets.all(20),
                //       width: 100,
                //       height: 200,
                //       decoration: BoxDecoration(
                //         borderRadius: BorderRadius.circular(30),
                //        border: Border.all(color: Colors.yellow),
                //         // color: Colors.black,
                //       ),
                //       child: Column(
                //         mainAxisAlignment: MainAxisAlignment.center,
                //         children: [
                //           Icon(Icons.table_restaurant_rounded , color: Colors.red, size: 40,),
                //           Text("Reserve the table" , style: TextStyle(fontSize: 10 , fontWeight: FontWeight.bold), textAlign: TextAlign.center,)
                //         ],
                //       ),
                //     ),
                //     Container(
                //       padding: EdgeInsets.all(20),
                //       width: 100,
                //       height: 200,
                //       decoration: BoxDecoration(
                //         borderRadius: BorderRadius.circular(30),
                //         border: Border.all(color: Colors.yellow),
                //         // color: Colors.black,
                //       ),
                //       child: Column(
                //         mainAxisAlignment: MainAxisAlignment.center,
                //         children: [
                //           Icon(Icons.menu_book, color: Colors.red, size: 40,),
                //           Text("Menu's" , style: TextStyle(fontSize: 10 , fontWeight: FontWeight.bold), textAlign: TextAlign.center,)
                //         ],
                //       ),
                //     ),
                //     Container(
                //       padding: EdgeInsets.all(20),
                //       width: 100,
                //       height: 200,
                //       decoration: BoxDecoration(
                //         borderRadius: BorderRadius.circular(30),
                //         border: Border.all(color: Colors.yellow),
                //         // color: Colors.black,
                //       ),
                //       child: Column(
                //         mainAxisAlignment: MainAxisAlignment.center,
                //         children: [
                //           CircleAvatar(
                //             backgroundColor: Colors.grey[100],
                //             radius: 40,
                //
                //             child:Icon(Icons.person, color: Colors.red, size: 30,),
                //           ),
                //
                //           Text("Daily Profit" , style: TextStyle(fontSize: 10 , fontWeight: FontWeight.bold), textAlign: TextAlign.center,)
                //         ],
                //       ),
                //     ),
                //   ],
                // )
              ],
            ),
          ),
        );
  }
}

class Fitur2 extends StatefulWidget {
  const Fitur2({super.key});

  @override
  State<Fitur2> createState() => _Fitur2State();
}

class _Fitur2State extends State<Fitur2> {
  final menu_mie = [...daftarMenu];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(30),
        // height: 200,
        child: Row(
          children: [
            Expanded(
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                // crossAxisSpacing: 10,
                ),
                  itemCount: menu_mie.length,
                  itemBuilder: (BuildContext context, index){
                    return Container(
                      child: Card(
                        elevation: 5,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Column(
                            children: [
                        Expanded(
                        child: Image(
                        image: NetworkImage(menu_mie[index].gambar),
                        fit: BoxFit.cover,
                        width: double.infinity,
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                    "Rp ${menu_mie[index].nama}",
                      style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    )),
                    Text("Rp ${menu_mie[index].harga}",
                    style: TextStyle(fontSize: 12 , fontWeight: FontWeight.bold, color: Colors.black),)
                            ],
                        )
                    )
                    );
                  }),
            )
          ],
        ),
      )
    );
  }
}

// class coba extends StatelessWidget {
//   const coba({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Container(
//         width: 300, // Lebar Card
//         height: 150, // Tinggi Card
//         child: Card(
//           elevation: 5, // Bayangan
//           child: Center(
//             child: Text('Card dengan ukuran ditentukan'),
//           ),
//         ),
//       )
//       ,
//     );
//   }
// }

