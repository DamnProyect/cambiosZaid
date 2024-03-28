import 'package:flutter/material.dart';
import 'package:widgets_basicos/screens/Home_page.dart';
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
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      //Temas de la aplicacion, texto, colores etc
      theme: ThemeData(
        //Texto de la app
        fontFamily: 'Georgia',
      ),
      //La propiedad home es el inicio de la app, desde alli ya se manejan los demas widget que la componen
      home: HomePage(),
    );
  }
}
