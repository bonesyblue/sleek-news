import 'package:SleekNews/models/news_item.dart';
import 'package:json_annotation/json_annotation.dart';

part 'news_content.g.dart';

@JsonSerializable(explicitToJson: true)
class NewsContentResponse {
  NewsContent response;

  NewsContentResponse({
    this.response,
  });

  factory NewsContentResponse.fromJson(Map<String, dynamic> json) =>
      _$NewsContentResponseFromJson(json);

  Map<String, dynamic> toJson() => _$NewsContentResponseToJson(this);
}

@JsonSerializable(explicitToJson: true)
class NewsContent {
  String status;
  int total;
  int startIndex;
  int pageSize;
  int currentPage;
  int pages;
  String orderBy;
  List<NewsItem> results;

  NewsContent({
    this.status,
    this.total,
    this.startIndex,
    this.pageSize,
    this.currentPage,
    this.pages,
    this.orderBy,
    this.results,
  });

  factory NewsContent.fromJson(Map<String, dynamic> json) =>
      _$NewsContentFromJson(json);

  Map<String, dynamic> toJson() => _$NewsContentToJson(this);
}
