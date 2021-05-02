import 'package:flutter/material.dart';

class OpeningScreenArgs {
  final String webhookURL;
  final String nickname;
  final bool verboseMode;
  final bool diceLabels;
  final String diceType;
  final String gameName;

  OpeningScreenArgs(
      this.webhookURL,
      this.nickname,
      this.verboseMode,
      this.diceLabels,
      this.diceType,
      this.gameName
  );
}


class OpeningScreen extends StatefulWidget {
  @override
  _OpeningScreenState createState() => _OpeningScreenState();
}

class _OpeningScreenState extends State<OpeningScreen> {
  String webhookURL = '';
  String nickname = '';
  bool verboseMode = false;
  bool diceLabels = false;

  void setURL (String newURL) {
    webhookURL = newURL;
  }

  void setNickname (String newNickname) {
    nickname = newNickname;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dicecord Flutter'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(30.0, 0.0, 30.0, 0.0),
          child: Column(
            children: [
              Image.asset('img/icon-smaller.png'),
              Text(
                "Dicecord Flutter",
                style: TextStyle(
                    fontSize: 36.0,
                    color: Color.fromARGB(255, 221, 246, 254),
                    fontWeight: FontWeight.bold
                ),
              ),
              Text(
                "Version 2.0.0",
                style: TextStyle(
                  fontSize: 12.0,
                  color: Color.fromARGB(255, 221, 246, 254),
                ),
              ),
              TextButton(
                  onPressed: () => Navigator.pushNamed(
                      context,
                      '/games'
                  ),
                  child: Text("Start")
              )
            ],
            mainAxisAlignment: MainAxisAlignment.spaceAround,
          ),
        ),
      ),
    );
  }
}