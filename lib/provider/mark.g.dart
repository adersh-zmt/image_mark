// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mark.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Mark _$MarkFromJson(Map<String, dynamic> json) {
  return Mark(
    x: (json['x'] as num)?.toDouble(),
    y: (json['y'] as num)?.toDouble(),
  );
}

Map<String, dynamic> _$MarkToJson(Mark instance) => <String, dynamic>{
      'x': instance.x,
      'y': instance.y,
    };
