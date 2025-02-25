
import 'package:news_app/data-layer/model/SourceResponse.dart';

abstract class SourcesDataSource{
 Future<SourceResponse?> getSources(String categoryId);
}