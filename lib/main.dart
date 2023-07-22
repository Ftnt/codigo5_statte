import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          backgroundColor: Colors.indigo,
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 56,
                backgroundColor: Colors.white60,
                backgroundImage: AssetImage(
                  'assets/images/person1.jpeg')
              ),
              Text('Jairo Rocano Ponce',
              style: TextStyle(
                color: Colors.white,
                fontSize: 22,
                fontWeight: FontWeight.w600
              ),
              ),
              Text('FLUTTER DEVELOPER',
              style: TextStyle(
                color: Colors.white70,
                fontSize: 15,
                letterSpacing: 2,
                fontWeight: FontWeight.w400
              ),
              )
            ],
          )),
    );
  }
}
