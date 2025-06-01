

import '../model/NewsResponse.dart';

abstract class NewsDataSource{
  Future<NewsResponse?> getNews(String sourceId);
}