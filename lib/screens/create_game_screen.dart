import 'package:dicecord_mobile/data_classes/game.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hive/hive.dart';
import 'package:mysql1/mysql1.dart';
import 'package:dicecord_mobile/data_classes/database_information.dart';

class CreateGameScreen extends StatefulWidget {
  @override
  _CreateGameScreenState createState() => _CreateGameScreenState();
}

class _CreateGameScreenState extends State<CreateGameScreen> {
  String gameName = '';
  String dicecordCode = '';
  String nickname = '';
  bool verboseMode = false;
  bool diceLabels = false;
  String diceType = '';

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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Row(
              children: [
                Text(
                  "Enter the",
                  style: TextStyle(
                    color: Color.fromARGB(255, 221, 246, 254),
                  ),
                ),
                Text(
                  " Game Name ",
                  style: TextStyle(
                      color: Color.fromARGB(255, 221, 246, 254),
                      fontWeight: FontWeight.bold
                  ),
                ),
                Text(
                  "here:",
                  style: TextStyle(
                    color: Color.fromARGB(255, 221, 246, 254),
                  ),
                )
              ],
              mainAxisAlignment: MainAxisAlignment.center,
            ),
            TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Game Name',
              ),
              onChanged: setGameName,
            ),
            Row(
              children: [
                Text(
                  "Enter your",
                  style: TextStyle(
                    color: Color.fromARGB(255, 221, 246, 254),
                  ),
                ),
                Text(
                  " Dicecord Code ",
                  style: TextStyle(
                      color: Color.fromARGB(255, 221, 246, 254),
                      fontWeight: FontWeight.bold
                  ),
                ),
                Text(
                  "here:",
                  style: TextStyle(
                    color: Color.fromARGB(255, 221, 246, 254),
                  ),
                )
              ],
              mainAxisAlignment: MainAxisAlignment.center,
            ),
            TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Dicecord Code',
              ),
              onChanged: setDicecordCode,
            ),
            Row(
              children: [
                Text(
                  "Enter a",
                  style: TextStyle(
                    color: Color.fromARGB(255, 221, 246, 254),
                  ),
                ),
                Text(
                  " nickname ",
                  style: TextStyle(
                      color: Color.fromARGB(255, 221, 246, 254),
                      fontWeight: FontWeight.bold
                  ),
                ),
                Text(
                  "here:",
                  style: TextStyle(
                    color: Color.fromARGB(255, 221, 246, 254),
                  ),
                )
              ],
              mainAxisAlignment: MainAxisAlignment.center,
            ),
            TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Nickname',
              ),
              onChanged: setNickname,
            ),
            Text(
              "Verbose mode? (Display the result of all rolls)",
              style: TextStyle(
                color: Color.fromARGB(255, 221, 246, 254),
              ),
            ),
            Checkbox(
                value: verboseMode,
                onChanged: (newValue) {
                  setState(() {
                    verboseMode = newValue;
                  });
                }
            ),
            Text(
              "Add dice labels?",
              style: TextStyle(
                color: Color.fromARGB(255, 221, 246, 254),
              ),
            ),
            Checkbox(
                value: diceLabels,
                onChanged: (newValue) {
                  setState(() {
                    diceLabels = newValue;
                  });
                }
            ),
            Text(
              "What type of dice does the game use?",
              style: TextStyle(
                color: Color.fromARGB(255, 221, 246, 254),
              ),
            ),
            DropdownButton(
              items: [
                DropdownMenuItem(
                  child: Text("Standard Dice"),
                  value: "Standard Dice",
                ),
                DropdownMenuItem(
                  child: Text("Star Wars FFG / Genesys"),
                  value: "Star Wars FFG / Genesys",
                ),
                DropdownMenuItem(
                  child: Text("Vampire the Masquerade 5e"),
                  value: "Vampire the Masquerade 5e",
                ),
              ],
              onChanged: (val) {
                setState(() {
                  diceType = val;
                });
              },
              hint: Text(diceType),
            ),
            ElevatedButton(
              child: Text("Create"),
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
                    Fluttertoast.showToast(msg: "Please make sure that your Dicecord Code is correct");
                  }
                } else {
                  Fluttertoast.showToast(
                      msg: "Please make sure that all fields are filled in."
                  );
                }
              }
            )
          ],
        ),
      ),
    );
  }
}
