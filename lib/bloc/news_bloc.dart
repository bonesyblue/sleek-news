import 'package:SleekNews/bloc/news.dart';
import 'package:SleekNews/repositories/news_repository.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NewsBloc extends Bloc<NewsEvent, NewsState> {
  final NewsRepository repository;

  NewsBloc({
    @required this.repository,
  }) : super(NewsInitial());

  @override
  Stream<NewsState> mapEventToState(NewsEvent event) async* {
    if (event is FetchNews) {
      yield* _mapFetchMeToState(event);
    }
  }

  Stream<NewsState> _mapFetchMeToState(FetchNews event) async* {
    try {
      yield NewsLoading();

      final news = await repository.fetchNews();
      yield NewsAvailable(news: news.response);
    } catch (error) {
      yield NewsError();
    }
  }
}
