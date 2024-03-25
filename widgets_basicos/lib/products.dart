import 'package:flutter/material.dart';

class ProductWidget extends StatelessWidget {
  final String nombre;
  final int precio;

  ProductWidget({super.key, required this.nombre, required this.precio});

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Container(
        color: Colors.amber,
        height: 100,
        width: 100,
      ),
      SizedBox(
        height: 10,
      ),
      Text(nombre),
      Text(precio.toString()),
    ]);
  }
}
