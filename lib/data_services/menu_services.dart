import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:butter_app_project/data base/data_menu.dart';

class DatabaseServices{
  Database ? database ;
  String Dbname = "menu";

  DatabaseServices(){
    getDatabase();
  }

  Future<Database> getDatabase() async {
    if (database != null){
      return database!;
    }
    database = await initDatabase() ;
    return database!;
  }
  Future<Database>initDatabase() async{
    String databasePath = await getDatabasesPath();
    String path = join(databasePath , Dbname);
    return await openDatabase(path , version: 1 , onCreate: onCreate
    );
  }

  Future<void> onCreate (Database db , int version) async {
    await db.execute('CREATE TABLE Menu(id INTEGER PRIMARY KEY, harga TEXT, namaMenu TEXT, foto TEXT)');

  }}
