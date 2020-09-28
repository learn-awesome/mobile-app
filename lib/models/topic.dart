import 'package:json_annotation/json_annotation.dart';

part 'topic.g.dart';

@JsonSerializable()
class Topic {
    Topic();

    String id;
    String name;
    String search_index;
    String display_name;
    String to_param;
    List<Topic> children;
    
    factory Topic.fromJson(Map<String,dynamic> json) => _$TopicFromJson(json);
    Map<String, dynamic> toJson() => _$TopicToJson(this);
}
