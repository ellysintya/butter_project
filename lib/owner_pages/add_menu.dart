
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:butter_app_project/data base/data_menu.dart';
import 'package:butter_app_project/model/menu_model.dart';
import 'package:butter_app_project/owner_pages/menu.dart';

class AddMenu extends StatefulWidget {
  const AddMenu({super.key});

  @override
  State<AddMenu> createState() => _AddMenuState();
}

class _AddMenuState extends State<AddMenu> {
  MenuDB  menu = MenuDB();
  TextEditingController  harga = TextEditingController();
  TextEditingController nama_menu = TextEditingController();
  TextEditingController foto = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("add menu"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: SizedBox(
          width: double.infinity,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const SizedBox(
                  height: 60,
                ),
                SizedBox(
                  height: 40,
                  child: TextField(
                    controller: nama_menu ,
                    decoration: InputDecoration(
                      hintText: "Nama Menu",
                      border: OutlineInputBorder(),
                      contentPadding:
                      EdgeInsets.symmetric(vertical: 0, horizontal: 8),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 32,
                ),
                SizedBox(
                  height: 40,
                  child: TextField(
                    controller: harga,
                    decoration: InputDecoration(
                      hintText: "harga menu",
                      border: OutlineInputBorder(),
                      contentPadding:
                      EdgeInsets.symmetric(vertical: 0, horizontal: 8),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 32,
                ),
                SizedBox(
                  height: 40,
                  child: TextField(
                    controller: foto,
                    decoration: InputDecoration(
                      hintText: "foto",
                      border: OutlineInputBorder(),
                      contentPadding:
                      EdgeInsets.symmetric(vertical: 0, horizontal: 8),
                    ),
                  ),
                ),

                ElevatedButton(
                  onPressed: () async {
                    try {
                      await menu.insert(MenuModel(
                          harga: harga.text,
                          namaMenu: nama_menu.text,
                          foto: foto.text));
                      print("Data berhasil ditambahkan");
                    } catch (e) {
                      print("Error saat menambah data: $e");
                    }

                    Navigator.of(context).push(MaterialPageRoute(builder: (context) => Menu()));
                  },

                  child: const Text("TAMBAH"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
