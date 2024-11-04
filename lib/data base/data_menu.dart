import 'package:sqflite/sqflite.dart';
import 'package:butter_app_project/data_services/menu_services.dart';

import 'package:butter_app_project/model/menu_model.dart';

class MenuDB {
  String tableName = "menu";
  String columnHarga = "harga";
  String columnNamaMenu = "namaMenu";
  String columnFoto = "foto";
  DatabaseServices databaseServices = DatabaseServices();

  Future createTable(Database db) async {
    await db.execute(
        'CREATE TABLE IF NOT EXISTS $tableName (id INTEGER PRIMARY KEY, $columnHarga TEXT, $columnNamaMenu TEXT, $columnFoto TEXT)');
  }

  Future<List<MenuModel>> read() async {
    Database db = await databaseServices.getDatabase();

    List data = await db.query("menu");
    List<MenuModel> menu = data
        .map(
          (e) => MenuModel(
          id: e["id"], harga: e["harga"], namaMenu: e["namaMenu"], foto: e["foto"]),
    )
        .toList();

    return menu;
  }

  Future<int> insert(MenuModel menus) async {
    Database db = await databaseServices.getDatabase();
    int menusId = await db.insert(
        tableName, {"harga": menus.harga, "namaMenu": menus.namaMenu, "foto": menus.foto});
    return menusId;
  }

  Future<int> update(MenuModel menus) async {
    Database db = await databaseServices.getDatabase();
    int jumlahData = await db.update(
        tableName, {"harga": menus.harga, "namaMenu": menus.namaMenu, "foto": menus.foto},
        where: "id = ?", whereArgs: [menus.id]);
    return jumlahData;
  }

  Future<int> delete(int id) async {
    Database db = await databaseServices.getDatabase();
    int jumlahTerhapus =
    await db.delete(tableName, where: "id = ?", whereArgs: [id]);
    return jumlahTerhapus;
  }
}
