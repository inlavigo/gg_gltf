// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'buffer_json.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BufferJson _$BufferJsonFromJson(Map<String, dynamic> json) => BufferJson(
      uri: json['uri'] as String,
      byteLength: (json['byteLength'] as num).toInt(),
    );

Map<String, dynamic> _$BufferJsonToJson(BufferJson instance) =>
    <String, dynamic>{
      'uri': instance.uri,
      'byteLength': instance.byteLength,
    };
