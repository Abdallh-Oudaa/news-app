import 'package:flutter/material.dart';
import 'package:news_app/data-layer/model/categories.dart';

class CategoryItem extends StatelessWidget {
  final Categories category;
  final int index;
  const CategoryItem({required this.category, required this.index, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: category.color,
        borderRadius: BorderRadius.only(
          topLeft: const Radius.circular(22),
          topRight: const Radius.circular(22),
          bottomLeft: Radius.circular(index % 2 == 0 ? 22 : 0),
          bottomRight: Radius.circular(index % 2 == 0 ? 0 : 22),
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          SizedBox(
              height: 100,
              child: Image(
                image: AssetImage(
                  category.imagePath ?? "",
                ),
              )),
          Text(category.title ?? ""),
        ],
      ),
    );
  }
}
