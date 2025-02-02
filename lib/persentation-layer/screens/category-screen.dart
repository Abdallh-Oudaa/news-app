import 'package:flutter/material.dart';

import '../../data-layer/model/categories.dart';
import '../widgets/category-item.dart';
typedef  ClickOnCategory=Function(Categories category);
class CategoryScreen extends StatefulWidget {
ClickOnCategory clickOnCategory;
   CategoryScreen({required this.clickOnCategory, super.key});

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  List<Categories> categories = Categories.getAllCategories();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding:const EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment:  CrossAxisAlignment.start,
        children: [
          const Text("Pick your category\n of interest",style: TextStyle(color: Colors.black),),
          const SizedBox(height: 10,),
          Expanded(
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, crossAxisSpacing: 15, mainAxisSpacing: 15),
              itemBuilder: (context, index) => InkWell(
                onTap: (){
                 widget.clickOnCategory(categories[index]);
                },
                child: CategoryItem(
                    category: categories[index], index: index),
              ),
              itemCount: categories.length,
            ),
          )
        ],
      ),
    );
  }
}
