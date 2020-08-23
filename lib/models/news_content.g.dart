// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'news_content.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NewsContentResponse _$NewsContentResponseFromJson(Map<String, dynamic> json) {
  return NewsContentResponse(
    response: json['response'] == null
        ? null
        : NewsContent.fromJson(json['response'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$NewsContentResponseToJson(
        NewsContentResponse instance) =>
    <String, dynamic>{
      'response': instance.response?.toJson(),
    };

NewsContent _$NewsContentFromJson(Map<String, dynamic> json) {
  return NewsContent(
    status: json['status'] as String,
    total: json['total'] as int,
    startIndex: json['startIndex'] as int,
    pageSize: json['pageSize'] as int,
    currentPage: json['currentPage'] as int,
    pages: json['pages'] as int,
    orderBy: json['orderBy'] as String,
    results: (json['results'] as List)
        ?.map((e) =>
            e == null ? null : NewsItem.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$NewsContentToJson(NewsContent instance) =>
    <String, dynamic>{
      'status': instance.status,
      'total': instance.total,
      'startIndex': instance.startIndex,
      'pageSize': instance.pageSize,
      'currentPage': instance.currentPage,
      'pages': instance.pages,
      'orderBy': instance.orderBy,
      'results': instance.results?.map((e) => e?.toJson())?.toList(),
    };
