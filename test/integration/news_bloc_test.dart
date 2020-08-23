import 'package:SleekNews/bloc/news.dart';
import 'package:SleekNews/bloc/news_bloc.dart';
import 'package:SleekNews/models/news_content.dart';
import 'package:SleekNews/repositories/news_repository.dart';
import 'package:SleekNews/services/news_service.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class MockNewsRepository extends Mock implements NewsRepository {}

void main() {
  NewsBloc newsBloc;
  MockNewsRepository newsRepository;

  // Run before all tests
  setUp(() {
    newsRepository = MockNewsRepository();
    newsBloc = NewsBloc(repository: newsRepository);
  });

  // Run after all tests have completed
  tearDown(() {
    newsBloc?.close();
  });

  test("asserts repository is null", () {
    expect(
      () => NewsService(httpClient: null, apiKey: null),
      throwsA(isAssertionError),
    );
  });

  test('asserts initial state is correct', () {
    expect(newsBloc.state, NewsInitial());
  });

  test('checks close does not emit new states', () {
    expectLater(
      newsBloc,
      emits(emitsDone),
    );
    newsBloc.close();
  });

  group('BLoC test', () {
    final NewsContentResponse mockNewsContent = NewsContentResponse(
      response: NewsContent(
        status: "ok",
        total: 2213101,
        startIndex: 1,
        pageSize: 10,
        currentPage: 1,
        pages: 221311,
        orderBy: "newest",
        results: [],
      ),
    );
    blocTest(
      'emits [NewsLoading, NewsAvailable] when FetchNews is added and fetchNews succeeds',
      build: () {
        // Mock network request
        when(
          newsRepository.fetchNews(),
        ).thenAnswer(
          (_) => Future.delayed(
            // Mock slow async conditions
            Duration(milliseconds: 500),
            () => mockNewsContent,
          ),
        );
        return newsBloc;
      },
      act: (bloc) => bloc.add(FetchNews()),
      expect: [
        NewsLoading(),
        NewsAvailable(news: mockNewsContent.response),
      ],
    );

    blocTest(
      'emits [NewsLoading, NewsError] when FetchNews is added and fetchNews fails',
      build: () {
        // Mock network request
        when(
          newsRepository.fetchNews(),
        ).thenThrow(
          Exception("Error fetching news"),
        );
        return newsBloc;
      },
      act: (bloc) => bloc.add(FetchNews()),
      expect: [
        NewsLoading(),
        NewsError(),
      ],
    );
  });
}
