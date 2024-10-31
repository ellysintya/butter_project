// import 'package:butter_project/data%20base/model.dart';
// import 'package:sqflite/sqflite.dart';
// import 'package:butter_project/data base/data_service.dart';
//
// class KaryawanDB {
//   String tablename = "Karyawan";
//   String columnNama = "nama";
//   String columnpass = "password";
//   String columnNo_telp = "no_telp";
//   String columnEmail = 'email';
//   Services dataServices = Services();
//
//   Future createTable(Database db) async {
//     await db.execute(
//         "CREATE TABLE IF NOT EXISTS $tablename (id INTEGER PRIMARY KEY , $columnNama TEXT , $columnpass TEXT , $columnNo_telp INTEGER , $columnEmail TEXT)");
//   }
//
//   Future<List<MdKaryawan>> Read_Karyawan() async {
//     Database db = await dataServices.getDatabase();
//     List data = await db.query('Karyawan');
//     List<MdKaryawan> Karyawan = data
//         .map((e) => MdKaryawan(
//             id: e["id"],
//             nama: e["nama"],
//             pass: e["password"],
//             no_telp: e["no_telp"],
//             email: e['email']))
//         .toList();
//
//     return Karyawan;
//   }
//
//   Future<int> insert(MdKaryawan) async {
//     Database db = await dataServices.getDatabase();
//     int IdKaryawan = await db.insert(tablename, {
//       "nama": MdKaryawan.nama,
//       "pass": MdKaryawan.pass,
//       "no_telp": MdKaryawan.no_telp,
//       "email": MdKaryawan.email,
//     });
//     return IdKaryawan;
//   }
//
//   Future<int> update(MdKaryawan) async {
//     Database db = await dataServices.getDatabase();
//     int jlhKaryawan = await db.update(
//         tablename,
//         {
//           "nama": MdKaryawan.nama,
//           "pass": MdKaryawan.pass,
//           "no_telp": MdKaryawan.no_telp,
//           "email": MdKaryawan.email,
//         },
//         where: "id = ?",
//         whereArgs: [MdKaryawan.id]);
//     return jlhKaryawan;
//   }
//
//   Future<int> delete(int id) async {
//     Database db = await dataServices.getDatabase();
//     int hpsKaryawan =
//         await db.delete(tablename, where: "id = ?", whereArgs: [id]);
//     return hpsKaryawan;
//   }
//
//   Future<Map<String, dynamic>?> fetchData(String nama) async {
//     Database db = await dataServices.getDatabase();
//     List<Map<String, dynamic>> result = await db
//         .query(tablename, where: " $columnNama = ? ", whereArgs: [nama]);
//     return result.isNotEmpty ? result.first : null;
//   }
// }

import 'package:butter_app_project/data%20base/model.dart';
import 'package:sqflite/sqflite.dart';
import 'package:butter_app_project/data%20base/data_service.dart';

class KaryawanDB {
  final String tableName = "Karyawan";
  final String columnNama = "nama";
  final String columnPass = "pass";
  final String columnNoTelp = "no_telp";
  final String columnEmail = 'email';
  final Services dataServices = Services();

  Future<void> createTable(Database db) async {
    await db.execute(
      "CREATE TABLE IF NOT EXISTS $tableName ("
          "id INTEGER PRIMARY KEY, "
          "$columnNama TEXT, "
          "$columnPass TEXT, "
          "$columnNoTelp INTEGER, "
          "$columnEmail TEXT)",
    );
  }

  Future<List<MdKaryawan>> readKaryawan() async {
    Database db = await dataServices.getDatabase();
    List<Map<String, dynamic>> data = await db.query(tableName);
    List<MdKaryawan> karyawan = data
        .map((e) =>
        MdKaryawan(
          id: e["id"],
          nama: e[columnNama],
          pass: e[columnPass],
          no_telp: e[columnNoTelp],
          email: e[columnEmail],
        ))
        .toList();

    return karyawan;
  }

  Future<int> insert(MdKaryawan mdKaryawan) async {
    Database db = await dataServices.getDatabase();
    int idKaryawan = await db.insert(tableName, {
      columnNama: mdKaryawan.nama,
      columnPass: mdKaryawan.pass,
      columnNoTelp: mdKaryawan.no_telp,
      columnEmail: mdKaryawan.email,
    });
    return idKaryawan;
  }

  Future<int> update(MdKaryawan mdKaryawan) async {
    Database db = await dataServices.getDatabase();
    int affectedRows = await db.update(
      tableName,
      {
        columnNama: mdKaryawan.nama,
        columnPass: mdKaryawan.pass,
        columnNoTelp: mdKaryawan.no_telp,
        columnEmail: mdKaryawan.email,
      },
      where: "id = ?",
      whereArgs: [mdKaryawan.id],
    );
    return affectedRows;
  }

  Future<int> delete(int id) async {
    Database db = await dataServices.getDatabase();
    int deletedRows = await db.delete(
        tableName, where: "id = ?", whereArgs: [id]);
    return deletedRows;
  }

  Future<Map<String, dynamic>?> fetchData(String nama , String pass) async {
    Database db = await dataServices.getDatabase();
    List<Map<String, dynamic>> result = await db.query(
      tableName,
      where: "$columnNama = ? AND $columnPass = ?",
      whereArgs: [nama , pass],
    );
    if (result.isNotEmpty) {
      return result.first;
    } else {
      return null;
    }
  }
}
