// import 'package:path/path.dart';
// import 'package:sqflite/sqflite.dart';
//
// class Services {
//   static Database? database;
//   String Dbname = "karyawan";
//
//   Services() {
//     getDatabase();
//   }
//
//   Future<Database> getDatabase() async {
//     if (database != null) {
//       return database!;
//     }
//     database = await initDatabase();
//     return database!;
//   }
//
//   Future<Database> initDatabase() async {
//     String PathDatabase = await getDatabasesPath();
//     String path = join(PathDatabase, Dbname);
//     return await openDatabase(path, version: 1, onCreate: onCreate);
//   }
//
//   Future<void> onCreate(Database db, int version) async {
//     await db.execute(
//         'CREATE TABLE Karyawan (id INTEGER PRIMARY KEY , nama TEXT , password TEXT,no_telp INTEGER ');
//     await db.execute(
//         'CREATE TABLE Owner (id INTEGER PRIMARY KEY , nama TEXT password TEXT)');
//   }
// }

import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class Services {
  static Database? database;
  final String dbName = "karyawan.db";

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
    String pathDatabase = await getDatabasesPath();
    String path = join(pathDatabase, dbName);

    return await openDatabase(
      path,
      version: 1,
      onCreate: onCreate,
    );
  }

  Future<void> onCreate(Database db, int version) async {
    // Correct SQL syntax for creating tables
    await db.execute(
      'CREATE TABLE Karyawan ('
          'id INTEGER PRIMARY KEY, '
          'nama TEXT, '
          'pass TEXT, '
          'no_telp INTEGER, '
          'email Text)',

    );

    await db.execute(
      'CREATE TABLE Owner ('
          'id INTEGER PRIMARY KEY, '
          'nama TEXT, '
          'password TEXT)',
    );
  }
  Future<List<Map<String, dynamic>>> getTableInfo() async {
    final db = await getDatabase();
    return await db.rawQuery('PRAGMA table_info(Karyawan)');
  }
  Future<void> resetDatabase() async {
    String pathDatabase = await getDatabasesPath();
    String path = join(pathDatabase, dbName);

    // Hapus database yang ada
    await deleteDatabase(path);

    // Inisialisasi ulang database
    database = await initDatabase();
  }

}
//   onUpgrade: (db, oldVersion, newVersion) async {
//   if (oldVersion < 2) {
//   await db.execute('DROP TABLE IF EXISTS karyawan');
//   await db.execute('''
//             CREATE TABLE karyawan(
//               id INTEGER PRIMARY KEY AUTOINCREMENT,
//               username TEXT,
//               columnPass TEXT,
//               email TEXT
//             )
//           ''');
//
// }
//
// import 'package:path/path.dart';
// import 'package:sqflite/sqflite.dart';
//
// class Services {
//   static Database? database;
//   final String dbName = "karyawan.db";
//
//   Services() {
//     getDatabase();
//   }
//
//   Future<Database> getDatabase() async {
//     if (database != null) {
//       return database!;
//     }
//     database = await initDatabase();
//     return database!;
//   }
//
//   Future<Database> initDatabase() async {
//     String pathDatabase = await getDatabasesPath();
//     String path = join(pathDatabase, dbName);
//
//     return await openDatabase(
//       path,
//       version: 2, // Pastikan versi dinaikkan untuk memicu `onUpgrade`
//       onCreate: onCreate,
//       onUpgrade: onUpgrade, // Tambahkan onUpgrade di sini
//     );
//   }
//
//   Future<void> onCreate(Database db, int version) async {
//     await db.execute(
//         '''
//       CREATE TABLE Karyawan (
//         id INTEGER PRIMARY KEY,
//         nama TEXT,
//         password TEXT,
//         no_telp INTEGER,
//         email TEXT
//       )
//       '''
//     );
//
//     await db.execute(
//         '''
//       CREATE TABLE Owner (
//         id INTEGER PRIMARY KEY,
//         nama TEXT,
//         password TEXT
//       )
//       '''
//     );
//   }
//
//   Future<void> onUpgrade(Database db, int oldVersion, int newVersion) async {
//     if (oldVersion < 2) {
//       // Drop table jika ada, dan buat ulang tabel Karyawan dengan tambahan kolom `email`
//       await db.execute('DROP TABLE IF EXISTS Karyawan');
//       await db.execute(
//           '''
//         CREATE TABLE Karyawan (
//           id INTEGER PRIMARY KEY AUTOINCREMENT,
//           nama TEXT,
//           password TEXT,
//           no_telp INTEGER,
//           email TEXT
//         )
//         '''
//       );
//     }
//   }
//   Future<void> resetDatabase() async {
//     String pathDatabase = await getDatabasesPath();
//     String path = join(pathDatabase, dbName);
//
//     // Hapus database yang ada
//     await deleteDatabase(path);
//
//     // Inisialisasi ulang database
//     database = await initDatabase();
//   }
// }

