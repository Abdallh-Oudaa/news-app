import 'package:flutter/material.dart';

import '../../data-layer/model/NewsResponse.dart';
import '../../data-layer/model/Source.dart';

class NewsItem extends StatelessWidget {
 final News news;
 final Source source;
  const NewsItem({required this.news,required this.source,super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
     padding: const EdgeInsets.all(5),
      child:Column(
       crossAxisAlignment: CrossAxisAlignment.start,
       children: [
      Image.network(news.urlToImage??"",),
      Text(source.name??"",style: const TextStyle(color: Colors.grey,fontSize: 15,),),
      Text(news.title??"",style: const TextStyle(color: Colors.black),),

    ],),);
  }
}
