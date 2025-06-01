import 'package:injectable/injectable.dart';


import '../../bussinese/RepositoryContract/news-repository.dart';
import '../DataSourceContract/news-data-source.dart';
import '../model/NewsResponse.dart';
@Injectable(as: NewsRepository)
class NewsRepositoryImpl extends NewsRepository{
  NewsDataSource newsDataSource;
  NewsRepositoryImpl({required this.newsDataSource});
  @override
  Future<NewsResponse?> getNews(String sourceId) {
    return newsDataSource.getNews(sourceId);
  }

}