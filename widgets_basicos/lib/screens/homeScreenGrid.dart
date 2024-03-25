import 'package:flutter/material.dart';
import 'package:widgets_basicos/products.dart';
import 'package:widgets_basicos/variables.dart';

class HomeScreenGrid extends StatelessWidget {
  const HomeScreenGrid({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisSpacing: 0.0,
      mainAxisSpacing: 0.0,
      crossAxisCount: 2,
      children: listadoProductos,
    );
  }
}
