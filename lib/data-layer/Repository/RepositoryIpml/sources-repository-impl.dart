import 'package:news_app/bussinese-logic-layer/RepositoryContract/sources-repository.dart';


import 'package:news_app/data-layer/model/SourceResponse.dart';

import '../DataSourceContract/sources-data-source.dart';

class SourcesRepositoryImpl extends SourcesRepository{
  SourcesDataSource sources;
  SourcesRepositoryImpl({required this.sources});
  @override
  Future<SourceResponse?> getSources(String categoryId) {
      return sources.getSources(categoryId);
  }

}