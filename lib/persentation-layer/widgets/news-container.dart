import 'package:flutter/material.dart';
import 'package:news_app/data-layer/api/api-manger.dart';
import 'package:news_app/data-layer/model/Source.dart';
import 'package:news_app/persentation-layer/widgets/news-item.dart';

import '../../core/my-theme.dart';

class NewsContainer extends StatelessWidget {
  final Source source;
  const NewsContainer({required this.source, super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: ApiManger.getNewsBySourceId(source.id ?? ""),
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
                const Text(
                  "something went wrong",
                  style: TextStyle(color: MyTheme.primaryColor),
                ),
                MaterialButton(
                    color: MyTheme.primaryColor,
                    onPressed: () {},
                    child: const Text(
                      "try again",
                      style: TextStyle(color: Colors.white),
                    ))
              ],
            ),
          );
        }
        if (snapshot.data?.status == "error") {
          return Center(
            child: Column(
              children: [
                Text(
                  snapshot.data?.message ?? "",
                  style: const TextStyle(color: MyTheme.primaryColor),
                ),
                MaterialButton(
                    color: MyTheme.primaryColor,
                    onPressed: () {},
                    child: const Text(
                      "try again",
                      style: TextStyle(color: Colors.white),
                    ))
              ],
            ),
          );
        }
        var news = snapshot.data!.articles;
        return ListView.builder(
          itemBuilder: (context, index) => NewsItem(news: news![index],source: source,),
          itemCount: news?.length,
        );
      },
    );
  }
}
