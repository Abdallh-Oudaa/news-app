 import 'package:news_app/data-layer/model/SourceResponse.dart';




abstract class SourcesRepository{
  Future<SourceResponse?> getSources(String categoryId);
 }