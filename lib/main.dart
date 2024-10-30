import 'package:butter_project/data/data_menu.dart';
import 'package:butter_project/forgot_pass.dart';
import 'package:butter_project/home.dart';
import 'package:butter_project/login.dart';
import 'package:butter_project/table.dart';
// import 'package:butter_project/table.dart';
// import 'package:butter_project/table.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        debugShowCheckedModeBanner: false,
        home: Login_Page());
  }
}
