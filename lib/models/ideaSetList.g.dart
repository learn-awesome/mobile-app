// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ideaSetList.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

IdeaSetList _$IdeaSetListFromJson(Map<String, dynamic> json) {
  return IdeaSetList()
    ..ideaSetList = (json['ideaSetList'] as List)
        ?.map((e) =>
            e == null ? null : Idea_set.fromJson(e as Map<String, dynamic>))
        ?.toList();
}

Map<String, dynamic> _$IdeaSetListToJson(IdeaSetList instance) =>
    <String, dynamic>{'ideaSetList': instance.ideaSetList};
