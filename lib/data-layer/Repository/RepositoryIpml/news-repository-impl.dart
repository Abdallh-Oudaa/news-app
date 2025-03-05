import 'package:injectable/injectable.dart';
import 'package:news_app/bussinese-logic-layer/RepositoryContract/news-repository.dart';
import 'package:news_app/data-layer/Repository/DataSourceContract/news-data-source.dart';
import 'package:news_app/data-layer/model/NewsResponse.dart';
@Injectable(as: NewsRepository)
class NewsRepositoryImpl extends NewsRepository{
  NewsDataSource newsDataSource;
  NewsRepositoryImpl({required this.newsDataSource});
  @override
  Future<NewsResponse?> getNews(String sourceId) {
    return newsDataSource.getNews(sourceId);
  }

}