import 'dart:async';

import 'package:widgets_basicos/baseDeDatos/database_helper.dart';
import 'package:widgets_basicos/baseDeDatos/producto_model.dart';

class ProductoDao {
  final database = DatabaseHelper.instance.db;

  Future<List<ProductoModel>> readAll() async {
    final data = await database.query('carrito');
    return data.map((e) => ProductoModel.fromMap(e)).toList();
  }

  Future<int> Insert(ProductoModel producto) async {
    return await database.insert(
        'carrito', {'name': producto.name, 'cantidad': producto.cantidad});
  }

  // Insert en tabla productos
  Future<int> InsertProducto() async {
    return await database.insert('productos', {
      'name': "Papa",
      "price": "99",
      "desc": "asdasdsa",
      "image": "aaaaaaa"
    });
  }

  Future<void> updateCantidad(int id, int nuevaCantidad) async {
    Map<String, dynamic> row = {
      'cantidad': nuevaCantidad,
    };
    await database.update(
      'carrito',
      row,
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  Future<void> update(ProductoModel producto) async {
    await database.update('carrito', producto.toMap(),
        where: 'id = ?', whereArgs: [producto.id]);
  }

  Future<void> delete(ProductoModel producto) async {
    await database.delete('carrito', where: 'id = ?', whereArgs: [producto.id]);
  }

  Future<bool> isProductEmpty() async {
    List<Map<String, dynamic>> products =
        await database.query('productos', limit: 1);
    if (products.isEmpty) {
      return true;
    }
    return false;
  }
}
