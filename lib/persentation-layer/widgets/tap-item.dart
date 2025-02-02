import 'package:flutter/material.dart';
import 'package:news_app/core/my-theme.dart';
import 'package:news_app/data-layer/model/Source.dart';

class TapItem extends StatelessWidget {
 final bool isSelected;
final Source source;
  const TapItem({required this.isSelected,required this.source, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
     margin: const EdgeInsets.only(top: 7),
     decoration: BoxDecoration(
       color: isSelected?MyTheme.primaryColor:Colors.transparent,
       borderRadius:BorderRadius.circular(15),
       border: Border.all(color: MyTheme.primaryColor),
     ), 
      child: Text(source.name??"",style: TextStyle(color: isSelected?Colors.white:MyTheme.primaryColor),),);
  }
}
