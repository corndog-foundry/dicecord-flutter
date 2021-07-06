import 'package:dicecord_mobile/data_classes/5e/feature_5e.dart';
import 'package:dicecord_mobile/data_classes/5e/attack_5e.dart';
import 'package:hive/hive.dart';

part 'character_5e.g.dart';

@HiveType(typeId: 1)
class Character5e {
  @HiveField(0)
   String characterName;
  @HiveField(1)
   String characterRace;
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
   int strengthSavingThrowProficiency;
  @HiveField(13)
   int dexteritySavingThrowProficiency;
  @HiveField(14)
   int constitutionSavingThrowProficiency;
  @HiveField(15)
   int intelligenceSavingThrowProficiency;
  @HiveField(16)
   int wisdomSavingThrowProficiency;
  @HiveField(17)
   int charismaSavingThrowProficiency;

  @HiveField(18)
   int acrobaticsProficiency;
  @HiveField(19)
   int animalHandlingProficiency;
  @HiveField(20)
   int arcanaProficiency;
  @HiveField(21)
   int athleticsProficiency;
  @HiveField(22)
   int deceptionProficiency;
  @HiveField(23)
   int historyProficiency;
  @HiveField(24)
   int insightProficiency;
  @HiveField(25)
   int intimidationProficiency;
  @HiveField(26)
   int investigationProficiency;
  @HiveField(27)
   int medicineProficiency;
  @HiveField(28)
   int natureProficiency;
  @HiveField(29)
   int perceptionProficiency;
  @HiveField(30)
   int performanceProficiency;
  @HiveField(31)
   int persuasionProficiency;
  @HiveField(32)
   int religionProficiency;
  @HiveField(33)
   int sleightOfHandProficiency;
  @HiveField(34)
   int stealthProficiency;
  @HiveField(35)
   int survivalProficiency;

  @HiveField(36)
  int currentHitPoints;
  @HiveField(37)
  int maximumHitPoints;

  @HiveField(38)
  List<Feature5e> racialFeatures = [];
  @HiveField(39)
  List<Feature5e> backgroundFeatures = [];
  @HiveField(40)
  List<Feature5e> classFeatures = [];
  @HiveField(41)
  List<Feature5e> feats = [];
  @HiveField(42)
  List<Attack5e> attacks = [];

  Character5e(
      this.characterName,
      this.characterRace,
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

      this.strengthSavingThrowProficiency,
      this.dexteritySavingThrowProficiency,
      this.constitutionSavingThrowProficiency,
      this.intelligenceSavingThrowProficiency,
      this.wisdomSavingThrowProficiency,
      this.charismaSavingThrowProficiency,

      this.acrobaticsProficiency,
      this.animalHandlingProficiency,
      this.arcanaProficiency,
      this.athleticsProficiency,
      this.deceptionProficiency,
      this.historyProficiency,
      this.insightProficiency,
      this.intimidationProficiency,
      this.investigationProficiency,
      this.medicineProficiency,
      this.natureProficiency,
      this.perceptionProficiency,
      this.performanceProficiency,
      this.persuasionProficiency,
      this.religionProficiency,
      this.sleightOfHandProficiency,
      this.stealthProficiency,
      this.survivalProficiency,

      this.currentHitPoints,
      this.maximumHitPoints
  );

  addFeature(Feature5e newFeature) {
    switch (newFeature.source) {
      case 'Racial Feature':
        print("Adding new racial feature " + newFeature.name);
        racialFeatures.add(newFeature);
        break;

      case 'Background Feature':
        backgroundFeatures.add(newFeature);
        break;

      case 'Class Feature':
        classFeatures.add(newFeature);
        break;

      case 'Feat':
        feats.add(newFeature);
        break;
    }
  }

  addAttack(Attack5e newWeapon) {
    attacks.add(newWeapon);
  }
}