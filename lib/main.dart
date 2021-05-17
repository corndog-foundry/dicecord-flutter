import 'dart:io';

import 'package:dicecord_mobile/data_classes/5e/character_5e.dart';
import 'package:dicecord_mobile/data_classes/5e/feature_5e.dart';
import 'package:dicecord_mobile/data_classes/game.dart';
import 'package:dicecord_mobile/screens/5e/add_feature.dart';
import 'package:dicecord_mobile/screens/5e/edit_character.dart';
import 'package:dicecord_mobile/screens/create_game_screen.dart';
import 'package:dicecord_mobile/screens/games_screen.dart';
import 'package:dicecord_mobile/screens/main_screen_sheet.dart';
import 'package:flutter/material.dart';
import 'package:dicecord_mobile/screens/main_screen.dart';

import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart' as pathProvider;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  Directory dir = await pathProvider.getApplicationDocumentsDirectory();
  Hive.init(dir.path);
  Hive.registerAdapter(GameAdapter());
  Hive.registerAdapter(Character5eAdapter());
  Hive.registerAdapter(Feature5eAdapter());

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
          // Main Routes
          '/': (context) => GamesScreen(),
          '/main/pool': (context) => MainScreen(),
          '/main/sheet': (context) => MainScreenSheet(),
          '/creategame': (context) => CreateGameScreen(),

          // 5e Routes
          '/5e/addfeature': (context) => AddFeature5e(),
          '/5e/editcharacter': (context) => EditCharacter5e(),
        }
    );
  }
}