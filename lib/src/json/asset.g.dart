// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'asset.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Asset _$AssetFromJson(Map<String, dynamic> json) => Asset(
      version: json['version'] as String,
      generator: json['generator'] as String?,
    );

Map<String, dynamic> _$AssetToJson(Asset instance) => <String, dynamic>{
      'version': instance.version,
      'generator': instance.generator,
    };
