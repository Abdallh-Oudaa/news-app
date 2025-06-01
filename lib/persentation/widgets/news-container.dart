import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';




import '../../bussinese/news-view-model.dart';
import '../../core/Di/di.dart';
import '../../core/my-theme.dart';
import '../../data/model/Source.dart';
import 'news-item.dart';

class NewsContainer extends StatefulWidget {
  final Source source;

  NewsContainer({required this.source, super.key});

  @override
  State<NewsContainer> createState() => _NewsContainerState();
}

class _NewsContainerState extends State<NewsContainer> {
  final NewsViewModel viewModel =getIt.get<NewsViewModel>();
  @override
  void initState() {
    viewModel.getNewsBySourceId(widget.source.id!);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewsViewModel,NewsViewModelState>(
      bloc:viewModel ,
      builder: (context, state) {
        switch(state){
          case LoadingState():{
            return const  Center(child: CircularProgressIndicator(),);
          }
          case ErrorState():{
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    state.message!,
                    style:const TextStyle(color: MyTheme.primaryColor),
                  ),
                  MaterialButton(
                      color: MyTheme.primaryColor,
                      onPressed: () {
                     initState();
                      },
                      child: const Text(
                        "try again",
                        style: TextStyle(color: Colors.white),
                      ))
                ],
              ),
            );
          }
          case SuccessState():{
            return ListView.builder(
              itemBuilder: (context, index) => NewsItem(
                news: state.news![index],
                source: widget.source,
              ),
              itemCount: state.news?.length,
            );
          }
        }

    },);
  }
}
/*ChangeNotifierProvider(
      create: (context) => widget.viewModel,
      child: Consumer<NewsViewModel>(builder: (context, newsViewModel, child) {
        if (newsViewModel.news == null) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        if (newsViewModel.message != null) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                 Text(
                  newsViewModel.message!,
                  style:const TextStyle(color: MyTheme.primaryColor),
                ),
                MaterialButton(
                    color: MyTheme.primaryColor,
                    onPressed: () {
                      newsViewModel.getNews(widget.source.id!);
                    },
                    child: const Text(
                      "try again",
                      style: TextStyle(color: Colors.white),
                    ))
              ],
            ),
          );
        }
        return ListView.builder(
          itemBuilder: (context, index) => NewsItem(
            news: newsViewModel.news![index],
            source: widget.source,
          ),
          itemCount: newsViewModel.news?.length,
        );
      }),
    );*/
