import 'package:flutter/material.dart';
import 'package:widgets_basicos/variables.dart';

class HomeScreenGrid extends StatelessWidget {
  const HomeScreenGrid({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 2,
      children: listadoProductos,
    );
  }
}
