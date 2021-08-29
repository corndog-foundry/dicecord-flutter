import 'package:dicecord_mobile/data_classes/game.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hive/hive.dart';
import 'package:mysql1/mysql1.dart';
import 'package:dicecord_mobile/data_classes/database_information.dart';
import 'dart:io' show Platform;

class CreateGameScreen extends StatefulWidget {
  @override
  _CreateGameScreenState createState() => _CreateGameScreenState();
}

class _CreateGameScreenState extends State<CreateGameScreen> {
  String gameName = '';
  String dicecordCode = '';
  String nickname = '';
  bool verboseMode = true;
  bool diceLabels = true;
  String diceType = '';

  bool showAdvancedOptions = false;

  void setGameName (String newName) {
    gameName = newName;
  }

  void setDicecordCode (String newURL) {
    dicecordCode = newURL;
  }

  void setNickname (String newNickname) {
    nickname = newNickname;
  }

  createGame (Game game) async {
    var box = await Hive.openBox<Game>('games');

    box.add(game);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add a Game"),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Row(
                children: [
                  Text(
                    "Enter the",
                    style: TextStyle(
                      color: Color.fromARGB(255, 221, 246, 254),
                      fontSize: 18.0
                    ),
                  ),
                  Text(
                    " Game Name ",
                    style: TextStyle(
                      color: Color.fromARGB(255, 221, 246, 254),
                      fontWeight: FontWeight.bold,
                      fontSize: 18.0
                    ),
                  ),
                  Text(
                    "here:",
                    style: TextStyle(
                      color: Color.fromARGB(255, 221, 246, 254),
                      fontSize: 18.0
                    ),
                  )
                ],
                mainAxisAlignment: MainAxisAlignment.center,
              ),
              SizedBox(height: 10.0),
              TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Game Name',
                ),
                onChanged: setGameName,
                style: TextStyle(
                  color: Color.fromARGB(255, 221, 246, 254),
                  fontSize: 16.0
                ),
              ),
              SizedBox(height: 25.0),
              Row(
                children: [
                  Text(
                    "Enter your",
                    style: TextStyle(
                      color: Color.fromARGB(255, 221, 246, 254),
                      fontSize: 18.0
                    ),
                  ),
                  Text(
                    " Dicecord Code ",
                    style: TextStyle(
                      color: Color.fromARGB(255, 221, 246, 254),
                      fontWeight: FontWeight.bold,
                      fontSize: 18.0
                    ),
                  ),
                  Text(
                    "here:",
                    style: TextStyle(
                      color: Color.fromARGB(255, 221, 246, 254),
                      fontSize: 18.0
                    ),
                  )
                ],
                mainAxisAlignment: MainAxisAlignment.center,
              ),
              SizedBox(height: 10.0),
              TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Dicecord Code',
                ),
                onChanged: setDicecordCode,
                style: TextStyle(
                    color: Color.fromARGB(255, 221, 246, 254),
                    fontSize: 16.0
                ),
              ),
              SizedBox(height: 25.0),
              Row(
                children: [
                  Text(
                    "Enter a",
                    style: TextStyle(
                      color: Color.fromARGB(255, 221, 246, 254),
                      fontSize: 18.0
                    ),
                  ),
                  Text(
                    " nickname ",
                    style: TextStyle(
                      color: Color.fromARGB(255, 221, 246, 254),
                      fontWeight: FontWeight.bold,
                      fontSize: 18.0
                    ),
                  ),
                  Text(
                    "here:",
                    style: TextStyle(
                      color: Color.fromARGB(255, 221, 246, 254),
                      fontSize: 18.0
                    ),
                  )
                ],
                mainAxisAlignment: MainAxisAlignment.center,
              ),
              SizedBox(height: 10.0),
              TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Nickname',
                ),
                onChanged: setNickname,
                style: TextStyle(
                    color: Color.fromARGB(255, 221, 246, 254),
                    fontSize: 16.0
                ),
              ),
              SizedBox(height: 25.0),
              Text(
                "What type of dice does the game use?",
                style: TextStyle(
                  color: Color.fromARGB(255, 221, 246, 254),
                  fontSize: 18.0
                ),
              ),
              SizedBox(height: 25.0),
              DropdownButton(
                items: [
                  DropdownMenuItem(
                  child: Text("Pool: Standard Dice"),
                  value: "Standard Dice",
                ),
                DropdownMenuItem(
                  child: Text("Pool: Star Wars FFG / Genesys"),
                  value: "Star Wars FFG / Genesys",
                ),
                DropdownMenuItem(
                  child: Text("Pool: Vampire the Masquerade 5e"),
                  value: "Vampire the Masquerade 5e",
                ),
                DropdownMenuItem(
                  child: Text("Pool: SHIVER"),
                  value: "SHIVER",
                ),
                DropdownMenuItem(
                  child: Text("Sheet: D&D 5th Edition"),
                  value: "D&D 5th Edition",
                )
                ],
                onChanged: (val) {
                  setState(() {
                    diceType = val;
                  });
                },
                hint: Text(
                  diceType,
                  style: TextStyle(
                    fontSize: 16.0,
                    color: Color.fromARGB(255, 221, 246, 254),
                  ),
                ),
              ),
              SizedBox(height: 25.0),
              TextButton(
                  onPressed: () {
                    setState(() {
                      showAdvancedOptions = !showAdvancedOptions;
                    });
                  },
                  child: Text(
                      showAdvancedOptions ? 'Hide Advanced Options' : 'Show Advanced Options'
                  )
              ),
              SizedBox(height: 25.0),
              Visibility(
                visible: showAdvancedOptions,
                child: Column(
                  children: [
                    Text(
                      "Verbose mode? (Display the result of all rolls)",
                      style: TextStyle(
                          color: Color.fromARGB(255, 221, 246, 254),
                          fontSize: 18.0
                      ),
                    ),
                    SizedBox(height: 10.0),
                    Checkbox(
                        value: verboseMode,
                        onChanged: (newValue) {
                          setState(() {
                            verboseMode = newValue;
                          });
                        }
                    ),
                    SizedBox(height: 25.0),
                    Text(
                      "Add dice labels?",
                      style: TextStyle(
                          color: Color.fromARGB(255, 221, 246, 254),
                          fontSize: 18.0
                      ),
                    ),
                    SizedBox(height: 10.0),
                    Checkbox(
                        value: diceLabels,
                        onChanged: (newValue) {
                          setState(() {
                            diceLabels = newValue;
                          });
                        }
                    ),
                    SizedBox(height: 25.0),
                  ],
                ),
              ),

              ElevatedButton(
                child: Text("Create Game"),
                onPressed: () async {
                  if (gameName != '' && dicecordCode != '' && nickname != '' && diceType != '') {
                    var dbSettings = new ConnectionSettings(
                      host: dbHost,
                      port: dbPort,
                      user: dbUser,
                      password: dbPassword,
                      db: dbName
                    );

                    var db = await MySqlConnection.connect(dbSettings);
                    var results = await db.query('select CHANNELHOOK from CHANNELS where CHANNELCODE=$dicecordCode');

                    String webhook = 'INVALID';

                    for (var row in results) {
                      webhook = row[0];
                    }

                    if (webhook != 'INVALID') {
                      await createGame(
                          new Game(
                              gameName: gameName,
                              hook: webhook,
                              nickname: nickname,
                              verbose: verboseMode,
                              labels: diceLabels,
                              diceType: diceType
                          )
                      );
                      Navigator.pop(context);
                      Navigator.popAndPushNamed(context, '/');
                    } else {
                      if (!Platform.isWindows) {
                        Fluttertoast.showToast(
                            msg: "Please make sure that your Dicecord Code is correct");
                      }
                    }
                  } else {
                    if (!Platform.isWindows) {
                      Fluttertoast.showToast(
                          msg: "Please make sure that all fields are filled in."
                      );
                    }
                  }
                }
              )
            ],
          ),
        ),
      ),
    );
  }
}
