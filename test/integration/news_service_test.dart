import 'dart:convert';
import 'dart:io';

import 'package:SleekNews/models/news_content.dart';
import 'package:SleekNews/services/news_service.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../utils/test_path.dart';

class MockHttpClient extends Mock implements http.Client {}

class MockNewsService extends Mock implements NewsService {
  NewsService _real;
  MockNewsService(http.Client httpClient) {
    _real = NewsService(apiKey: "mock-api-key", httpClient: httpClient);
    when(
      fetchContent(),
    ).thenAnswer(
      (_) => _real.fetchContent(),
    );
  }
}

void main() {
  test('asserts null', () {
    expect(
      () => NewsService(httpClient: null, apiKey: null),
      throwsA(isAssertionError),
    );
  });

  group('fetchContent', () {
    final mockHttpClient = MockHttpClient();
    final mockNewsService = MockNewsService(mockHttpClient);

    final queryParameters = {
      'api-key': 'mock-api-key',
    };

    var uri = Uri.https(
      'content.guardianapis.com',
      '/search',
      queryParameters,
    );

    test(
      'returns NewsContent if http request is successful',
      () async {
        final mockNewsContent =
            await File(testPath("mocks/news_content.json")).readAsString();

        final utString =
            mockNewsContent.replaceAll(RegExp('[^\u0000-\u007F]+'), "");

        final mockNews = NewsContentResponse.fromJson(jsonDecode(utString));

        when(
          mockHttpClient.get(
            uri,
            headers: {
              HttpHeaders.contentTypeHeader: 'application/json; charset=utf-8',
            },
          ),
        ).thenAnswer(
          (_) => Future.value(
            http.Response(
              utString,
              200,
            ),
          ),
        );

        final resp = await mockNewsService.fetchContent();

        expect(resp.response.total, mockNews.response.total);
        expect(resp.response.results.length, mockNews.response.results.length);
      },
    );
    test('throws error if http request fails', () async {
      when(
        mockHttpClient.get(
          uri,
          headers: anyNamed("headers"),
        ),
      ).thenAnswer(
        (_) async => Future.value(
          http.Response('error fetching news', 202),
        ),
      );

      expect(
        () async => await mockNewsService.fetchContent(),
        throwsA(isException),
      );
    });
  });
}
