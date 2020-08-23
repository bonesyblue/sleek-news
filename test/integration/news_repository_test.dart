import 'package:SleekNews/repositories/news_repository.dart';
import 'package:SleekNews/services/news_service.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class MockNewsService extends Mock implements NewsService {}

void main() {
  test('asserts null', () {
    expect(
      () => NewsRepository(newsService: null),
      throwsA(isAssertionError),
    );
  });

  group('fetchNews', () {
    final mockNewsRepository = NewsRepository(newsService: MockNewsService());
    test('calls fetchNews from NewsService', () async {
      when(mockNewsRepository.fetchNews()).thenAnswer((_) async {
        return Future.value();
      });

      mockNewsRepository.fetchNews();

      verify(
        mockNewsRepository.fetchNews(),
      ).called(1);
    });
  });
}
