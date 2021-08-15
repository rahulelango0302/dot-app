// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'films_adapter.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class filmAdapter extends TypeAdapter<Film> {
  @override
  final int typeId = 1;

  @override
  Film read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Film(
      title: fields[0] as String,
      director: fields[1] as String,
    );
  }

  @override
  void write(BinaryWriter writer, Film obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.title)
      ..writeByte(1)
      ..write(obj.director);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is filmAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
