import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:news_app/bussinese-logic-layer/RepositoryContract/sources-repository.dart';

import 'package:news_app/data-layer/model/Source.dart';


@injectable
class SourcesViewModel extends Cubit<SourcesViewModelState> {
 late  SourcesRepository sourcesRepository;


  SourcesViewModel({required this.sourcesRepository}):super(LoadingState());
  void getSourcesByCategoryId(String categoryId) async {
    try {
      var response = await sourcesRepository.getSources(categoryId);
      if(response?.status==null){
        emit(LoadingState());
      }
      if (response?.status == "error") {
        emit(ErrorState(message: response?.message));
      } else {
        emit(SuccessState(sources: response?.sources));
      }
    } catch (e) {
      emit(ErrorState(message: e.toString()));
    }
  }
}

sealed class SourcesViewModelState {}

class LoadingState extends SourcesViewModelState {}

class SuccessState extends SourcesViewModelState {
  List<Source>? sources;
  SuccessState({required this.sources});
}

class ErrorState extends SourcesViewModelState {
  String? message;
  ErrorState({required this.message});
}
