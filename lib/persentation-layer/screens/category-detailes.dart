import 'package:flutter/material.dart';
import 'package:news_app/data-layer/model/Source.dart';
import 'package:news_app/data-layer/model/categories.dart';
import 'package:news_app/persentation-layer/widgets/news-container.dart';
import 'package:news_app/persentation-layer/widgets/tap-item.dart';

class CategoryDetails extends StatefulWidget {
  final List<Source> sources;




   CategoryDetails({required this.sources, super.key,});

  @override
  State<CategoryDetails> createState() => _TapNewsScreenState();
}

class _TapNewsScreenState extends State<CategoryDetails> {
  int? selectedIndex=0;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: widget.sources!.length,
        child: Column(
          children: [
            TabBar(

              isScrollable:true ,
              indicatorColor: Colors.transparent,
              onTap: (index) {
                selectedIndex = index;
                setState(() {

                });
              },
              tabs: widget.sources
                  !.map((source) => TapItem(
                      isSelected: selectedIndex == widget.sources?.indexOf(source),
                      source: source))
                  .toList(),
            ),
            Expanded(child: NewsContainer(source: widget.sources![selectedIndex!], ))
          ],
        ));
  }
}
