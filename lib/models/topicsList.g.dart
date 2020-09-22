// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'topicsList.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TopicsList _$TopicsListFromJson(Map<String, dynamic> json) {
  return TopicsList()
    ..topics = (json['topics'] as List)
        ?.map(
            (e) => e == null ? null : Topic.fromJson(e as Map<String, dynamic>))
        ?.toList();
}

Map<String, dynamic> _$TopicsListToJson(TopicsList instance) =>
    <String, dynamic>{'topics': instance.topics};
