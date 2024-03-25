import 'package:flutter/material.dart';
import 'package:widgets_basicos/products.dart';
import 'package:widgets_basicos/screens/homeScreenGrid.dart';
import 'package:widgets_basicos/variables.dart';

void main() {
  runApp(const MyApp());
  CargarDatos();
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int currentIndex = 0;

  void indexChange(int valor) {
    setState(() {
      currentIndex = valor;
    });
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //Temas de la aplicacion, texto, colores etc
      theme: ThemeData(
        //Texto de la app
        fontFamily: 'Georgia',
      ),
      home: Scaffold(
        //AppBar
        appBar: AppBar(
          backgroundColor: Colors.lightBlue[800],
          title: Text("Bienvenido"),
        ),
        body: const HomeScreenGrid(),

        //Linea del bottom navigation var
        bottomNavigationBar: BottomNavigationBar(
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: "Inicio"),
            BottomNavigationBarItem(
                icon: Icon(Icons.shopping_cart), label: "Carrito")
          ],
          currentIndex: currentIndex,
          selectedItemColor: Colors.amber[800],
          onTap: indexChange,
        ),
      ),
    );
  }
}
