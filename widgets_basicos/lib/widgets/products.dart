import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:widgets_basicos/screens/login.dart';

class ProductWidget extends StatelessWidget {
  final String nombre;
  final int precio;

  ProductWidget({super.key, required this.nombre, required this.precio});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: Colors.amber),
      child: Column(
        children: [
          Container(
            width: 90,
            height: 40,
            decoration: BoxDecoration(color: Colors.blue),
          ),
          Text(nombre),
          Text(
            precio.toString(),
          )
        ],
      ),
    );
  }
}
