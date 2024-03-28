import 'package:flutter/material.dart';
import 'package:widgets_basicos/variables.dart';

class HomeScreenGrid extends StatelessWidget {
  const HomeScreenGrid({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 30),
      child: GridView.count(
        //Espacio entre los elementos del grid
        crossAxisSpacing: 0.0,
        mainAxisSpacing: 0.0,
        //Indico el numero de filas
        crossAxisCount: 2,
        //Le paso el listado de productos al grid
        children: listadoProductos,
      ),
    );
  }
}
