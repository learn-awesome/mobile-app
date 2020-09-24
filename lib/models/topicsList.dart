import 'package:json_annotation/json_annotation.dart';
import "topic.dart";
part 'topicsList.g.dart';

@JsonSerializable()
class TopicsList {

    List<Topic> topics;
    TopicsList({this.topics});
    factory TopicsList.fromJson(List<dynamic> json) {
    return TopicsList(
      topics: json
          .map((e) => Topic.fromJson(e as Map<String, dynamic>))
          .toList());
  }
}
