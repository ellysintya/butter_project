import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class No_Table extends StatefulWidget {
  const No_Table({super.key});

  @override
  State<No_Table> createState() => _No_TableState();
}

class _No_TableState extends State<No_Table> {
  List<int> no_table = [1,2,3,4,5,6];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          // Card(
          //   elevation: 7,
          //   color: Colors.blueAccent,
          //   child: Text("haiiii kamu no 999 yaa" ),
          // ),
          Expanded(
            child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10),
                itemCount: no_table.length,
                itemBuilder: (BuildContext context, index){
                  return GestureDetector(
                    child: Card(
                      elevation: 8,
                      color: Colors.blue,
                      child: ListTile(
                        // title: Text("${no_table[index]}"),
                        leading: CircleAvatar(
                          child: Text("${no_table[index]}"),
                        ),
                      ),
                    ),
                  );

                }),
          )
        ],
      ),
    );
  }
}







// class Coba extends StatefulWidget {
//   const Coba({super.key});
//
//   @override
//   State<Coba> createState() => _CobaState();
// }
//
// class _CobaState extends State<Coba> {
//   List<int> no_table = [1,2,3,4,5,6];
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Column(
//         children: [
//           Card(
//             elevation: 7,
//             color: Colors.blueAccent,
//             child: Text("haiiii kamu no 999 yaa" ),
//           ),
//           Expanded(
//             child: GridView.builder(
//                 gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//                     crossAxisCount: 2,
//                     crossAxisSpacing: 10,
//                     mainAxisSpacing: 10),
//                 itemCount: no_table.length,
//                 itemBuilder: (BuildContext context, index){
//                   return GestureDetector(
//                     child: Card(
//                       elevation: 8,
//                       color: Colors.blue,
//                       child: ListTile(
//                         title: Text("${no_table[index]}"),
//                         leading: CircleAvatar(
//                           child: Icon(Icons.person_add),
//                         ),
//                       ),
//                     ),
//                   );
//
//                 }),
//           )
//         ],
//       ),
//     );
//   }
// }
//
//
//
