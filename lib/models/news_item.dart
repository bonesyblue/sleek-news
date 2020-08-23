import 'package:json_annotation/json_annotation.dart';

part 'news_item.g.dart';

@JsonSerializable()
class NewsItem {
  String id;
  String type;
  String sectionId;
  String sectionName;
  @JsonKey(name: "webPublicationDate")
  String publicationDate; // ISO date string
  @JsonKey(name: "webTitle")
  String title;

  NewsItem({
    this.id,
    this.type,
    this.sectionId,
    this.sectionName,
    this.publicationDate,
    this.title,
  });

  factory NewsItem.fromJson(Map<String, dynamic> json) =>
      _$NewsItemFromJson(json);

  Map<String, dynamic> toJson() => _$NewsItemToJson(this);
}
