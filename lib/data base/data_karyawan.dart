import 'package:butter_project/data%20base/model.dart';
import 'package:sqflite/sqflite.dart';
import 'package:butter_project/data base/data_service.dart';

class KaryawanDB {
  String tablename = "Karyawan";
  String columnNama = "nama";
  String columnpass = "password";
  String columnNo_telp = "no_telp";
  String columnEmail = 'email';
  Services dataServices = Services();

  Future createTable(Database db) async {
    await db.execute(
        "CREATE TABLE IF NOT EXISTS $tablename (id INTEGER PRIMARY KEY , $columnNama TEXT , $columnpass TEXT , $columnNo_telp INTEGER , $columnEmail TEXT)");
  }

  Future<List<MdKaryawan>> Read_Karyawan() async {
    Database db = await dataServices.getDatabase();
    List data = await db.query('Karyawan');
    List<MdKaryawan> Karyawan = data
        .map((e) => MdKaryawan(
            id: e["id"],
            nama: e["nama"],
            pass: e["password"],
            no_telp: e["no_telp"],
            email: e['email']))
        .toList();

    return Karyawan;
  }

  Future<int> insert(MdKaryawan) async {
    Database db = await dataServices.getDatabase();
    int IdKaryawan = await db.insert(tablename, {
      "nama": MdKaryawan.nama,
      "pass": MdKaryawan.pass,
      "no_telp": MdKaryawan.no_telp,
      "email": MdKaryawan.email,
    });
    return IdKaryawan;
  }

  Future<int> update(MdKaryawan) async {
    Database db = await dataServices.getDatabase();
    int jlhKaryawan = await db.update(
        tablename,
        {
          "nama": MdKaryawan.nama,
          "pass": MdKaryawan.pass,
          "no_telp": MdKaryawan.no_telp,
          "email": MdKaryawan.email,
        },
        where: "id = ?",
        whereArgs: [MdKaryawan.id]);
    return jlhKaryawan;
  }

  Future<int> delete(int id) async {
    Database db = await dataServices.getDatabase();
    int hpsKaryawan =
        await db.delete(tablename, where: "id = ?", whereArgs: [id]);
    return hpsKaryawan;
  }

  Future<Map<String, dynamic>?> fetchData(String nama) async {
    Database db = await dataServices.getDatabase();
    List<Map<String, dynamic>> result = await db
        .query(tablename, where: " $columnNama = ? ", whereArgs: [nama]);
    return result.isNotEmpty ? result.first : null;
  }
}
