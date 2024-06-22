// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'primitive_json.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PrimitiveJson _$PrimitiveJsonFromJson(Map<String, dynamic> json) =>
    PrimitiveJson(
      attributes: Map<String, int>.from(json['attributes'] as Map),
      indices: (json['indices'] as num?)?.toInt(),
      material: (json['material'] as num?)?.toInt(),
      mode: (json['mode'] as num?)?.toInt() ?? 4,
    );

Map<String, dynamic> _$PrimitiveJsonToJson(PrimitiveJson instance) {
  final val = <String, dynamic>{
    'attributes': instance.attributes,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('indices', instance.indices);
  writeNotNull('material', instance.material);
  val['mode'] = instance.mode;
  return val;
}
