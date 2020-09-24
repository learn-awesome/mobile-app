import 'package:json_annotation/json_annotation.dart';

part 'topic_parent.g.dart';

@JsonSerializable()
class Topic_parent {
    Topic_parent();

    String id;
    String name;
    
    factory Topic_parent.fromJson(Map<String,dynamic> json) => _$Topic_parentFromJson(json);
    Map<String, dynamic> toJson() => _$Topic_parentToJson(this);
}
