import 'package:flutter_app/local/log_data.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class LOGDbHelper {
  static final LOGDbHelper _instance = LOGDbHelper.internal();
  factory LOGDbHelper() => _instance;
  LOGDbHelper.internal();
  static Database? _db;

  Future createDatabase() async {
    if (_db != null) {
      return _db;
    }
    String path = join(await getDatabasesPath(), 'LogIn.db');
    _db = await openDatabase(
      path,
      version: 1,
      onCreate: (Database db, int version) async {
        await db.execute('''create table log (
        idSQL integer primary key autoincrement,
        username text not null ,
        email text not null,
        password text not null 
  )
      ''');
      },
    );
    return _db;
  }

  Future<int> createlog(LogData data) async {
    Database db = await createDatabase();
    return db.insert('log', data.toMap());
  }

  Future<List> alllogList() async {
    Database db = await createDatabase();
    return await db.query('log');
  }

  Future<int> update(LogData data) async {
    Database db = await createDatabase();
    return db.update('log', data.toMap(),
        where: 'idSQL = ?', whereArgs: [data.idSQL]);
  }

  Future<int> delete(int id) async {
    Database db = await createDatabase();
    return await db.delete('log', where: 'idSQL = ?', whereArgs: [id]);
  }

  Future<List<LogData>> outdata(String email, String password) async {
    Database db = await createDatabase();
    List<Map<String, dynamic>> results = await db.query('log',
        where: 'email = ?  and password = ?', whereArgs: [email, password]);
    return results.map((e) => LogData.fromMap(e)).toList();
  }
}
