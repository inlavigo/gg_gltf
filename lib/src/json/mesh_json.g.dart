// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mesh_json.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MeshJson _$MeshJsonFromJson(Map<String, dynamic> json) => MeshJson(
      name: json['name'] as String?,
      primitives: (json['primitives'] as List<dynamic>)
          .map((e) => PrimitiveJson.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$MeshJsonToJson(MeshJson instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('name', instance.name);
  val['primitives'] = instance.primitives;
  return val;
}
