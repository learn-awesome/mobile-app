// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'topic.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Topic _$TopicFromJson(Map<String, dynamic> json) {
  return Topic()
    ..id = json['id'] as String
    ..name = json['name'] as String
    ..search_index = json['search_index'] as String
    ..display_name = json['display_name'] as String
    ..to_param = json['to_param'] as String;
}

Map<String, dynamic> _$TopicToJson(Topic instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'search_index': instance.search_index,
      'display_name': instance.display_name,
      'to_param': instance.to_param
    };
