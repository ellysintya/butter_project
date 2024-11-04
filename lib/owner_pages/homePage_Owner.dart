import 'package:butter_app_project/login.dart';
import 'package:butter_app_project/owner_pages/infomasi_karyawan.dart';
import 'package:butter_app_project/owner_pages/menu.dart';
import 'package:flutter/material.dart';

class Front extends StatefulWidget {
  const Front({super.key});

  @override
  State<Front> createState() => _FrontState();
}

class _FrontState extends State<Front> {
  int current = 0;
  Widget bodyPage(int index) {
    if (index == 0) {
      return Menu();
    } else if (index == 1) {
      return DaftarKaryawan();
    } else {
      return Login();
    }
  }

  @override
  Widget build(BuildContext context) {
    // final myPost = Provider.of<PostingProvider>(context).myProfile;
    return Scaffold(
      body: bodyPage(current),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.home_outlined),
              label: 'Menu',
              activeIcon: Icon(Icons.home)),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: "Karyawan",
          ),
          BottomNavigationBarItem(icon: Icon(Icons.add), label: 'Add'),
        ],
        // selectedFontSize: double.maxFinite,
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.grey,
        currentIndex: current,
        onTap: (int index) {
          setState(() {
            current = index;
          });
        },
      ),
    );
  }
}