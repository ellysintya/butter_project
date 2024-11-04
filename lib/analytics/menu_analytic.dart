// import 'package:flutter/material.dart';
// import 'package:firebase_core/firebase_core.dart';
// import 'package:firebase_analytics/firebase_analytics.dart';
//
// class Menu_Analytic extends StatefulWidget {
//   const Menu_Analytic({super.key});
//
//   @override
//   State<Menu_Analytic> createState() => _MenuAnalyticState();
// }
//
// class _MenuAnalyticState extends State<Menu_Analytic> {
//   FirebaseAnalytics analytics = FirebaseAnalytics.instance;
//
//   Future<void> afterClick(int index) async {
//     setState(() {
//     });
//     await analytics.logEvent(
//       name: 'Tombol_plus_$index',
//       parameters: {'event_count': counters[index]},
//     );
//   }
//
//   Future<void> decrementCounter(int index) async {
//     if (counters[index] > 1) {
//       setState(() {
//         counters[index]--;
//       });
//       await analytics.logEvent(
//         name: 'tombol_min_$index',
//         parameters: {'event_count': counters[index]},
//       );
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text("Counter"),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(8.0),
//         child: GridView.builder(
//           gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//             crossAxisCount: 2,
//             childAspectRatio: 3,
//             crossAxisSpacing: 10,
//             mainAxisSpacing: 10,
//           ),
//           itemCount: counters.length,
//           itemBuilder: (BuildContext context, int index) {
//             bool isEven = index % 2 == 0;
//             return Card(
//               color: Colors.blue,
//               // child: GestureDetector(
//               //   onTap: () {
//               //     if (isEven) {
//               //       incrementCounter(index);
//               //     } else {
//               //       decrementCounter(index);
//               //     }
//               //   },
//               //   child: Center(
//               //     child: Text("Tombol ${index + 1}"),
//               //   ),
//               // )
//               // color: isEven ? Colors.green : Colors.red,
//               child: ElevatedButton(
//                 onPressed: () {
//                   if (isEven) {
//                     incrementCounter(index);
//                   } else {
//                     decrementCounter(index);
//                   }
//                 },
//                 child: Text("Tombol ${index+1}"),
//                 style: ElevatedButton.styleFrom(
//                     backgroundColor: Colors.blue
//                 ),
//               ),
//             );
//           },
//         ),
//       ),
//     );
//   }
// }