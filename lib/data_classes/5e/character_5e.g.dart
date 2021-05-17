// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'character_5e.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class Character5eAdapter extends TypeAdapter<Character5e> {
  @override
  final int typeId = 1;

  @override
  Character5e read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Character5e(
      fields[0] as String,
      fields[1] as String,
      fields[2] as String,
      fields[3] as int,
      fields[4] as String,
      fields[5] as String,
      fields[6] as int,
      fields[7] as int,
      fields[8] as int,
      fields[9] as int,
      fields[10] as int,
      fields[11] as int,
      fields[12] as int,
      fields[13] as int,
      fields[14] as int,
      fields[15] as int,
      fields[16] as int,
      fields[17] as int,
      fields[18] as int,
      fields[19] as int,
      fields[20] as int,
      fields[21] as int,
      fields[22] as int,
      fields[23] as int,
      fields[24] as int,
      fields[25] as int,
      fields[26] as int,
      fields[27] as int,
      fields[28] as int,
      fields[29] as int,
      fields[30] as int,
      fields[31] as int,
      fields[32] as int,
      fields[33] as int,
      fields[34] as int,
      fields[35] as int,
    )
      ..racialFeatures = (fields[36] as List)?.cast<Feature5e>()
      ..backgroundFeatures = (fields[37] as List)?.cast<Feature5e>()
      ..classFeatures = (fields[38] as List)?.cast<Feature5e>()
      ..feats = (fields[39] as List)?.cast<Feature5e>();
  }

  @override
  void write(BinaryWriter writer, Character5e obj) {
    writer
      ..writeByte(40)
      ..writeByte(0)
      ..write(obj.characterName)
      ..writeByte(1)
      ..write(obj.characterRace)
      ..writeByte(2)
      ..write(obj.characterClass)
      ..writeByte(3)
      ..write(obj.characterLevel)
      ..writeByte(4)
      ..write(obj.characterBackground)
      ..writeByte(5)
      ..write(obj.characterAlignment)
      ..writeByte(6)
      ..write(obj.strengthScore)
      ..writeByte(7)
      ..write(obj.dexterityScore)
      ..writeByte(8)
      ..write(obj.constitutionScore)
      ..writeByte(9)
      ..write(obj.intelligenceScore)
      ..writeByte(10)
      ..write(obj.wisdomScore)
      ..writeByte(11)
      ..write(obj.charismaScore)
      ..writeByte(12)
      ..write(obj.strengthSavingThrowProficiency)
      ..writeByte(13)
      ..write(obj.dexteritySavingThrowProficiency)
      ..writeByte(14)
      ..write(obj.constitutionSavingThrowProficiency)
      ..writeByte(15)
      ..write(obj.intelligenceSavingThrowProficiency)
      ..writeByte(16)
      ..write(obj.wisdomSavingThrowProficiency)
      ..writeByte(17)
      ..write(obj.charismaSavingThrowProficiency)
      ..writeByte(18)
      ..write(obj.acrobaticsProficiency)
      ..writeByte(19)
      ..write(obj.animalHandlingProficiency)
      ..writeByte(20)
      ..write(obj.arcanaProficiency)
      ..writeByte(21)
      ..write(obj.athleticsProficiency)
      ..writeByte(22)
      ..write(obj.deceptionProficiency)
      ..writeByte(23)
      ..write(obj.historyProficiency)
      ..writeByte(24)
      ..write(obj.insightProficiency)
      ..writeByte(25)
      ..write(obj.intimidationProficiency)
      ..writeByte(26)
      ..write(obj.investigationProficiency)
      ..writeByte(27)
      ..write(obj.medicineProficiency)
      ..writeByte(28)
      ..write(obj.natureProficiency)
      ..writeByte(29)
      ..write(obj.perceptionProficiency)
      ..writeByte(30)
      ..write(obj.performanceProficiency)
      ..writeByte(31)
      ..write(obj.persuasionProficiency)
      ..writeByte(32)
      ..write(obj.religionProficiency)
      ..writeByte(33)
      ..write(obj.sleightOfHandProficiency)
      ..writeByte(34)
      ..write(obj.stealthProficiency)
      ..writeByte(35)
      ..write(obj.survivalProficiency)
      ..writeByte(36)
      ..write(obj.racialFeatures)
      ..writeByte(37)
      ..write(obj.backgroundFeatures)
      ..writeByte(38)
      ..write(obj.classFeatures)
      ..writeByte(39)
      ..write(obj.feats);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Character5eAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
