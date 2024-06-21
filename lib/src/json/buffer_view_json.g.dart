// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'buffer_view_json.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BufferViewJson _$BufferViewJsonFromJson(Map<String, dynamic> json) =>
    BufferViewJson(
      buffer: (json['buffer'] as num).toInt(),
      byteOffset: (json['byteOffset'] as num).toInt(),
      byteLength: (json['byteLength'] as num).toInt(),
      byteStride: (json['byteStride'] as num?)?.toInt(),
    );

Map<String, dynamic> _$BufferViewJsonToJson(BufferViewJson instance) =>
    <String, dynamic>{
      'buffer': instance.buffer,
      'byteOffset': instance.byteOffset,
      'byteLength': instance.byteLength,
      'byteStride': instance.byteStride,
    };
