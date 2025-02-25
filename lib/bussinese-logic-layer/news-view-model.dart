import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:news_app/bussinese-logic-layer/RepositoryContract/news-repository.dart';

import 'package:news_app/data-layer/model/NewsResponse.dart';
@injectable
class NewsViewModel extends Cubit<NewsViewModelState>{
  late NewsRepository newsRepository;


  NewsViewModel({required this.newsRepository}):super(LoadingState());
  void getNewsBySourceId(String sourceId)async{
    var response=await newsRepository.getNews(sourceId);
    try{
      if(response?.articles==null){
        emit(LoadingState());
      }
      if(response?.status=="error"){
        emit(ErrorState(message: response?.message));
      }
      else{
        emit(SuccessState(news: response?.articles));
      }
    }catch(e){
      emit(ErrorState(message: e.toString()));
    }
  }

}
sealed class NewsViewModelState{}
class LoadingState extends NewsViewModelState{}
class SuccessState extends NewsViewModelState{
  List<News>? news;
  SuccessState({required this.news});
}
class ErrorState extends NewsViewModelState{
  String? message;
  ErrorState({required this.message});
}
