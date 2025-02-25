import 'package:flutter/material.dart';
import 'package:news_app/core/my-theme.dart';
import 'package:news_app/data-layer/model/categories.dart';


import 'package:news_app/persentation-layer/screens/category-screen.dart';
import 'package:news_app/persentation-layer/screens/settings-screen.dart';
import 'package:news_app/persentation-layer/screens/categroy-detailes.dart';


import '../widgets/home-drawer.dart';

class HomeScreen extends StatefulWidget {
  static const String routName = "home screen";

  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  @override
  void initState() {
    selectedWidget=CategoryScreen(clickOnCategory: clickOnCategory);
    super.initState();
  }
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: const BoxDecoration(
        color: Colors.white,
        image: DecorationImage(
            image: AssetImage("Assets/images/backgroundNewsApp.png"),
            fit: BoxFit.cover),
      ),
      child: Scaffold(
        drawer:  HomeDrawer(clickOnItem: clickOnItem,),
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          shape: const RoundedRectangleBorder(borderRadius: BorderRadius.only(
            bottomLeft:Radius.circular(24),
            bottomRight: Radius.circular(24),
          )),
          backgroundColor: MyTheme.primaryColor,
          title: const Text(
            "news app",
            style: TextStyle(color: Colors.white),
          ),
          centerTitle: true,
        ),
        body: selectedWidget,
      ),
    );
  }
 late  Widget selectedWidget;
  void clickOnItem(MenuItems menuItems){

    switch (menuItems){
      case MenuItems.categories:{
        selectedWidget= CategoryScreen(clickOnCategory: clickOnCategory,);
        setState(() {

        });
        Navigator.pop(context);
      }
      case MenuItems.settings:{
        selectedWidget= const SettingsWidget();
        setState(() {

        });
        Navigator.pop(context);
      }


    }
  }
  void clickOnCategory(Categories category){
    selectedWidget=CategoryDetailes(category: category,);
    setState(() {

    });
  }
}
