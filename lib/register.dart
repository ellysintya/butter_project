// //
// //
// // import 'package:butter_project/data%20base/data_karyawan.dart';
// // import 'package:butter_project/data%20base/model.dart';
// // import 'package:flutter/material.dart';
// //
// // class Register extends StatefulWidget {
// //   const Register({super.key});
// //
// //   @override
// //   State<Register> createState() => _RegisterState();
// // }
// //
// // class _RegisterState extends State<Register> {
// //   KaryawanDB Karyawan = KaryawanDB();
// //   bool Obscured_Daftar = true;
// //   TextEditingController _passDaftar = TextEditingController();
// //   TextEditingController _Username = TextEditingController();
// //   TextEditingController _no_telepon = TextEditingController();
// //   TextEditingController _email = TextEditingController();
// //
// //   @override
// //   void dispose() {
// //     _passDaftar.dispose();
// //     _Username.dispose();
// //     _no_telepon.dispose();
// //     _email.dispose();
// //     super.dispose();
// //   }
// //
// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //         body: AlertDialog(
// //       backgroundColor: Colors.white,
// //       title: Text(
// //         "Create an account",
// //         textAlign: TextAlign.center,
// //       ),
// //       content: Container(
// //         // width: MediaQuery.of(context).size.width,
// //         // height: MediaQuery.of(context).size.height,
// //         child: Column(
// //           mainAxisSize: MainAxisSize.min,
// //           mainAxisAlignment: MainAxisAlignment.center,
// //           crossAxisAlignment: CrossAxisAlignment.center,
// //           children: [
// //             TextField(
// //               controller: _Username,
// //               decoration: InputDecoration(
// //                   labelText: 'username',
// //                   labelStyle: TextStyle(
// //                       color: Color(0xff800000),
// //                       // fontWeight: FontWeight.bold,
// //                       fontSize: 10),
// //                   prefixIcon: Icon(
// //                     Icons.supervised_user_circle_outlined, color: Colors.black,
// //                     // Color(0xff800000),
// //                     size: 30,
// //                   ),
// //                   focusedBorder: OutlineInputBorder(
// //                       // borderSide: BorderSide(color: Color(0xff800000)),
// //                       borderRadius: BorderRadius.circular(30)),
// //                   enabledBorder: OutlineInputBorder(
// //                       // borderSide: BorderSide(color: Color(0xff800000)),
// //                       borderRadius: BorderRadius.circular(30))),
// //               style: TextStyle(
// //                 color: Colors.black,
// //               ),
// //             ),
// //             SizedBox(height: 50),
// //             TextField(
// //               controller: _passDaftar,
// //               decoration: InputDecoration(
// //                 focusedBorder: OutlineInputBorder(
// //                   borderRadius: BorderRadius.circular(30),
// //                 ),
// //                 enabledBorder: OutlineInputBorder(
// //                   borderRadius: BorderRadius.circular(30),
// //                 ),
// //                 labelText: "Password",
// //                 labelStyle: TextStyle(
// //                   color: Color(0xff800000),
// //                   fontSize: 10,
// //                 ),
// //                 prefixIcon: Icon(
// //                   Icons.lock,
// //                   color: Colors.black,
// //                 ),
// //                 suffixIcon: IconButton(
// //                   onPressed: () {
// //                     setState(() {
// //                       Obscured_Daftar = !Obscured_Daftar;
// //                     });
// //                   },
// //                   icon: Icon(
// //                     Obscured_Daftar ? Icons.visibility_off : Icons.visibility,
// //                     color: Colors.black,
// //                   ),
// //                 ),
// //               ),
// //               obscureText: Obscured_Daftar,
// //             ),
// //             TextField(
// //               controller: _email,
// //               decoration: InputDecoration(
// //                   labelText: 'email',
// //                   labelStyle: TextStyle(
// //                       color: Color(0xff800000),
// //                       // fontWeight: FontWeight.bold,
// //                       fontSize: 10),
// //                   prefixIcon: Icon(
// //                     Icons.supervised_user_circle_outlined, color: Colors.black,
// //                     // Color(0xff800000),
// //                     size: 30,
// //                   ),
// //                   focusedBorder: OutlineInputBorder(
// //                       // borderSide: BorderSide(color: Color(0xff800000)),
// //                       borderRadius: BorderRadius.circular(30)),
// //                   enabledBorder: OutlineInputBorder(
// //                       // borderSide: BorderSide(color: Color(0xff800000)),
// //                       borderRadius: BorderRadius.circular(30))),
// //               style: TextStyle(
// //                 color: Colors.black,
// //               ),
// //             ),
// //             TextField(
// //               controller: _no_telepon,
// //               decoration: InputDecoration(
// //                   labelText: 'no telepon',
// //                   labelStyle: TextStyle(
// //                       color: Color(0xff800000),
// //                       // fontWeight: FontWeight.bold,
// //                       fontSize: 10),
// //                   prefixIcon: Icon(
// //                     Icons.supervised_user_circle_outlined, color: Colors.black,
// //                     // Color(0xff800000),
// //                     size: 30,
// //                   ),
// //                   focusedBorder: OutlineInputBorder(
// //                       // borderSide: BorderSide(color: Color(0xff800000)),
// //                       borderRadius: BorderRadius.circular(30)),
// //                   enabledBorder: OutlineInputBorder(
// //                       // borderSide: BorderSide(color: Color(0xff800000)),
// //                       borderRadius: BorderRadius.circular(30))),
// //               style: TextStyle(
// //                 color: Colors.black,
// //               ),
// //             ),
// //             SizedBox(height: 50),
// //             ElevatedButton(
// //               onPressed: () {
// //                 setState(() {
// //                   Karyawan.insert(MdKaryawan(
// //                       nama: _Username.text,
// //                       pass: _passDaftar.text,
// //                       email: _email.text,
// //                       no_telp: int.parse(_no_telepon.text)));
// //                 });
// //                 Navigator.of(context).pop();
// //               },
// //               child: Text("Create"),
// //               style: ElevatedButton.styleFrom(
// //                 fixedSize: Size(MediaQuery.of(context).size.width, 50),
// //                 foregroundColor: Colors.white,
// //                 backgroundColor: Color(0xff800000),
// //                 elevation: 5,
// //                 surfaceTintColor: Color(0xff800000),
// //                 shadowColor: Color(0xff800000),
// //               ),
// //             ),
// //           ],
// //         ),
// //       ),
// //     ));
// //   }
// // }
// import 'dart:developer';
//
// import 'package:butter_project/data%20base/data_karyawan.dart';
// import 'package:butter_project/data%20base/model.dart';
// import 'package:flutter/material.dart';
//
// class Register extends StatefulWidget {
//   const Register({super.key});
//
//   @override
//   State<Register> createState() => _RegisterState();
// }
//
// class _RegisterState extends State<Register> {
//   KaryawanDB karyawanDB = KaryawanDB();
//   bool isObscuredDaftar = true;
//   TextEditingController _passDaftar = TextEditingController();
//   TextEditingController _username = TextEditingController();
//   TextEditingController _noTelepon = TextEditingController();
//   TextEditingController _email = TextEditingController();
//
//   @override
//   void dispose() {
//     _passDaftar.dispose();
//     _username.dispose();
//     _noTelepon.dispose();
//     _email.dispose();
//     super.dispose();
//   }
//   void resetDB() async {
//     Service services = Service();
//     await services.resetDatabase();
//   }
//
//
//   void _createAccount() async {
//     if (_username.text.isEmpty ||
//         _passDaftar.text.isEmpty ||
//         _email.text.isEmpty ||
//         _noTelepon.text.isEmpty) {
//       // Tampilkan pesan kesalahan jika input kosong
//       _showDialog("All fields are required.");
//       return;
//     }
//
//     // Cek apakah format email valid (sederhana)
//     if (!_email.text.contains('@')) {
//       _showDialog("Invalid email format.");
//       return;
//     }
//
//     try {
//       // Menyimpan data karyawan
//       await karyawanDB.insert(MdKaryawan(
//           nama: _username.text,
//           pass: _passDaftar.text,
//           email: _email.text,
//           no_telp: int.parse(_noTelepon.text)));
//
//       // Berhasil membuat akun
//       _showDialog("Account created successfully!");
//       Navigator.of(context).pop(); // Tutup dialog registrasi
//     } catch (e) {
//       // Tangani kesalahan
//       _showDialog("Failed to create account: $e");
//     }
//   }
//
//   void _showDialog(String message) {
//     showDialog(
//       context: context,
//       builder: (BuildContext context) {
//         return AlertDialog(
//           title: Text("Notice"),
//           content: Text(message),
//           actions: [
//             TextButton(
//               onPressed: () {
//                 Navigator.of(context).pop();
//               },
//               child: Text("OK"),
//             ),
//           ],
//         );
//       },
//     );
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: AlertDialog(
//         backgroundColor: Colors.white,
//         title: Text(
//           "Create an account",
//           textAlign: TextAlign.center,
//         ),
//         content: Container(
//           child: Column(
//             mainAxisSize: MainAxisSize.min,
//             mainAxisAlignment: MainAxisAlignment.center,
//             crossAxisAlignment: CrossAxisAlignment.center,
//             children: [
//               TextField(
//                 controller: _username,
//                 decoration: InputDecoration(
//                   labelText: 'Username',
//                   labelStyle: TextStyle(
//                     color: Color(0xff800000),
//                     fontSize: 10,
//                   ),
//                   prefixIcon: Icon(Icons.supervised_user_circle_outlined,
//                       color: Colors.black, size: 30),
//                   focusedBorder: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(30),
//                   ),
//                   enabledBorder: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(30),
//                   ),
//                 ),
//                 style: TextStyle(
//                   color: Colors.black,
//                 ),
//               ),
//               SizedBox(height: 50),
//               TextField(
//                 controller: _passDaftar,
//                 decoration: InputDecoration(
//                   focusedBorder: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(30),
//                   ),
//                   enabledBorder: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(30),
//                   ),
//                   labelText: "Password",
//                   labelStyle: TextStyle(
//                     color: Color(0xff800000),
//                     fontSize: 10,
//                   ),
//                   prefixIcon: Icon(Icons.lock, color: Colors.black),
//                   suffixIcon: IconButton(
//                     onPressed: () {
//                       setState(() {
//                         isObscuredDaftar = !isObscuredDaftar;
//                       });
//                     },
//                     icon: Icon(
//                       isObscuredDaftar
//                           ? Icons.visibility_off
//                           : Icons.visibility,
//                       color: Colors.black,
//                     ),
//                   ),
//                 ),
//                 obscureText: isObscuredDaftar,
//               ),
//               TextField(
//                 controller: _email,
//                 decoration: InputDecoration(
//                   labelText: 'Email',
//                   labelStyle: TextStyle(
//                     color: Color(0xff800000),
//                     fontSize: 10,
//                   ),
//                   prefixIcon: Icon(Icons.email, color: Colors.black, size: 30),
//                   focusedBorder: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(30),
//                   ),
//                   enabledBorder: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(30),
//                   ),
//                 ),
//                 style: TextStyle(
//                   color: Colors.black,
//                 ),
//               ),
//               TextField(
//                 controller: _noTelepon,
//                 decoration: InputDecoration(
//                   labelText: 'No Telepon',
//                   labelStyle: TextStyle(
//                     color: Color(0xff800000),
//                     fontSize: 10,
//                   ),
//                   prefixIcon: Icon(Icons.phone, color: Colors.black, size: 30),
//                   focusedBorder: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(30),
//                   ),
//                   enabledBorder: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(30),
//                   ),
//                 ),
//                 style: TextStyle(
//                   color: Colors.black,
//                 ),
//                 keyboardType: TextInputType.phone, // Menggunakan keyboard nomor
//               ),
//               SizedBox(height: 50),
//               ElevatedButton(
//                 onPressed: _createAccount,
//                 child: Text("Create"),
//                 style: ElevatedButton.styleFrom(
//                   fixedSize: Size(MediaQuery.of(context).size.width, 50),
//                   foregroundColor: Colors.white,
//                   backgroundColor: Color(0xff800000),
//                   elevation: 5,
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

import 'package:butter_app_project/data%20base/data_karyawan.dart';
import 'package:butter_app_project/data%20base/model.dart';
import 'package:butter_app_project/login.dart';
import 'package:butter_app_project/pages/home_page.dart';
import 'package:flutter/material.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  KaryawanDB karyawanDB = KaryawanDB();
  bool isObscuredDaftar = true;
  TextEditingController _passDaftar = TextEditingController();
  TextEditingController _username = TextEditingController();
  TextEditingController _noTelepon = TextEditingController();
  TextEditingController _email = TextEditingController();

  @override
  void dispose() {
    _passDaftar.dispose();
    _username.dispose();
    _noTelepon.dispose();
    _email.dispose();
    super.dispose();
  }

  void _createAccount() async {
    if (_username.text.isEmpty ||
        _passDaftar.text.isEmpty ||
        _email.text.isEmpty ||
        _noTelepon.text.isEmpty) {
      _showDialog("All fields are required.");
      return;
    }

    if (!_email.text.contains('@')) {
      _showDialog("Invalid email format.");
      return;
    }

    try {
      await karyawanDB.insert(MdKaryawan(
          nama: _username.text,
          pass: _passDaftar.text,
          email: _email.text,
          no_telp: int.parse(_noTelepon.text)));


      Navigator.of(context).push(MaterialPageRoute(builder: (context) => Login(),));
    } catch (e) {
      _showDialog("Failed to create account: $e");
    }
  }

  void _showDialog(String message) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Notice"),
          content: Text(message),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text("OK"),
            ),
          ],
        );
      },
    );
  }

  Widget _buildTextField(TextEditingController controller, String label, IconData prefixIcon, {bool obscureText = false}) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        labelText: label,
        labelStyle: TextStyle(color: Color(0xff800000), fontSize: 10),
        prefixIcon: Icon(prefixIcon, color: Colors.black, size: 30),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
        ),
      ),
      style: TextStyle(color: Colors.black),
      obscureText: obscureText,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AlertDialog(
        backgroundColor: Colors.white,
        title: Text(
          "Create an account",
          textAlign: TextAlign.center,
        ),
        content: SingleChildScrollView(
          child: Container(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                _buildTextField(_username, 'Username', Icons.supervised_user_circle_outlined),
                SizedBox(height: 50),
                _buildTextField(_passDaftar, 'Password', Icons.lock, obscureText: isObscuredDaftar),
                IconButton(
                  onPressed: () {
                    setState(() {
                      isObscuredDaftar = !isObscuredDaftar;
                    });
                  },
                  icon: Icon(
                    isObscuredDaftar ? Icons.visibility_off : Icons.visibility,
                    color: Colors.black,
                  ),
                ),
                _buildTextField(_email, 'Email', Icons.email),
                _buildTextField(_noTelepon, 'No Telepon', Icons.phone),
                SizedBox(height: 50),
                ElevatedButton(
                  onPressed: _createAccount,
                  child: Text("Create"),
                  style: ElevatedButton.styleFrom(
                    fixedSize: Size(MediaQuery.of(context).size.width, 50),
                    foregroundColor: Colors.white,
                    backgroundColor: Color(0xff800000),
                    elevation: 5,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

