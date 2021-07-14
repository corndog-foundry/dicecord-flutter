import 'package:hive/hive.dart';

part 'spell_5e.g.dart';

@HiveType(typeId: 4)
class Spell5e {
  @HiveField(0)
  final String name;
  @HiveField(1)
  final int spellLevel;
  @HiveField(2)
  final String spellDescription;

  Spell5e({
    this.name,
    this.spellLevel,
    this.spellDescription
  });
}