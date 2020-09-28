import 'package:json_annotation/json_annotation.dart';
import "expert.dart";
part 'expertsList.g.dart';

@JsonSerializable()
class ExpertsList {

    List<Expert> experts;
    ExpertsList({this.experts});
    factory ExpertsList.fromJson(List<dynamic> json) {
    return ExpertsList(
      experts: json
          .map((e) => Expert.fromJson(e as Map<String, dynamic>))
          .toList());
  }
}
