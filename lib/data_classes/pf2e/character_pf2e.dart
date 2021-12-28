import 'package:hive/hive.dart';

part 'character_pf2e.g.dart';

@HiveType(typeId: 1)
class CharacterPF2e {
  @HiveField(0)
  String characterName;
  @HiveField(1)
  String characterAncestry;
  @HiveField(2)
  String characterClass;
  @HiveField(3)
  int characterLevel;
  @HiveField(4)
  String characterBackground;
  @HiveField(5)
  String characterAlignment;

  @HiveField(6)
  int strengthScore;
  @HiveField(7)
  int dexterityScore;
  @HiveField(8)
  int constitutionScore;
  @HiveField(9)
  int intelligenceScore;
  @HiveField(10)
  int wisdomScore;
  @HiveField(11)
  int charismaScore;

  @HiveField(12)
  int fortSaveProficiency;
  @HiveField(13)
  int refSaveProficiency;
  @HiveField(14)
  int willSaveProficiency;
  @HiveField(15)
  int perceptionProficiency;
  @HiveField(16)
  int ancestryHitPoints;
  @HiveField(17)
  int classHitPoints;

  @HiveField(18)
  int acrobaticsProficiency;
  @HiveField(19)
  int arcanaProficiency;
  @HiveField(20)
  int athleticsProficiency;
  @HiveField(21)
  int craftingProficiency;
  @HiveField(22)
  int deceptionProficiency;
  @HiveField(23)
  int diplomacyProficiency;
  @HiveField(24)
  int intimidationProficiency;
  @HiveField(25)
  int medicineProficiency;
  @HiveField(26)
  int natureProficiency;
  @HiveField(27)
  int occultismProficiency;
  @HiveField(28)
  int performanceProficiency;
  @HiveField(29)
  int religionProficiency;
  @HiveField(30)
  int societyProficiency;
  @HiveField(31)
  int stealthProficiency;
  @HiveField(32)
  int survivalProficiency;
  @HiveField(33)
  int thieveryProficiency;

  @HiveField(34)
  int currentHitPoints;
  @HiveField(35)
  int armorClass;

  CharacterPF2e(
      this.characterName,
      this.characterAncestry,
      this.characterClass,
      this.characterLevel,
      this.characterBackground,
      this.characterAlignment,

      this.strengthScore,
      this.dexterityScore,
      this.constitutionScore,
      this.intelligenceScore,
      this.wisdomScore,
      this.charismaScore,

      this.fortSaveProficiency,
      this.refSaveProficiency,
      this.willSaveProficiency,
      this.perceptionProficiency,
      this.ancestryHitPoints,
      this.classHitPoints,

      this.acrobaticsProficiency,
      this.arcanaProficiency,
      this.athleticsProficiency,
      this.craftingProficiency,
      this.deceptionProficiency,
      this.diplomacyProficiency,
      this.intimidationProficiency,
      this.medicineProficiency,
      this.natureProficiency,
      this.occultismProficiency,
      this.performanceProficiency,
      this.religionProficiency,
      this.societyProficiency,
      this.stealthProficiency,
      this.survivalProficiency,
      this.thieveryProficiency,

      this.currentHitPoints,
      this.armorClass
      );

  addFeature() {
    // TODO: Add addFeature function
  }

  addAttack() {
    // TODO: Add addAttack function
  }

  addSpell() {
    // TODO: Add addSpell function
  }
}