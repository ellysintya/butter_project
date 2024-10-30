import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class Services {
  static Database? database;
  String Dbname = "karyawan";

  Services() {
    getDatabase();
  }

  Future<Database> getDatabase() async {
    if (database != null) {
      return database!;
    }
    database = await initDatabase();
    return database!;
  }

  Future<Database> initDatabase() async {
    String PathDatabase = await getDatabasesPath();
    String path = join(PathDatabase, Dbname);
    return await openDatabase(path, version: 1, onCreate: onCreate);
  }

  Future<void> onCreate(Database db, int version) async {
    await db.execute(
        'CREATE TABLE Karyawan (id INTEGER PRIMARY KEY , nama TEXT , password TEXT,no_telp INTEGER ');
    await db.execute(
        'CREATE TABLE Owner (id INTEGER PRIMARY KEY , nama TEXT password TEXT)');
  }
}
