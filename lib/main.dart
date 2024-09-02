import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:music_flutter/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Music App',
      debugShowCheckedModeBanner: false,
      home: Myhomepage(),
    );
  }
}
