import 'dart:convert';
import 'dart:io';
import 'package:SleekNews/models/news_content.dart';
import 'package:meta/meta.dart';

import 'package:http/http.dart' as http;

// Simple container for API paths
class Paths {
  final content = "/search";
  final editions = "/editions";
  final sections = "/sections";
  final tags = "/tags";

  const Paths();
}

class NewsService {
  final http.Client httpClient;
  final String apiKey;

  /// API specific properties
  final _origin = "content.guardianapis.com";
  final _paths = Paths();

  NewsService({
    @required this.httpClient,
    @required this.apiKey,
  })  : assert(httpClient != null),
        assert(apiKey != null);

  Future<NewsContentResponse> fetchContent() async {
    var queryParameters = {
      'api-key': '${this.apiKey}',
    };

    var uri = Uri.https(
      _origin,
      _paths.content,
      queryParameters,
    );

    final response = await this.httpClient.get(uri, headers: {
      HttpHeaders.contentTypeHeader: 'application/json; charset=utf-8',
    });

    if (response.statusCode != 200) {
      throw new Exception('error fetching me');
    }

    /// Ensure that response body is parsed as utf8 string before decoding
    /// JSON. This avoids codec issues regarding illegal characters.
    final json = jsonDecode(utf8.decode(response.bodyBytes));
    return NewsContentResponse.fromJson(json);
  }
}
