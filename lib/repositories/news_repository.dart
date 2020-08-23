import 'package:SleekNews/models/news_content.dart';
import 'package:SleekNews/services/news_service.dart';
import 'package:meta/meta.dart';

class NewsRepository {
  final NewsService newsService;

  NewsRepository({
    @required this.newsService,
  }) : assert(newsService != null);

  Future<NewsContentResponse> fetchNews() async {
    return await newsService.fetchContent();
  }
}
