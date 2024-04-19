import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
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

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    //Importante para que se compartan los cambios entre los widgets la linea del consumer y
    //builder deben ser exactas.
    return Consumer<ModeloUsuario>(
      builder: (context, ModeloUsuario, child) {
        //Verifico si el usuario es administrador y dependiendo retorno el homepage
        final esAdmin = ModeloUsuario.esAdmin;
        return esAdmin
            ? AdminScaffold()
            : Scaffold(
                //AppBar
                appBar: AppBar(
                  toolbarHeight: 70,
                  elevation: 0,
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
                      child: Builder(
                        builder: (context) => InkWell(
                          child: const Icon(Icons.person),
                          onTap: () {
                            Scaffold.of(context).openEndDrawer();
                          },
                        ),
                      ),
                    )
                  ],
                  backgroundColor: Colors.black,
                  title: Text(
                    //nombre del usuario a modificar
                    saludo + ModeloUsuario.nombre,
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
                  //Pantalla de favoritos
                  Container(),
                ][currentIndex],
                //Navigation bar
                bottomNavigationBar: NavigationBar(
                  destinations: const [
                    NavigationDestination(
                        icon: Icon(Icons.home), label: "Inicio"),
                    NavigationDestination(
                      icon: Icon(Icons.shopping_cart),
                      label: "Carrito",
                    ),
                    NavigationDestination(
                      icon: Icon(Icons.favorite),
                      label: "Favoritos",
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
                //Ventana lateral del login page
                endDrawer: Drawer(
                  child: LoginPage(),
                ),
              );
      },
    );
  }
}

//Scaffol del administrador

class AdminScaffold extends StatefulWidget {
  const AdminScaffold({
    super.key,
  });

  @override
  State<AdminScaffold> createState() => _AdminScaffoldState();
}

class _AdminScaffoldState extends State<AdminScaffold> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //AppBar
      appBar: AppBar(
        toolbarHeight: 70,
        elevation: 0,
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
            child: Builder(
              builder: (context) => InkWell(
                child: const Icon(Icons.person),
                onTap: () {
                  Scaffold.of(context).openEndDrawer();
                },
              ),
            ),
          )
        ],
        backgroundColor: Colors.black,
        title: Text(
          //nombre del usuario a modificar
          "Hola administrador",
          style: GoogleFonts.playfairDisplay(
              fontSize: 22, fontWeight: FontWeight.bold),
        ),
        foregroundColor: Colors.white,
      ),
      body: const HomeScreenGrid(),

      //Ventana lateral del login page
      endDrawer: Drawer(
        child: LoginPage(),
      ),
      //Boton para agregar nuevos productos
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(
          Icons.add,
        ),
        backgroundColor: Colors.lightGreen,
        shape: CircleBorder(),
      ),
    );
  }
}
