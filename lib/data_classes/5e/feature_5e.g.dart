// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'feature_5e.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class Feature5eAdapter extends TypeAdapter<Feature5e> {
  @override
  final int typeId = 2;

  @override
  Feature5e read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Feature5e(
      name: fields[0] as String,
      source: fields[1] as String,
      description: fields[2] as String,
      hasResources: fields[3] as bool,
      resourceCount: fields[4] as int,
    );
  }

  @override
  void write(BinaryWriter writer, Feature5e obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.source)
      ..writeByte(2)
      ..write(obj.description)
      ..writeByte(3)
      ..write(obj.hasResources)
      ..writeByte(4)
      ..write(obj.resourceCount);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Feature5eAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
