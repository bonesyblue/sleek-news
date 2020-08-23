import 'package:SleekNews/models/news_content.dart';
import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';

@immutable
abstract class NewsState extends Equatable {
  const NewsState();

  // Ensure that the named arguments are correctly passed https://pub.dev/packages/equatable
  @override
  List<Object> get props => [];
}

class NewsInitial extends NewsState {}

class NewsLoading extends NewsState {}

class NewsError extends NewsState {}

class NewsAvailable extends NewsState {
  final NewsContent news;

  const NewsAvailable({
    @required this.news,
  });

  @override
  List<Object> get props => [news];

  @override
  String toString() => 'NewsAvailable: $news';
}
