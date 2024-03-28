import 'package:flutter/material.dart';
import 'package:widgets_basicos/screens/Home_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  int currentIndex = 0;

  bool verificarPassword(String password, String user) {
    if (pass == "123" && usuario == "zaid") {
      return true;
    } else {
      return false;
    }
  }

  // Guardan el contenido del textField
  final textControlerUsuario = TextEditingController();
  final textControlerPass = TextEditingController();

  String pass = "";
  String usuario = "";
  String saludo = "";

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.green[200],
          title: const Text("Login page"),
          leading: IconButton(
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
              Container(
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
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.of(context).pop();

            //Limpia los campos
            textControlerUsuario.clear();
            textControlerPass.clear();

            /*   if (verificarPassword(pass, usuario) == true) {
              
            } else {
              textControlerUsuario.clear();
              textControlerPass.clear();
            }
            print("***********************************************");

            print(usuario);
            print(pass); */
          },
          backgroundColor: Colors.green,
          child: const Icon(
            Icons.send,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
