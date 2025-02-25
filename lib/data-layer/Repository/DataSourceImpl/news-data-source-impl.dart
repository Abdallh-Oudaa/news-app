import 'package:news_app/bussinese-logic-layer/RepositoryContract/news-repository.dart';
import 'package:news_app/data-layer/Repository/DataSourceContract/news-data-source.dart';
import 'package:news_app/data-layer/api/api-manger.dart';
import 'package:news_app/data-layer/model/NewsResponse.dart';

class NewsDataSourceImpl extends NewsDataSource{
  ApiManger apiManger;
  NewsDataSourceImpl({required this.apiManger});
  @override
  Future<NewsResponse?> getNews(String sourceId) {
    return apiManger.getNewsBySourceId(sourceId);
  }

}