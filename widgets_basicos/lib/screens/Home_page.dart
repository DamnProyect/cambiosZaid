import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:widgets_basicos/main.dart';
import 'package:widgets_basicos/screens/carrito.dart';
import 'package:widgets_basicos/screens/homeScreenGrid.dart';
import 'package:widgets_basicos/screens/login.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //Index con el que comienza el bottombar
  int currentIndex = 0;
  String saludo = "Bienvenido ";
  //Si el login es correcto muestra el widget, si no. muestra
  bool loginCorrecto = false;

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //AppBar
      appBar: AppBar(
        actions: [
          //Icono que manda al logIn
          IconButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (BuildContext context) {
                    return const LoginPage();
                  },
                ),
              );
            },
            icon: const Icon(
              Icons.person,
              color: Colors.white,
            ),
          )
        ],
        backgroundColor: Colors.lightBlue[800],
        title: Text(saludo + context.watch<ModeloUsuario>().nombre),
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
        indicatorColor: Colors.red,
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
