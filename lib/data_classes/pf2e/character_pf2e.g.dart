// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'character_pf2e.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class CharacterPF2eAdapter extends TypeAdapter<CharacterPF2e> {
  @override
  final int typeId = 1;

  @override
  CharacterPF2e read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return CharacterPF2e(
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
    );
  }

  @override
  void write(BinaryWriter writer, CharacterPF2e obj) {
    writer
      ..writeByte(36)
      ..writeByte(0)
      ..write(obj.characterName)
      ..writeByte(1)
      ..write(obj.characterAncestry)
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
      ..write(obj.fortSaveProficiency)
      ..writeByte(13)
      ..write(obj.refSaveProficiency)
      ..writeByte(14)
      ..write(obj.willSaveProficiency)
      ..writeByte(15)
      ..write(obj.perceptionProficiency)
      ..writeByte(16)
      ..write(obj.ancestryHitPoints)
      ..writeByte(17)
      ..write(obj.classHitPoints)
      ..writeByte(18)
      ..write(obj.acrobaticsProficiency)
      ..writeByte(19)
      ..write(obj.arcanaProficiency)
      ..writeByte(20)
      ..write(obj.athleticsProficiency)
      ..writeByte(21)
      ..write(obj.craftingProficiency)
      ..writeByte(22)
      ..write(obj.deceptionProficiency)
      ..writeByte(23)
      ..write(obj.diplomacyProficiency)
      ..writeByte(24)
      ..write(obj.intimidationProficiency)
      ..writeByte(25)
      ..write(obj.medicineProficiency)
      ..writeByte(26)
      ..write(obj.natureProficiency)
      ..writeByte(27)
      ..write(obj.occultismProficiency)
      ..writeByte(28)
      ..write(obj.performanceProficiency)
      ..writeByte(29)
      ..write(obj.religionProficiency)
      ..writeByte(30)
      ..write(obj.societyProficiency)
      ..writeByte(31)
      ..write(obj.stealthProficiency)
      ..writeByte(32)
      ..write(obj.survivalProficiency)
      ..writeByte(33)
      ..write(obj.thieveryProficiency)
      ..writeByte(34)
      ..write(obj.currentHitPoints)
      ..writeByte(35)
      ..write(obj.armorClass);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CharacterPF2eAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
