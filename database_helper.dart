import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'product.dart';

class DatabaseHelper {
  static Database? _database;

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await initDB();
    return _database!;
  }

  Future<Database> initDB() async {
    String path = join(await getDatabasesPath(), 'grocery_store.db');
    return await openDatabase(
      path,
      version: 1,
      onCreate: (Database db, int version) async {
        // Create tables and define schemas
        await db.execute(
          "CREATE TABLE products(id INTEGER PRIMARY KEY, name TEXT, price REAL, imageUrl TEXT)",
        );
      },
    );
  }

  Future<void> insertProduct(Product product) async {
    final db = await database;
    await db.insert(
      'products',
      product.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<List<Product>> getProducts() async {
    final db = await database;
    final List<Map<String, dynamic>> maps = await db.query('products');
    return List.generate(maps.length, (i) {
      return Product(
        name: maps[i]['name'],
      );
    });
  }

  Future<void> clearCart() async {
    final db = await database;
    await db.delete('products');
  }
}
