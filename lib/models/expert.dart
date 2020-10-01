import 'package:json_annotation/json_annotation.dart';

part 'expert.g.dart';

@JsonSerializable()
class Expert {
    Expert();

    String id;
    String name;
    String description;
    String website;
    String goodreads;
    String image_url;
    String kind;
    String second_kind;
    String to_param;
    String twitter;
    
    factory Expert.fromJson(Map<String,dynamic> json) => _$ExpertFromJson(json);
    Map<String, dynamic> toJson() => _$ExpertToJson(this);
}
