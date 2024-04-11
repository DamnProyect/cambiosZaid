import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:widgets_basicos/main.dart';
import 'package:widgets_basicos/screens/carrito.dart';
import 'package:widgets_basicos/screens/homeScreenGrid.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //Index con el que comienza el bottombar
  int currentIndex = 0;
  String saludo = "Bienvenido ";

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //AppBar
      appBar: AppBar(
        toolbarHeight: 70,
        elevation: 0,
        leading: IconButton(
          onPressed: () {},
          icon: Icon(Icons.menu),
        ),
        actions: [
          //Icono que manda al logIn
          Container(
            margin: EdgeInsets.only(right: 12),
            width: 40,
            height: 40,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.black,
            ),
            child: const Icon(Icons.person),
          )
        ],
        backgroundColor: Colors.black,
        title: Text(
          saludo + context.watch<ModeloUsuario>().nombre,
          style: GoogleFonts.playfairDisplay(
              fontSize: 22, fontWeight: FontWeight.bold),
        ),
        foregroundColor: Colors.white,
      ),
      body: [
        //Listado de paginas que se mostraran en el centro de al app, es un array
        //que cambia segun el index del bottombar
        HomeScreenGrid(),
        CarritoPage(),
      ][currentIndex],
      //Navigation bar
      bottomNavigationBar: NavigationBar(
        destinations: const [
          NavigationDestination(icon: Icon(Icons.home), label: "Inicio"),
          NavigationDestination(
            icon: Icon(Icons.shopping_cart),
            label: "Carrito",
          ),
        ],
        selectedIndex: currentIndex,
        indicatorColor: Colors.grey[400],
        onDestinationSelected: (value) {
          //Hace el cambio del contenido, modificando el estado.
          setState(() {
            currentIndex = value;
          });
        },
      ),
    );
  }
}
