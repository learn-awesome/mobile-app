import 'package:json_annotation/json_annotation.dart';
import "topic.dart";
import "idea_set.dart";
import "expert.dart";
part 'dataset.g.dart';

@JsonSerializable()
class Dataset {
    Dataset();

    List<Topic> topics;
    List<Idea_set> idea_sets;
    List<Expert> experts;
    
    factory Dataset.fromJson(Map<String,dynamic> json) => _$DatasetFromJson(json);
    Map<String, dynamic> toJson() => _$DatasetToJson(this);
}
