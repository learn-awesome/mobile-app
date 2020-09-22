import 'package:json_annotation/json_annotation.dart';

part 'topic_id.g.dart';

@JsonSerializable()
class Topic_id {
    Topic_id();

    String topic_id;
    
    factory Topic_id.fromJson(Map<String,dynamic> json) => _$Topic_idFromJson(json);
    Map<String, dynamic> toJson() => _$Topic_idToJson(this);
}
