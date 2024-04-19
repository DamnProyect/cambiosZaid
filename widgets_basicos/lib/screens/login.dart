import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:widgets_basicos/main.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  // Guardan el contenido del textField
  final textControlerUsuario = TextEditingController();
  final textControlerPass = TextEditingController();

  @override
  Widget build(BuildContext context) {
    //Es importante que los demas widgets tengan el mismo consumer y contexto para poder
    //usar los datos del modelo.
    return Consumer<ModeloUsuario>(
      builder: (context, ModeloUsuario, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          home: Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.black,
              title: const Text(
                "Login page",
                style: TextStyle(color: Colors.white),
              ),
              leading: IconButton(
                color: Colors.white,
                onPressed: () {
                  Navigator.of(context).pop();
                },
                icon: const Icon(Icons.arrow_back_ios),
              ),
            ),
            body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 200,
                    child: TextField(
                      //TextFiel usuario
                      controller: textControlerUsuario,
                      autofocus: false,
                      decoration: InputDecoration(
                          icon: const Icon(Icons.person),
                          hintText: "Escribe algo",
                          fillColor: Colors.grey.shade300,
                          focusColor: Colors.blue,
                          border: InputBorder.none,
                          filled: true),
                      cursorColor: Colors.indigoAccent,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    //TextField del password
                    width: 200,
                    child: TextField(
                      controller: textControlerPass,
                      autofocus: false,
                      decoration: InputDecoration(
                          icon: const Icon(Icons.password),
                          hintText: "Contraseña",
                          fillColor: Colors.grey.shade300,
                          border: InputBorder.none,
                          focusColor: Colors.blue,
                          filled: true),
                      cursorColor: Colors.indigoAccent,
                    ),
                  ),
                  SizedBox(
                    height: 18,
                  ),
                  ElevatedButton(
                    //Boton de cierre de sesion para volver al scaffol anterior
                    onPressed: () {
                      ModeloUsuario.loginAdmin(false);
                      //Actualizo el nombre a vacio para el proximo inicio
                      ModeloUsuario.cambiarNombre(" ");
                    },
                    child: Icon(Icons.logout),
                  )
                ],
              ),
            ),
            floatingActionButton: FloatingActionButton(
              onPressed: () {
                Navigator.of(context).pop();
                //Modifico el nombre en el home
                if (textControlerUsuario.text == "admin") {
                  ModeloUsuario.loginAdmin(true);
                }
                //Cambio el valor de la variable para mostrar un home
                ModeloUsuario.cambiarNombre(textControlerUsuario.text);
                //Limpia los campos
                textControlerUsuario.clear();
                textControlerPass.clear();
              },
              backgroundColor: Colors.green,
              child: const Icon(
                Icons.send,
                color: Colors.white,
              ),
            ),
          ),
        );
      },
    );
  }
}
