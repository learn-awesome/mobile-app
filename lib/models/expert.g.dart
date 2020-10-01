// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'expert.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Expert _$ExpertFromJson(Map<String, dynamic> json) {
  return Expert()
    ..id = json['id'] as String
    ..name = json['name'] as String
    ..description = json['description'] as String
    ..website = json['website'] as String
    ..goodreads = json['goodreads'] as String
    ..image_url = json['image_url'] as String
    ..kind = json['kind'] as String
    ..second_kind = json['second_kind'] as String
    ..to_param = json['to_param'] as String
    ..twitter = json['twitter'] as String;
}

Map<String, dynamic> _$ExpertToJson(Expert instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'website': instance.website,
      'goodreads': instance.goodreads,
      'image_url': instance.image_url,
      'kind': instance.kind,
      'second_kind': instance.second_kind,
      'to_param': instance.to_param
    };
