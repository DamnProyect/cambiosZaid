import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseHelper {
  static DatabaseHelper? _databaseHelper;
  DatabaseHelper._internal();
  static DatabaseHelper get instance =>
      _databaseHelper ??= DatabaseHelper._internal();

  Database? _db;
  Database get db => _db!;

// funcion de inicializacion

  Future<void> init() async {
    _db = await openDatabase('database.db', version: 1,
        onCreate: (db, version) async {
      //Tabla productos
      db.execute(
          'Create table productos (IdProducto	INTEGER PRIMARY KEY AUTOINCREMENT ,name	varchar(255), price	INTEGER DEFAULT 1,image varchar(255),desc varchar(255))');

      // Tabla de carrito
      db.execute(
          'Create table carrito (id INTEGER PRIMARY KEY AUTOINCREMENT, name varchar(255), cantidad INTEGER DEFAULT 1)');
    });
  }
}
