import '../../data-layer/model/NewsResponse.dart';

abstract class NewsRepository{
  Future<NewsResponse?> getNews(String sourceId);
}