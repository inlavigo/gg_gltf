// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'accessor_json.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AccessorJson _$AccessorJsonFromJson(Map<String, dynamic> json) => AccessorJson(
      bufferView: (json['bufferView'] as num).toInt(),
      byteOffset: (json['byteOffset'] as num).toInt(),
      componentType: (json['componentType'] as num).toInt(),
      count: (json['count'] as num).toInt(),
      type: json['type'] as String,
      min: (json['min'] as List<dynamic>).map((e) => e as num).toList(),
      max: (json['max'] as List<dynamic>).map((e) => e as num).toList(),
    );

Map<String, dynamic> _$AccessorJsonToJson(AccessorJson instance) =>
    <String, dynamic>{
      'bufferView': instance.bufferView,
      'byteOffset': instance.byteOffset,
      'componentType': instance.componentType,
      'count': instance.count,
      'type': instance.type,
      'min': instance.min,
      'max': instance.max,
    };
