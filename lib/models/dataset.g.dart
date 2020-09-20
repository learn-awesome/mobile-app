// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dataset.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Dataset _$DatasetFromJson(Map<String, dynamic> json) {
  return Dataset()
    ..topics = (json['topics'] as List)
        ?.map(
            (e) => e == null ? null : Topic.fromJson(e as Map<String, dynamic>))
        ?.toList()
    ..idea_sets = (json['idea_sets'] as List)
        ?.map((e) =>
            e == null ? null : Idea_set.fromJson(e as Map<String, dynamic>))
        ?.toList()
    ..experts = (json['experts'] as List)
        ?.map((e) =>
            e == null ? null : Expert.fromJson(e as Map<String, dynamic>))
        ?.toList();
}

Map<String, dynamic> _$DatasetToJson(Dataset instance) => <String, dynamic>{
      'topics': instance.topics,
      'idea_sets': instance.idea_sets,
      'experts': instance.experts
    };
