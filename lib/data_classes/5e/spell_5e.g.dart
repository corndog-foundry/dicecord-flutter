// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'spell_5e.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class Spell5eAdapter extends TypeAdapter<Spell5e> {
  @override
  final int typeId = 4;

  @override
  Spell5e read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Spell5e(
      name: fields[0] as String,
      spellLevel: fields[1] as int,
      spellDescription: fields[2] as String,
    );
  }

  @override
  void write(BinaryWriter writer, Spell5e obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.spellLevel)
      ..writeByte(2)
      ..write(obj.spellDescription);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Spell5eAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
