import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:widgets_basicos/products.dart';
import 'package:widgets_basicos/screens/homeScreenGrid.dart';
import 'package:widgets_basicos/screens/login.dart';
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

  void changeName(String valor) {
    setState(() {
      texto = valor;
    });
  }

  bool moverALogin() {
    return login = false;
  }

  bool verificarPassword(String password, String user) {
    if (pass == "123" && usuario == "zaid") {
      return true;
    } else {
      return false;
    }
  }

  bool login = false;
  final textControlerUsuario = TextEditingController();
  final textControlerPass = TextEditingController();
  String texto = "Bienvenido";
  String pass = "";
  String usuario = "";
  bool mostarFloating = false;
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
          actions: [
            //Icono que manda al logIN
            IconButton(
              onPressed: () {
                setState(() {
                  login = true;
                });
              },
              icon: const Icon(Icons.person),
            )
          ],
          backgroundColor: Colors.lightBlue[800],
          title: Text(texto),
        ),
        body: [HomeScreenGrid(), LoginPage(), Container()][currentIndex],

        bottomNavigationBar: NavigationBar(
          destinations: const [
            NavigationDestination(icon: Icon(Icons.home), label: "Inicio"),
            NavigationDestination(icon: Icon(Icons.person), label: "Login"),
            NavigationDestination(
              icon: Icon(Icons.shopping_cart),
              label: "Carrito",
            ),
          ],
          selectedIndex: currentIndex,
          indicatorColor: Colors.red,
          onDestinationSelected: (value) {
            setState(() {
              currentIndex = value;
            });
          },
        ),
      ),
    );
  }
}
