// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'buffer.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Buffer _$BufferFromJson(Map<String, dynamic> json) => Buffer(
      uri: json['uri'] as String,
      byteLength: (json['byteLength'] as num).toInt(),
    );

Map<String, dynamic> _$BufferToJson(Buffer instance) => <String, dynamic>{
      'uri': instance.uri,
      'byteLength': instance.byteLength,
    };
