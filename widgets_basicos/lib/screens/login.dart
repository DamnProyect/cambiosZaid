import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
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

  bool verificarPassword(String password, String user) {
    if (pass == "123" && usuario == "zaid") {
      return true;
    } else {
      return false;
    }
  }

  final textControlerUsuario = TextEditingController();
  final textControlerPass = TextEditingController();
  String texto = "Bienvenido";
  String pass = "";
  String usuario = "";
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body:
            //const HomeScreenGrid(),
            Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 200,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                    color: Colors.black26,
                    width: 8,
                  ),
                ),
                child: TextField(
                  controller: textControlerUsuario,
                  autofocus: false,
                  onSubmitted: (value) {
                    usuario = textControlerUsuario.text;
                    pass = textControlerPass.text;
                  },
                  decoration: const InputDecoration(
                      icon: Icon(Icons.person),
                      hintText: "Escribe algo",
                      fillColor: Colors.yellow,
                      focusColor: Colors.blue),
                  cursorColor: Colors.indigoAccent,
                ),
              ),
              Container(
                width: 200,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                    color: Colors.black26,
                    width: 8,
                  ),
                ),
                child: TextField(
                  controller: textControlerPass,
                  autofocus: false,
                  onSubmitted: (value) {
                    pass = textControlerPass.text;
                  },
                  decoration: const InputDecoration(
                      icon: Icon(Icons.password),
                      hintText: "Contraseña",
                      fillColor: Colors.yellow,
                      focusColor: Colors.blue),
                  cursorColor: Colors.indigoAccent,
                ),
              ),
            ],
          ),
        ),

        floatingActionButton: FloatingActionButton(
          onPressed: () {
            if (verificarPassword(pass, usuario) == true) {
              changeName("Login correcto");
              textControlerUsuario.clear();
              textControlerPass.clear();
            } else {
              changeName("Login erroneo");
              textControlerUsuario.clear();
              textControlerPass.clear();
            }
            print("***********************************************");

            print(usuario);
            print(pass);
          },
          backgroundColor: Colors.red,
        ),
        //Linea del bottom navigation var
      ),
    );
  }
}
