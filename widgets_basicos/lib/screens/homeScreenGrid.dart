import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:widgets_basicos/models/variables.dart';
import 'package:widgets_basicos/widgets/carrouser.dart';

class HomeScreenGrid extends StatefulWidget {
  const HomeScreenGrid({
    super.key,
  });

  @override
  State<HomeScreenGrid> createState() => _HomeScreenGridState();
}

class _HomeScreenGridState extends State<HomeScreenGrid> {
  //Controlador para manejar los botones  del slider
  final controller = CarouselController();
  int activeIndex = 0;
  List<String> heroImages = [
    "assets/images/Carrusel1.jpg",
    "assets/images/Carrusel2.jpg"
  ];
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const MiCarrusel(),
          Padding(
            padding: const EdgeInsets.all(12),
            child: GridView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: 5,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 24,
                crossAxisSpacing: 13,
              ),
              itemBuilder: (context, index) {
                /* return Container(
                  color: Colors.red,
                ); */
                return listadoProductos[index];
              },
            ),
          )

          /* Container(
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
          ), */
        ],
      ),
    );
  }
}
