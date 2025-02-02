import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:news_app/core/my-theme.dart';
import 'package:news_app/data-layer/api/api-manger.dart';
import 'package:news_app/data-layer/model/categories.dart';
import 'package:news_app/persentation-layer/screens/category-detailes.dart';

class SourcesListWidget extends StatelessWidget {
  static const String routName="category details";
 Categories? category;
  SourcesListWidget({super.key,required this.category});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       /* appBar: AppBar(
          title: const Text(
            "news app",
            style: TextStyle(color: Colors.white),

          ),
          centerTitle: true,
          backgroundColor: MyTheme.primaryColor,
        ),*/
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
            return CategoryDetails(sources: sources??[]);
          },
        ));
  }
}
