// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'expertsList.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ExpertsList _$ExpertsListFromJson(Map<String, dynamic> json) {
  return ExpertsList()
    ..experts = (json['experts'] as List)
        ?.map((e) =>
            e == null ? null : Expert.fromJson(e as Map<String, dynamic>))
        ?.toList();
}

Map<String, dynamic> _$ExpertsListToJson(ExpertsList instance) =>
    <String, dynamic>{'experts': instance.experts};
