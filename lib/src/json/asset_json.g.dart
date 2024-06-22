// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'asset_json.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AssetJson _$AssetJsonFromJson(Map<String, dynamic> json) => AssetJson(
      version: json['version'] as String,
      generator: json['generator'] as String?,
    );

Map<String, dynamic> _$AssetJsonToJson(AssetJson instance) {
  final val = <String, dynamic>{
    'version': instance.version,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('generator', instance.generator);
  return val;
}
