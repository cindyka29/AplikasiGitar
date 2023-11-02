import 'dart:async';
import 'dart:io' as io;

import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';
import 'package:flutter_application_1/models/product.dart';

class DatabaseHelper {
  static final DatabaseHelper _instance = new DatabaseHelper.internal();

  factory DatabaseHelper() => _instance;

  static late Database _db;

  Future<Database> get db async {
    if (_db != null) {
      return _db;
    }
    _db = await initDb();
    return _db;
  }

  DatabaseHelper.internal();

  initDb() async {
    io.Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, "products.db");
    var theDb = await openDatabase(path, version: 1, onCreate: _onCreate);
    return theDb;
  }

  void _onCreate(Database db, int version) async {
    // When creating the db, create the table
    await db.execute(
        "CREATE TABLE Product(id INTEGER PRIMARY KEY, name TEXT, code TEXT, description TEXT, category TEXT)");
  }

  Future<int> saveProduct(Product product) async {
    var dbClient = await db;
    int res = await dbClient.insert("Product", product.toMap());
    return res;
  }

  Future<List<Product>> getProducts() async {
    var dbClient = await db;
    List<Map> list = await dbClient.rawQuery('SELECT * FROM Product');
    List<Product> products = [];
    for (int i = 0; i < list.length; i++) {
      var product = new Product(
          id: list[i]["id"],
          name: list[i]["name"],
          code: list[i]["code"],
          description: list[i]["description"],
          images: list[i]["images"],
          category: list[i]["category"]);
      products.add(product);
    }
    return products;
  }

  Future<int> deleteProduct(int id) async {
    var dbClient = await db;
    int res =
        await dbClient.rawDelete('DELETE FROM Product WHERE id = ?', [id]);
    return res;
  }

  Future<bool> updateProduct(Product product) async {
    var dbClient = await db;
    var id = product.id;
    int res = await dbClient.update("Product", product.toMap(),
        where: "id = ?", whereArgs: <int>[]);
    return res > 0;
  }

  insertProduct(Product product) {}

  retrieveProducts() {}
}
