




import '../../data/model/SourceResponse.dart';

abstract class SourcesRepository{
  Future<SourceResponse?> getSources(String categoryId);
 }