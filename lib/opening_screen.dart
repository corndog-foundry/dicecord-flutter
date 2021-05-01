import 'package:flutter/material.dart';

class OpeningScreenArgs {
  final String webhookURL;
  final String nickname;
  final bool verboseMode;
  final bool diceLabels;

  OpeningScreenArgs(
      this.webhookURL,
      this.nickname,
      this.verboseMode,
      this.diceLabels
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
                "Version 1.0.0",
                style: TextStyle(
                  fontSize: 12.0,
                  color: Color.fromARGB(255, 221, 246, 254),
                ),
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
                    " Webhook URL ",
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
                  hintText: 'Webhook URL',
                ),
                onChanged: setURL,
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
              TextButton(
                  onPressed: () => Navigator.pushNamed(
                      context,
                      '/main',
                      arguments: OpeningScreenArgs(
                          webhookURL,
                          nickname,
                          verboseMode,
                          diceLabels
                      )
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