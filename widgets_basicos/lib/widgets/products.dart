import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:widgets_basicos/main.dart';
import 'package:widgets_basicos/screens/ProductScreen.dart';

class ProductWidget extends StatelessWidget {
  final String nombre;
  final int precio;
  final String desc;
  final String image;

  ProductWidget({
    super.key,
    required this.nombre,
    required this.precio,
    required this.desc,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<ModeloUsuario>(
      builder: (context, ModeloUsuario, child) {
        final bool esAdmin = ModeloUsuario.esAdmin;
        return Container(
          color: const Color(0xFFF1F1F1),
          child: Stack(
            children: [
              const Positioned(
                top: 1,
                right: 1,
                child: Padding(
                  padding: EdgeInsets.only(top: 6, right: 9),
                  child: Icon(
                    Icons.favorite_border_outlined,
                    size: 20,
                  ),
                ),
              ),
              Positioned(
                top: 25,
                right: 0,
                left: 0,
                child: Column(
                  children: [
                    //Verificara si se le a dado tap a la imagen
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) =>
                                ProductScreen(image, nombre, precio, desc),
                          ),
                        );
                      },
                      child: Image.asset(
                        "assets/images/Carrusel2.jpg",
                        fit: BoxFit.contain,
                        width: 111,
                        height: 111,
                      ),
                    ),
                    SizedBox(height: 5),
                    Text(
                      nombre,
                      style: GoogleFonts.playfairDisplay(
                          fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      precio.toString() + " €",
                      style: GoogleFonts.playfairDisplay(fontSize: 16),
                    ),
                    //Fila de los botones de edicion y borrado
                    Visibility(
                      visible: esAdmin,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          ElevatedButton(
                            onPressed: () {},
                            child: Icon(Icons.border_color_outlined),
                          ),
                          ElevatedButton(
                            onPressed: () {},
                            child: Icon(Icons.delete_outline),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
