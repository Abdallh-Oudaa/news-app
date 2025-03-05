import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:injectable/injectable.dart';
import 'package:news_app/data-layer/api/api-cnostants.dart';
import 'package:news_app/data-layer/model/NewsResponse.dart';
import 'package:news_app/data-layer/model/SourceResponse.dart';
@singleton
class ApiManger {
  Future<SourceResponse> getSources(String categoryId) async {
    try{
      Uri url = Uri.https(ApiConstants.baseUrl, ApiConstants.sourceEndPoint,
          {"apiKey": "1228483714c04aeebb823241867f66c7",
          "category":categoryId});
      var response = await http.get(url);
      var bodyString = response.body;
      var json = jsonDecode(bodyString);
     
      return SourceResponse.fromJson(json);
    }catch(e){
      throw e;

    }
  }
   Future<NewsResponse> getNewsBySourceId(String sourceId)async{
    try{
      Uri url = Uri.https(ApiConstants.baseUrl, ApiConstants.newsEndPoint,
          {"apiKey": "1228483714c04aeebb823241867f66c7",
          "sources":sourceId});
      var response = await http.get(url);
      var bodyString = response.body;
      var json = jsonDecode(bodyString);
      return NewsResponse.fromJson(json);
    }catch(e){
      rethrow;

    }
  }
}
