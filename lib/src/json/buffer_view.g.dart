// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'buffer_view.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BufferView _$BufferViewFromJson(Map<String, dynamic> json) => BufferView(
      buffer: (json['buffer'] as num).toInt(),
      byteOffset: (json['byteOffset'] as num).toInt(),
      byteLength: (json['byteLength'] as num).toInt(),
      byteStride: (json['byteStride'] as num?)?.toInt(),
    );

Map<String, dynamic> _$BufferViewToJson(BufferView instance) =>
    <String, dynamic>{
      'buffer': instance.buffer,
      'byteOffset': instance.byteOffset,
      'byteLength': instance.byteLength,
      'byteStride': instance.byteStride,
    };
