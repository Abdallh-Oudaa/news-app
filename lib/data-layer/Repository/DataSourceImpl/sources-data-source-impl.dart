
import 'package:injectable/injectable.dart';
import 'package:news_app/data-layer/api/api-manger.dart';

import 'package:news_app/data-layer/model/SourceResponse.dart';


import '../DataSourceContract/sources-data-source.dart';
@Injectable(as: SourcesDataSource)
class SourcesDataSourceImpl extends SourcesDataSource{
  ApiManger apiManger;

  SourcesDataSourceImpl({required this.apiManger});
  @override
  Future<SourceResponse?> getSources(String categoryId)async {
     return await apiManger.getSources(categoryId);
  }

}