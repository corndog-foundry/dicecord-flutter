// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'attack_5e.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class Attack5eAdapter extends TypeAdapter<Attack5e> {
  @override
  final int typeId = 3;

  @override
  Attack5e read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Attack5e(
      name: fields[0] as String,
      attackBonus: fields[1] as int,
      nDamageDice: fields[2] as int,
      damageDiceType: fields[3] as int,
      damageBonus: fields[4] as int,
      damageType: fields[5] as String,
      traits: fields[6] as String,
    );
  }

  @override
  void write(BinaryWriter writer, Attack5e obj) {
    writer
      ..writeByte(7)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.attackBonus)
      ..writeByte(2)
      ..write(obj.nDamageDice)
      ..writeByte(3)
      ..write(obj.damageDiceType)
      ..writeByte(4)
      ..write(obj.damageBonus)
      ..writeByte(5)
      ..write(obj.damageType)
      ..writeByte(6)
      ..write(obj.traits);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Attack5eAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
