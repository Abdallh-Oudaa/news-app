import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:news_app/Di/di.dart';
import 'package:news_app/bussinese-logic-layer/sources-view-model.dart';

import 'package:news_app/data-layer/model/categories.dart';
import 'package:news_app/persentation-layer/screens/sourece-list.dart';

import '../../core/my-theme.dart';

class CategoryDetailes extends StatefulWidget {
  static const String routName = "category details";
  final Categories? category;
  const CategoryDetailes({super.key, required this.category});

  @override
  State<CategoryDetailes> createState() => _CategoryDetailesState();
}

class _CategoryDetailesState extends State<CategoryDetailes> {
  SourcesViewModel viewModel = getIt.get<SourcesViewModel>();

  @override
  @override
  void initState() {
    viewModel.getSourcesByCategoryId(widget.category!.id!);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SourcesViewModel, SourcesViewModelState>(
      bloc: viewModel,
      builder: (context, state) {
        switch (state) {
          case LoadingState():
            {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          case ErrorState():
            {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      state.message ?? "",
                      style: const TextStyle(color: MyTheme.primaryColor),
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
          case SuccessState():
            {
              return SourcesListWidget(sources: state.sources!);
            }
        }
      },
    );
  }
}
/*Scaffold(

        body: FutureBuilder(
          future: ApiManger.getSources(category?.id??""),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            if (snapshot.hasError) {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("something went wrong",style: TextStyle(color: MyTheme.primaryColor),),
                    MaterialButton(
                      color: MyTheme.primaryColor,
                        onPressed: () {}, child: const Text("try again",style: TextStyle(color: Colors.white),))
                  ],
                ),
              );
            }
            if(snapshot.data?.status=="error"){
              return Center(
                child: Column(
                  children: [
                     Text(snapshot.data?.message??"",style:const TextStyle(color: MyTheme.primaryColor),),
                    MaterialButton(
                       color: MyTheme.primaryColor,
                        onPressed: () {}, child: const Text("try again",style: TextStyle(color: Colors.white),))
                  ],
                ),
              );
            }
            var sources=snapshot.data!.sources;
            return SourcesListWidget(sources: sources??[]);
          },
        ));*/
