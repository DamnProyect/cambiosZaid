import 'package:flutter/material.dart';
import 'package:widgets_basicos/screens/login.dart';

class ProductWidget extends StatelessWidget {
  final String nombre;
  final int precio;

  ProductWidget({super.key, required this.nombre, required this.precio});

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      ElevatedButton(
        child: Container(
          color: Colors.amber,
          height: 100,
          width: 100,
        ),
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (BuildContext context) {
                return const LoginPage();
              },
            ),
          );
        },
      ),
      SizedBox(
        height: 10,
      ),
      Text(nombre),
      Text(precio.toString()),
    ]);
  }
}
