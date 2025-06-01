import 'package:injectable/injectable.dart';


import '../DataSourceContract/news-data-source.dart';
import '../api/api-manger.dart';
import '../model/NewsResponse.dart';
@Injectable(as:NewsDataSource)
class NewsDataSourceImpl extends NewsDataSource{
  ApiManger apiManger;
  NewsDataSourceImpl({required this.apiManger});
  @override
  Future<NewsResponse?> getNews(String sourceId) {
    return apiManger.getNewsBySourceId(sourceId);
  }

}