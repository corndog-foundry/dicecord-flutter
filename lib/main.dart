import 'package:flutter/material.dart';
import 'package:dicecord_mobile/main_screen.dart';
import 'package:dicecord_mobile/opening_screen.dart';

void main() {
  runApp(DicecordApp());
}

class DicecordApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Dicecord Flutter',
      theme: ThemeData(
        scaffoldBackgroundColor: Color.fromARGB(255, 51, 60, 79),
        primaryColor: Color.fromARGB(255, 71, 80, 99),
        backgroundColor: Color.fromARGB(255, 31, 40, 59),
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => OpeningScreen(),
        '/main': (context) => MainScreen()
      },
    );
  }
}