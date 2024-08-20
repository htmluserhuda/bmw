import 'package:bmw/screens/home.dart';
import 'package:bmw/screens/result.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(BMW());
}

class BMW extends StatelessWidget {
  const BMW({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Home(),
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
    );
  }
}
