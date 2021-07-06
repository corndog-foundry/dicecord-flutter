import 'package:hive/hive.dart';

part 'attack_5e.g.dart';

@HiveType(typeId: 3)
class Attack5e {
  @HiveField(0)
  final String name;
  @HiveField(1)
  final int attackBonus;
  @HiveField(2)
  final int nDamageDice;
  @HiveField(3)
  final int damageDiceType;
  @HiveField(4)
  final int damageBonus;
  @HiveField(5)
  final String damageType;
  @HiveField(6)
  final String traits;

  Attack5e({
    this.name,
    this.attackBonus,
    this.nDamageDice,
    this.damageDiceType,
    this.damageBonus,
    this.damageType,
    this.traits
  });
}