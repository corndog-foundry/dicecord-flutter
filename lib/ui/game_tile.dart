import 'package:dicecord_mobile/data_classes/5e/character_5e.dart';
import 'package:dicecord_mobile/data_classes/argsets/arg_set_pool.dart';
import 'package:dicecord_mobile/data_classes/argsets/arg_set_sheet.dart';
import 'package:dicecord_mobile/data_classes/game.dart';
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
        onTap: () async {
          var args;
          var character;

          if (game.diceType == 'D&D 5th Edition') {
            final box = await Hive.openBox<Character5e>(game.gameName);

            if (box.values.toList().length == 0) {
              Character5e newCharacter = new Character5e(
                  'New Character',
                  '',
                  '',
                  0,
                  '',
                  '',

                  10,
                  10,
                  10,
                  10,
                  10,
                  10,

                  0,
                  0,
                  0,
                  0,
                  0,
                  0,

                  0,
                  0,
                  0,
                  0,
                  0,
                  0,
                  0,
                  0,
                  0,
                  0,
                  0,
                  0,
                  0,
                  0,
                  0,
                  0,
                  0,
                  0
              );

              box.add(newCharacter);
              character = newCharacter;
            } else {
              character = box.values.toList()[0];
            }

            args = ArgSetSheet(
              webhookURL: game.hook,
              verboseMode: game.verbose,
              diceType: game.diceType,
              gameName: game.gameName,
              character: character
            );

            Navigator.pushNamed(
                context,
                '/main/sheet',
                arguments: args
            );
          } else {
            args = ArgSetPool(
              webhookURL: game.hook,
              nickname: game.nickname,
              verboseMode: game.verbose,
              diceLabels: game.labels,
              diceType: game.diceType,
              gameName: game.gameName
            );

            Navigator.pushNamed(
                context,
                '/main/pool',
                arguments: args
            );
          }
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
