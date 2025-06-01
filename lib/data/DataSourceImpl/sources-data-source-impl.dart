
import 'package:injectable/injectable.dart';



import '../DataSourceContract/sources-data-source.dart';
import '../api/api-manger.dart';
import '../model/SourceResponse.dart';
@Injectable(as: SourcesDataSource)
class SourcesDataSourceImpl extends SourcesDataSource{
  ApiManger apiManger;

  SourcesDataSourceImpl({required this.apiManger});
  @override
  Future<SourceResponse?> getSources(String categoryId)async {
     return await apiManger.getSources(categoryId);
  }

}