import 'package:flutter_app/local/fav_data.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class FavDbHelper {
  static final FavDbHelper _instance = FavDbHelper.internal();
  factory FavDbHelper() => _instance;
  FavDbHelper.internal();
  static Database? _db;

  Future createDatabase() async {
    if (_db != null) {
      return _db;
    }
    String path = join(await getDatabasesPath(), 'Fav.db');
    _db = await openDatabase(
      path,
      version: 1,
      onCreate: (Database db, int version) async {
        await db.execute('''create table fav (
        idSQL integer primary key autoincrement,
        image text not null ,
        brand text not null,
        type text not null,
        price text not null
        )
      ''');
      },
    );
    return _db;
  }

  Future<int> createFav(FavData data) async {
    Database db = await createDatabase();
    return db.insert('fav', data.toMap());
  }

  Future<List> allFavList() async {
    Database db = await createDatabase();
    return await db.query('fav');
  }

  Future<int> update(FavData data) async {
    Database db = await createDatabase();
    return db.update('fav', data.toMap(),
        where: 'idSQL = ?', whereArgs: [data.idSQL]);
  }

  Future<int> delete(String image) async {
    Database db = await createDatabase();
    return await db.delete('fav', where: 'image = ?', whereArgs: [image]);
  }
}
