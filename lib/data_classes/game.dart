import 'package:hive/hive.dart';

part 'game.g.dart';

@HiveType(typeId: 0)
class Game {
  @HiveField(0)
  final String gameName;

  @HiveField(1)
  final String hook;

  @HiveField(2)
  final String nickname;

  @HiveField(3)
  final bool verbose;

  @HiveField(4)
  final bool labels;

  @HiveField(5)
  final String diceType;

  Game({
    this.gameName,
    this.hook,
    this.nickname,
    this.verbose,
    this.labels,
    this.diceType
  });
}