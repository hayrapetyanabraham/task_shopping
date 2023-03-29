import 'dart:async';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:task_shopping/data/models/shopping_item.dart';

class ShoppingDatabase {
  static const _databaseName = 'shopping.db';
  static const _databaseVersion = 1;

  ShoppingDatabase._privateConstructor();

  static final ShoppingDatabase instance =
      ShoppingDatabase._privateConstructor();

  Database? _database;

  Future<Database> get database async {
    if (_database != null) {
      return _database!;
    }

    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    final databasePath = await getDatabasesPath();
    final path = join(databasePath, _databaseName);

    return await openDatabase(
      path,
      version: _databaseVersion,
      onCreate: _onCreate,
    );
  }

  Future<void> _onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE ${ShoppingItem.tableName} (
        ${ShoppingItem.columnId} INTEGER PRIMARY KEY AUTOINCREMENT,
        ${ShoppingItem.columnName} TEXT NOT NULL,
        ${ShoppingItem.columnPurchaseTime} TEXT NOT NULL,
        ${ShoppingItem.columnPrice} REAL NOT NULL,
        ${ShoppingItem.columnQuantity} INTEGER NOT NULL,
        ${ShoppingItem.columnWarrantyPeriod} INTEGER NOT NULL
      )
    ''');
  }

  Future<int> insert(ShoppingItem item) async {
    final db = await instance.database;
    return await db.insert(
      ShoppingItem.tableName,
      item.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<List<ShoppingItem>> getAllItems() async {
    final db = await instance.database;
    final List<Map<String, dynamic>> maps =
        await db.query(ShoppingItem.tableName);
    return List.generate(maps.length, (i) => ShoppingItem.fromMap(maps[i]));
  }

  Future<void> update(ShoppingItem item) async {
    final db = await instance.database;
    await db.update(
      ShoppingItem.tableName,
      item.toMap(),
      where: '${ShoppingItem.columnId} = ?',
      whereArgs: [item.id],
    );
  }

  Future<void> delete(int id) async {
    final db = await instance.database;
    await db.delete(
      ShoppingItem.tableName,
      where: '${ShoppingItem.columnId} = ?',
      whereArgs: [id],
    );
  }

  Future<void> deleteAllItems() async {
    final db = await instance.database;
    await db.delete(ShoppingItem.tableName);
  }
}
