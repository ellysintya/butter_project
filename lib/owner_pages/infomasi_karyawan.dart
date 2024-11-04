import 'package:butter_app_project/data%20base/data_karyawan.dart';
import 'package:butter_app_project/data%20base/model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:butter_app_project/data base/data_karyawan.dart';
import 'package:butter_app_project/data base/model.dart';

class DaftarKaryawan extends StatefulWidget {
  const DaftarKaryawan({super.key});

  @override
  State<DaftarKaryawan> createState() => _DaftarKaryawanState();
}

class _DaftarKaryawanState extends State<DaftarKaryawan> {
  KaryawanDB karyawan = KaryawanDB();
  Future<List<MdKaryawan>>? futureKaryawan;

  @override
  void initState() {
    super.initState();
    futureKaryawan = karyawan.readKaryawan();
  }
  var data;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Daftar Karyawan"),
          centerTitle: true,
          // actions: [
          //   IconButton(
          //       onPressed: () {
          //         Navigator.of(context).push(
          //           MaterialPageRoute(
          //             builder: (context) {
          //               return const AddMahasiswa();
          //             },
          //           ),
          //         );
          //       },
          //       icon: const Icon(Icons.add))
          // ],
        ),
        body:
        FutureBuilder<List<MdKaryawan>>(
          future: futureKaryawan,
          builder: (context ,snapshot){
            if (snapshot.connectionState == ConnectionState.waiting){
              return Center(
                child: CircularProgressIndicator(),
              );
            }
            else if (snapshot.hasError){
              return Center(
                child: Text("Error : ${snapshot.error}"),
              );
            }
            else if (!snapshot.hasData || snapshot.data!.isEmpty){
              return Center(
                child: Text("tidak ada data"),
              );
            }
            else {
              List<MdKaryawan> kry = snapshot.data! ;
              return
                ListView.builder(
                    itemCount: kry.length,
                    itemBuilder: (context, index) {
                      return Card(
                        child: ListTile(
                          trailing: SizedBox(
                            width: 100,
                            child:
                                IconButton(
                                  onPressed: () {
                                    karyawan.delete(kry[index].id!);
                                    setState(() {
                                      futureKaryawan = karyawan.readKaryawan();
                                    });
                                  },
                                  icon: const Icon(
                                    Icons.delete,
                                    size: 16,
                                  ),
                                  color: Colors.red,
                                )
                          ),
                          title: Text(kry[index].nama),
                          subtitle: Text(kry[index].email),
                          // leading: CircleAvatar(child: Text(kry[index].)),
                        ),
                      );
                    });
            }
          },
        ));
  }
}
