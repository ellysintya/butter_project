//
//
// import 'package:flutter/material.dart';
//
// class UpdateData extends StatefulWidget {
//   final String nama;
//   UpdateData({super.key, required this.nama});
//
//   @override
//   State<UpdateData> createState() => _UpdateDataState();
// }
//
// class _UpdateDataState extends State<UpdateData> {
//   final _fromKey = GlobalKey<FormState>();
//   late TextEditingController nama;
//   TextEditingController _changePass = TextEditingController();
//   // late TextEditingController nim ;
//
//   @override
//   void initState() {
//     super.initState();
//     nama = TextEditingController(text: widget.nama);
//   }
//
//   void dispose() {
//     _changePass.dispose();
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Container(
//         padding: EdgeInsets.all(20),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             TextField(
//               controller: nama,
//               decoration: InputDecoration(
//                   enabledBorder: OutlineInputBorder(),
//                   focusedBorder: OutlineInputBorder(),
//                   prefixIcon: Icon(Icons.person_2)),
//             ),
//             SizedBox(height: 30),
//             TextField(
//               controller: _changePass,
//               decoration: InputDecoration(
//                   enabledBorder: OutlineInputBorder(),
//                   focusedBorder: OutlineInputBorder(),
//                   prefixIcon: Icon(Icons.lock)),
//             ),
//             SizedBox(height: 30),
//             ElevatedButton(
//               onPressed: () {},
//               child: Text("simpan perubahan"),
//               style: ElevatedButton.styleFrom(
//                   backgroundColor: Color(0XFF850000),
//                   foregroundColor: Colors.white),
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }
