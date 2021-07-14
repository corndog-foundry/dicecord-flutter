import 'package:dicecord_mobile/data_classes/5e/character_5e.dart';

class ArgSetSheet {
  final String webhookURL;
  final bool verboseMode;
  final String diceType;
  final String gameName;
  final Character5e character;

  ArgSetSheet({
    this.webhookURL,
    this.verboseMode,
    this.diceType,
    this.gameName,
    this.character,
  });
}