import 'package:dicecord_mobile/data_classes/game.dart';
import 'package:dicecord_mobile/ui/game_tile.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class GamesScreen extends StatelessWidget {
  int refreshes = 0;

  getGames () async {
    final box = await Hive.openBox<Game>('games');

    return box.values;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("My Games"),
      ),
      body: Center(
        child: FutureBuilder(
          future: getGames(),
          builder: (BuildContext ctx, AsyncSnapshot snapshot) {
            List<Widget> children;

            if (snapshot.hasData) {
              children = [
                ListView.builder(
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  itemCount: snapshot.data.length,
                  itemBuilder: (context, index) {
                    Game game = snapshot.data.toList()[index];

                    return GameTile(
                      game: game,
                      gameListIndex: index,
                    );
                  },
                )
              ];
            }
            else if (snapshot.hasError) {
              children = [
                Text("An error occurred: " + snapshot.error)
              ];
            }
            else {
              children = [
                Text("No games were found.")
              ];
            }

            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: children,
              ),
            );
          },
        )
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () => Navigator.pushNamed(
            context,
            '/creategame',
        )
      ),
    );
  }
}
