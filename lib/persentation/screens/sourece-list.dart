import 'package:flutter/material.dart';


import '../../data/model/Source.dart';
import '../widgets/news-container.dart';
import '../widgets/tap-item.dart';

class SourcesListWidget extends StatefulWidget {
  final List<Source> sources;




  SourcesListWidget({required this.sources, super.key,});

  @override
  State<SourcesListWidget> createState() => _TapNewsScreenState();
}

class _TapNewsScreenState extends State<SourcesListWidget> {
  int? selectedIndex=0;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: widget.sources.length,
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
                  .map((source) => TapItem(
                      isSelected: selectedIndex == widget.sources.indexOf(source),
                      source: source))
                  .toList(),
            ),
            Expanded(child: NewsContainer(source: widget.sources[selectedIndex!], ))
          ],
        ));
  }
}
