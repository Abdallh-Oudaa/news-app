import 'dart:ui';

import 'package:news_app/core/my-theme.dart';

class Categories {
  String? id;
  String? title;
  String? imagePath;
  Color? color;
  Categories(
      {required this.id,
      required this.title,
      required this.imagePath,
      required this.color});
  static List<Categories> getAllCategories() {
    //business entertainment general health science sports technology
    return [
      Categories(
          id: "sports",
          title: "Sports",
          imagePath: "Assets/images/ball.png",
          color: MyTheme.redColor),
      Categories(
          id: "technology",
          title: "Technology",
          imagePath: "Assets/images/technology.png",
          color: MyTheme.blueColor),
      Categories(
          id: "health",
          title: "Health",
          imagePath: "Assets/images/health.png",
          color: MyTheme.pinkColor),
      Categories(
          id: "business",
          title: "Business",
          imagePath: "Assets/images/bussines.png",
          color: MyTheme.bambyColor),
      Categories(
          id: "entertainment",
          title: "entertainment",
          imagePath: "Assets/images/environment.png",
          color: MyTheme.accentBlueColor),
      Categories(
          id: "science",
          title: "Science",
          imagePath: "Assets/images/science.png",
          color: MyTheme.yallowColor),
    ];
  }
}
