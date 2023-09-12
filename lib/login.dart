import 'package:flutter/material.dart';
import 'package:gasolinera/Principal.dart';
import 'package:gasolinera/register.dart';
import 'package:sqflite/sqflite.dart';
import 'SQL/db.dart';

BuildContext? Contexto;
final Controlleremail = TextEditingController();
final Controllerpassword = TextEditingController();

class Login extends StatelessWidget {
  const Login({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Contexto = context;
    return Scaffold(
      extendBodyBehindAppBar: true,
      drawer: drawers(),
      appBar: AppBar(
        title: Text(
          'Gasolinera Puma',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: background(),
    );
  }
}

Widget background() {
  return Container(
    decoration: BoxDecoration(
      image: DecorationImage(
        image: AssetImage('assets/fondo.jpg'),
        fit: BoxFit.cover,
        colorFilter:
            ColorFilter.mode(Colors.black.withOpacity(0.7), BlendMode.darken),
      ),
    ),
    child: Center(
      child: Formulario(),
    ),
  );
}

Widget Formulario() {
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      Text(
        'INICIO DE SESION',
        style: TextStyle(color: Colors.white, fontSize: 30),
      ),
      Image.asset(
        'assets/logo.png',
        width: 250,
      ),
      Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 15.00),
            child: TextField(
              controller: Controlleremail,
              decoration: InputDecoration(
                  prefixIcon: Icon(
                    Icons.email,
                    color: Colors.white,
                  ),
                  labelText: 'Correo electronico',
                  hintText: 'Carlosgeek503@gmail.com',
                  hintStyle: TextStyle(color: Colors.white),
                  labelStyle: TextStyle(color: Colors.white)),
              style: TextStyle(color: Colors.white),
            ),
          ),
          Column(
            children: [
              Container(
                margin: EdgeInsets.symmetric(vertical: 6.0),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 15.0),
                child: TextField(
                  controller: Controllerpassword,
                  obscureText: true,
                  decoration: InputDecoration(
                      prefixIcon: Icon(
                        Icons.password_rounded,
                        color: Colors.white,
                      ),
                      labelText: 'Contraseña',
                      hintText: '*************',
                      hintStyle: TextStyle(color: Colors.white),
                      labelStyle: TextStyle(color: Colors.white)),
                  style: TextStyle(color: Colors.white),
                ),
              ),
              Column(
                children: [
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 5.0),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      //tomar los datos del texteditting controlller
                      String correo = Controlleremail.text;
                      String password = Controllerpassword.text;
                      if (correo.isEmpty || password.isEmpty) {
                        ScaffoldMessenger.of(Contexto!).showSnackBar(
                            SnackBar(content: Text('Rellene los datos')));
                      } else {
                        // usar el metodo de Db.dart en la carpeta SQL
                        Db.login(correo, password).then((value) {
                          if (value == true) {
                            limpieza();
                            Navigator.pushReplacement(
                                Contexto!,
                                MaterialPageRoute(
                                    builder: (context) => Principal()));
                          } else {
                            ScaffoldMessenger.of(Contexto!).showSnackBar(
                                SnackBar(
                                    content: Text(
                                        'Usuario o contraseña incorrectos')));
                          }
                        });
                      }
                    },
                    child: const Text('Iniciar sesion'),
                  ),
                ],
              )
            ],
          )
        ],
      )
    ],
  );
}

Widget drawers() {
  return Drawer(
    child: ListView(
      padding: EdgeInsets.zero,
      children: <Widget>[
        DrawerHeader(
          child: Text(
            'Menu de seleccion',
            style: TextStyle(color: Colors.white, fontSize: 25),
          ),
          decoration: BoxDecoration(
              image: DecorationImage(
            image: AssetImage(
              'assets/fondo.jpg',
            ),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
                Colors.black.withOpacity(0.7), BlendMode.darken),
          )),
        ),
        ListTile(
          leading: Icon(Icons.login),
          title: Text('Inicio de sesion'),
          onTap: () {
            Navigator.push(
                Contexto!, MaterialPageRoute(builder: (context) => Login()));
          },
        ),
        ListTile(
          leading: Icon(Icons.output),
          title: Text('Registrarse'),
          onTap: () {
            Navigator.push(
                Contexto!, MaterialPageRoute(builder: (context) => Register()));
          },
        ),
      ],
    ),
  );
}

void limpieza() {
  Controlleremail.clear();
  Controllerpassword.clear();
}
