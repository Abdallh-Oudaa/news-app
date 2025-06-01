import 'package:injectable/injectable.dart';


import '../../bussinese/RepositoryContract/sources-repository.dart';
import '../DataSourceContract/sources-data-source.dart';
import '../model/SourceResponse.dart';


@Injectable(as: SourcesRepository)
class SourcesRepositoryImpl extends SourcesRepository{
  SourcesDataSource sources;
  SourcesRepositoryImpl({required this.sources});
  @override
  Future<SourceResponse?> getSources(String categoryId) {
      return sources.getSources(categoryId);
  }

}