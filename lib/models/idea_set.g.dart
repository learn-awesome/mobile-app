// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'idea_set.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Idea_set _$Idea_setFromJson(Map<String, dynamic> json) {
  return Idea_set()
    ..id = json['id'] as String
    ..name = json['name'] as String
    ..items = (json['items'] as List)
        ?.map(
            (e) => e == null ? null : Item.fromJson(e as Map<String, dynamic>))
        ?.toList()
    ..topic_idea_sets = (json['topic_idea_sets'] as List)
        ?.map((e) =>
            e == null ? null : Topic_id.fromJson(e as Map<String, dynamic>))
        ?.toList();
}

Map<String, dynamic> _$Idea_setToJson(Idea_set instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'items': instance.items,
      'topic_idea_sets': instance.topic_idea_sets
    };
