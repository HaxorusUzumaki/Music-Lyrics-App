import 'package:flutter/material.dart';
import 'package:music_app/view/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Music App',
      theme: ThemeData(
        primarySwatch:  Color.purple(255, 198, 33, 243),
      ),
      home: const HomePage(),
    );
  }
}
