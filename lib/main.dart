import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _counter = 0;
  int _counterimage = 0;
  List<int> numeros= [234,34,544,64,43,23];

  List<String> images = [
    "https://images.pexels.com/photos/17551618/pexels-photo-17551618/free-photo-of-amor-verano-jardin-hoja.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
    "https://images.pexels.com/photos/15663496/pexels-photo-15663496/free-photo-of-casas-casa-vehiculo-puerta.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
    "https://images.pexels.com/photos/17481616/pexels-photo-17481616/free-photo-of-amor-romantico-hoja-regalo.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
    "https://images.pexels.com/photos/17346212/pexels-photo-17346212/free-photo-of-pajaro-animal-bailando-zoo.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
    "https://images.pexels.com/photos/16251652/pexels-photo-16251652/free-photo-of-luces-noche-edificios-faro.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
    "https://images.pexels.com/photos/14918480/pexels-photo-14918480.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
  ];

  // Método para incrementar el contador
  void _incrementCounter() {
    setState(() {
      _counter = (_counter +1) %numeros.length;
    });
  }

  void _changeImage(DragUpdateDetails details) {
    // Si la diferencia vertical es positiva, se deslizó hacia abajo
    // Si es negativa, se deslizó hacia arriba
    if (details.delta.dy > 0) {
      setState(() {
        _counterimage = (_counterimage + 1) % numeros.length;
      });
    } else if (details.delta.dy < 0) {
      setState(() {
        _counterimage = (_counterimage - 1 + numeros.length) % numeros.length;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    // Extraer widgets que no cambian dinámicamente
     final avatar = CircleAvatar(
      radius: 56,
      backgroundColor: Colors.white60,
      backgroundImage: images.isNotEmpty ? NetworkImage(images[_counterimage]) : null,
       key: ValueKey<int>(_counter),
      // Utilizamos el GestureDetector para detectar los gestos de deslizamiento
      child: GestureDetector(
        onVerticalDragUpdate: _changeImage,
      ),
    );

     final numAvatar = Text(_counterimage.toString(), style: const TextStyle(
       fontSize: 35,
       color: Colors.white
     ),);

    const name = Text(
      'Jairo Rocano Ponce',
      style: TextStyle(
        color: Colors.white,
        fontSize: 22,
        fontWeight: FontWeight.w600,
      ),
    );

    const jobTitle = Text(
      'FLUTTER DEVELOPER',
      style: TextStyle(
        color: Colors.white70,
        fontSize: 15,
        letterSpacing: 2,
        fontWeight: FontWeight.w400,
      ),
    );

    return Scaffold(
      backgroundColor: Colors.indigo,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            numAvatar,
            avatar,
            name,
            jobTitle,
            Text(
              numeros[_counter].toString(),
              style: const TextStyle(fontSize: 40, color: Colors.white70),
            ),
            ElevatedButton(
              onPressed: _incrementCounter,
              child: const Text('Click'),
            ),

          ],
        ),
      ),
    );
  }
}
