import 'dart:developer';

import 'package:butter_project/data%20base/data_karyawan.dart';
import 'package:butter_project/data%20base/model.dart';
import 'package:flutter/material.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  KaryawanDB Karyawan = KaryawanDB();
  bool Obscured_Daftar = true;
  TextEditingController _passDaftar = TextEditingController();
  TextEditingController _Username = TextEditingController();
  TextEditingController _no_telepon = TextEditingController();
  TextEditingController _email = TextEditingController();

  @override
  void dispose() {
    _passDaftar.dispose();
    _Username.dispose();
    _no_telepon.dispose();
    _email.dispose();
    super.dispose();
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
      content: Container(
        // width: MediaQuery.of(context).size.width,
        // height: MediaQuery.of(context).size.height,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextField(
              controller: _Username,
              decoration: InputDecoration(
                  labelText: 'username',
                  labelStyle: TextStyle(
                      color: Color(0xff800000),
                      // fontWeight: FontWeight.bold,
                      fontSize: 10),
                  prefixIcon: Icon(
                    Icons.supervised_user_circle_outlined, color: Colors.black,
                    // Color(0xff800000),
                    size: 30,
                  ),
                  focusedBorder: OutlineInputBorder(
                      // borderSide: BorderSide(color: Color(0xff800000)),
                      borderRadius: BorderRadius.circular(30)),
                  enabledBorder: OutlineInputBorder(
                      // borderSide: BorderSide(color: Color(0xff800000)),
                      borderRadius: BorderRadius.circular(30))),
              style: TextStyle(
                color: Colors.black,
              ),
            ),
            SizedBox(height: 50),
            TextField(
              controller: _passDaftar,
              decoration: InputDecoration(
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                labelText: "Password",
                labelStyle: TextStyle(
                  color: Color(0xff800000),
                  fontSize: 10,
                ),
                prefixIcon: Icon(
                  Icons.lock,
                  color: Colors.black,
                ),
                suffixIcon: IconButton(
                  onPressed: () {
                    setState(() {
                      Obscured_Daftar = !Obscured_Daftar;
                    });
                  },
                  icon: Icon(
                    Obscured_Daftar ? Icons.visibility_off : Icons.visibility,
                    color: Colors.black,
                  ),
                ),
              ),
              obscureText: Obscured_Daftar,
            ),
            TextField(
              controller: _email,
              decoration: InputDecoration(
                  labelText: 'email',
                  labelStyle: TextStyle(
                      color: Color(0xff800000),
                      // fontWeight: FontWeight.bold,
                      fontSize: 10),
                  prefixIcon: Icon(
                    Icons.supervised_user_circle_outlined, color: Colors.black,
                    // Color(0xff800000),
                    size: 30,
                  ),
                  focusedBorder: OutlineInputBorder(
                      // borderSide: BorderSide(color: Color(0xff800000)),
                      borderRadius: BorderRadius.circular(30)),
                  enabledBorder: OutlineInputBorder(
                      // borderSide: BorderSide(color: Color(0xff800000)),
                      borderRadius: BorderRadius.circular(30))),
              style: TextStyle(
                color: Colors.black,
              ),
            ),
            TextField(
              controller: _no_telepon,
              decoration: InputDecoration(
                  labelText: 'no telepon',
                  labelStyle: TextStyle(
                      color: Color(0xff800000),
                      // fontWeight: FontWeight.bold,
                      fontSize: 10),
                  prefixIcon: Icon(
                    Icons.supervised_user_circle_outlined, color: Colors.black,
                    // Color(0xff800000),
                    size: 30,
                  ),
                  focusedBorder: OutlineInputBorder(
                      // borderSide: BorderSide(color: Color(0xff800000)),
                      borderRadius: BorderRadius.circular(30)),
                  enabledBorder: OutlineInputBorder(
                      // borderSide: BorderSide(color: Color(0xff800000)),
                      borderRadius: BorderRadius.circular(30))),
              style: TextStyle(
                color: Colors.black,
              ),
            ),
            SizedBox(height: 50),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  Karyawan.insert(MdKaryawan(
                      nama: _Username.text,
                      pass: _passDaftar.text,
                      email: _email.text,
                      no_telp: int.parse(_no_telepon.text)));
                });
                Navigator.of(context).pop();
              },
              child: Text("Create"),
              style: ElevatedButton.styleFrom(
                fixedSize: Size(MediaQuery.of(context).size.width, 50),
                foregroundColor: Colors.white,
                backgroundColor: Color(0xff800000),
                elevation: 5,
                surfaceTintColor: Color(0xff800000),
                shadowColor: Color(0xff800000),
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
