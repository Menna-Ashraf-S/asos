import 'package:flutter_app/local/cart_data.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class CartDbHelper {
  static final CartDbHelper _instance = CartDbHelper.internal();
  factory CartDbHelper() => _instance;
  CartDbHelper.internal();
  static Database? _db;

  Future createDatabase() async {
    if (_db != null) {
      return _db;
    }
    String path = join(await getDatabasesPath(), 'CartDB.db');
    _db = await openDatabase(
      path,
      version: 1,
      onCreate: (Database db, int version) async {
        await db.execute('''create table cart (
        idSQL integer primary key autoincrement,
        image text not null ,
        brand text not null,
        type text not null,
        price text not null,
        count integer not null 
  )
      ''');
      },
    );
    return _db;
  }

  Future<int> createCart(CartData data) async {
    Database db = await createDatabase();
    return db.insert('cart', data.toMap());
  }

  Future<List> allCartList() async {
    Database db = await createDatabase();
    return await db.query('cart');
  }

  Future<int> update(CartData data) async {
    Database db = await createDatabase();
    return db.update('cart', data.toMap(),
        where: 'idSQL = ?', whereArgs: [data.idSQL]);
  }

  Future<int> delete(String image) async {
    Database db = await createDatabase();
    return await db.delete('cart', where: 'image = ?', whereArgs: [image]);
  }

  Future calculateTotal() async {
    Database db = await createDatabase();
    var result = await db.rawQuery("SELECT SUM(count) as Total FROM cart");
    print(result.toList());
  }

  Future<List<CartData>> getCartItems() async {
    Database db = await createDatabase();
    List<Map> maps = await db.query('cart', columns: ['price', 'count']);
    List<CartData> cartItems = [];
    if (maps.length > 0) {
      for (int i = 0; i < maps.length; i++) {
        cartItems.add(CartData.fromMap(maps[i]));
      }
    }
    return cartItems;
  }
}
