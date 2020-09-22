import 'package:json_annotation/json_annotation.dart';
import "item.dart";
import "topic_id.dart";
part 'idea_set.g.dart';

@JsonSerializable()
class Idea_set {
    Idea_set();

    String id;
    String name;
    List<Item> items;
    List<Topic_id> topic_idea_sets;
    
    factory Idea_set.fromJson(Map<String,dynamic> json) => _$Idea_setFromJson(json);
    Map<String, dynamic> toJson() => _$Idea_setToJson(this);
}
