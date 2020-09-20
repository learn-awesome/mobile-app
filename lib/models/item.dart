import 'package:json_annotation/json_annotation.dart';
import "link.dart";
part 'item.g.dart';

@JsonSerializable()
class Item {
    Item();

    String id;
    String name;
    String item_type_id;
    String image_url;
    String description;
    String overall_score;
    List<Link> links;
    
    factory Item.fromJson(Map<String,dynamic> json) => _$ItemFromJson(json);
    Map<String, dynamic> toJson() => _$ItemToJson(this);
}
