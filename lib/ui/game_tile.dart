import 'package:dicecord_mobile/data_classes/game.dart';
import 'package:dicecord_mobile/screens/opening_screen.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class GameTile extends StatelessWidget {
  Game game;
  int gameListIndex;

  GameTile ({
    this.game,
    this.gameListIndex
  });

  removeGame () async {
    final box = await Hive.openBox<Game>('games');

    box.deleteAt(gameListIndex);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListTile(
        leading: Image.asset('img/icon-smaller.png'),
        title: Text(
          game.gameName,
          style: TextStyle(
            fontSize: 18.0,
            color: Color.fromARGB(255, 221, 246, 254),
            fontWeight: FontWeight.bold
          ),
        ),
        onTap: () {
          Navigator.pushNamed(
              context,
              '/main',
              arguments: OpeningScreenArgs(
                game.hook,
                game.nickname,
                game.verbose,
                game.labels,
                game.diceType,
                game.gameName
              )
          );
        },
        onLongPress: () {
          showDialog(
            context: context,
            barrierDismissible: false,
            builder: (BuildContext context) {
              return AlertDialog(
                title: Text("Delete Game?"),
                content: Text("Would you like to delete " + game.gameName + "?"),
                actions: [
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text("NO")
                  ),
                  TextButton(
                      onPressed: () {
                        removeGame();
                        Navigator.pop(context);
                        Navigator.popAndPushNamed(context, '/');
                      },
                      child: Text("YES")
                  ),
                ],
              );
            }
          );
        },
      ),
    );
  }
}
