import 'package:flutter/material.dart';
import 'package:gasolinera/Principal.dart';
import 'package:gasolinera/login.dart';

BuildContext? ContextPerfil;

class Perfil extends StatelessWidget {
  const Perfil({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ContextPerfil = context;
    return Scaffold(
      extendBodyBehindAppBar: true,
      drawer: drawerP(),
      appBar: AppBar(
        title: const Text('Gasolinera Puma'),
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
      child: contenido(),
    ),
  );
}

Widget contenido() {
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      Image(
        image: AssetImage('assets/user.png'),
        width: 120,
      ),
      Column(
        children: [
          Container(
            margin: EdgeInsets.symmetric(vertical: 10.0),
          ),
          Text(
            'BIENVENIDO A NUESTRA APP',
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
            ),
          ),
          Column(
            children: [
              Container(
                margin: EdgeInsets.symmetric(vertical: 10.0),
              ),
              Text(
                'NOMBRE: ',
                style: TextStyle(color: Colors.white, fontSize: 18),
              ),
              Column(
                children: [
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 10.0),
                  ),
                  Text(
                    'CORREO: ',
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                  Column(
                    children: [
                      Container(
                        margin: EdgeInsets.symmetric(vertical: 10.0),
                      ),
                      Text(
                        'TELEFONO: ',
                        style: TextStyle(color: Colors.white, fontSize: 18),
                      ),
                      Column(
                        children: [
                          Container(
                            margin: EdgeInsets.symmetric(vertical: 10.0),
                          ),
                          ElevatedButton(
                            onPressed: () {
                              Navigator.push(
                                  ContextPerfil!,
                                  MaterialPageRoute(
                                      builder: (context) => Login()));
                            },
                            child: Text(
                              'Cerrar sesion',
                              style:
                                  TextStyle(color: Colors.black, fontSize: 20),
                            ),
                            style: ElevatedButton.styleFrom(
                              primary: Colors.white,
                              elevation: 0,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20)),
                            ),
                          )
                        ],
                      )
                    ],
                  )
                ],
              )
            ],
          )
        ],
      )
    ],
  );
}
