// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Item _$ItemFromJson(Map<String, dynamic> json) {
  return Item()
    ..id = json['id'] as String
    ..name = json['name'] as String
    ..item_type_id = json['item_type_id'] as String
    ..image_url = json['image_url'] as String
    ..description = json['description'] as String
    ..overall_score = json['overall_score'] as String
    ..links = (json['links'] as List)
        ?.map(
            (e) => e == null ? null : Link.fromJson(e as Map<String, dynamic>))
        ?.toList();
}

Map<String, dynamic> _$ItemToJson(Item instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'item_type_id': instance.item_type_id,
      'image_url': instance.image_url,
      'description': instance.description,
      'overall_score': instance.overall_score,
      'links': instance.links
    };
