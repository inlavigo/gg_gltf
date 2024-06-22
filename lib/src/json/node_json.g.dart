// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'node_json.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NodeJson _$NodeJsonFromJson(Map<String, dynamic> json) => NodeJson(
      name: json['name'] as String?,
      children: (json['children'] as List<dynamic>?)
          ?.map((e) => (e as num).toInt())
          .toList(),
      mesh: (json['mesh'] as num?)?.toInt(),
    );

Map<String, dynamic> _$NodeJsonToJson(NodeJson instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('name', instance.name);
  writeNotNull('children', instance.children);
  writeNotNull('mesh', instance.mesh);
  return val;
}
