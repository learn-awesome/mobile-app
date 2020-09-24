import 'package:json_annotation/json_annotation.dart';
import "idea_set.dart";
part 'ideaSetList.g.dart';

@JsonSerializable()
class IdeaSetList {
    
    List<Idea_set> ideaSetList;
    
    IdeaSetList({this.ideaSetList});

    factory IdeaSetList.fromJson(List<dynamic> json) {
    return IdeaSetList(
      ideaSetList: json
          .map((e) => Idea_set.fromJson(e as Map<String, dynamic>))
          .toList());
  }
}