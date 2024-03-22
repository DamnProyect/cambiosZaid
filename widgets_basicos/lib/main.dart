import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int currentIndex = 0;
  List<Widget> ListadoDeWidgets = <Widget>[Text("Pagina 1"), Text("Pagina 2")];

  void indexChange(int valor) {
    setState(() {
      currentIndex = valor;
    });
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Hola"),
        ),
        body: Center(child: ListadoDeWidgets.elementAt(currentIndex)),
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
