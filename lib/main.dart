import 'dart:io';

import 'package:dicecord_mobile/data_classes/game.dart';
import 'package:dicecord_mobile/screens/create_game_screen.dart';
import 'package:dicecord_mobile/screens/games_screen.dart';
import 'package:flutter/material.dart';
import 'package:dicecord_mobile/screens/main_screen.dart';
import 'package:dicecord_mobile/screens/opening_screen.dart';

import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart' as pathProvider;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  Directory dir = await pathProvider.getApplicationDocumentsDirectory();
  Hive.init(dir.path);
  Hive.registerAdapter(GameAdapter());

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
        '/': (context) => GamesScreen(),
        '/main': (context) => MainScreen(),
        '/creategame': (context) => CreateGameScreen(),
      },
    );
  }
}