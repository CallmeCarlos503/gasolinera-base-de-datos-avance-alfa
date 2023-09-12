import 'package:flutter/material.dart';
import 'package:gasolinera/Principal.dart';

class Maps extends StatelessWidget {
  const Maps({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      drawer: drawerP(),
      appBar: AppBar(
        title: const Text('Gasolinera puma'),
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
        child: ListView(
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              margin: const EdgeInsets.only(top: 30),
            ),
            cartas(),
            cartas(),
            cartas(),
            cartas(),
            cartas(),
            cartas(),
          ],
        )
      ],
    )),
  );
}

Widget cartas() {
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Card(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            const ListTile(
              leading: Icon(
                Icons.local_gas_station,
                color: Colors.amberAccent,
                size: 40,
              ),
              title: Text('San Miguel'),
              subtitle: Text('Gasolineria Puma San Miguel'),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                const SizedBox(width: 8),
                TextButton(
                  child: const Text('Detalles'),
                  onPressed: () {/* ... */},
                ),
                TextButton(
                  child: const Text('Ver el mapa'),
                  onPressed: () {/* ... */},
                ),
                
                const SizedBox(width: 8),
              ],
            ),
          ],
        ),
      ),
    ],
  );
}
