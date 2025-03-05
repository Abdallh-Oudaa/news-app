import 'package:news_app/data-layer/model/NewsResponse.dart';

abstract class NewsDataSource{
  Future<NewsResponse?> getNews(String sourceId);
}