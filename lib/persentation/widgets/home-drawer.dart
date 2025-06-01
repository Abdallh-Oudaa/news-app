import 'package:flutter/material.dart';
import 'package:news_app/core/my-theme.dart';




typedef ClickOnItem=Function(MenuItems menuItems);
enum MenuItems{ categories,settings}
class HomeDrawer extends StatelessWidget {
  ClickOnItem clickOnItem;

   HomeDrawer({required this.clickOnItem,super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
            alignment: Alignment.topCenter,
            width: double.infinity,
            color: MyTheme.primaryColor,
        padding: const EdgeInsets.only(top: 50,bottom: 20),
            child: Text(
              "news app",
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ),
          InkWell(
            onTap: (){
              clickOnItem(MenuItems.categories);
            },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  const Icon(Icons.category),
                  const SizedBox(
                    width: 4,
                  ),
                  Text(
                    "category",
                    style: Theme.of(context)
                        .textTheme
                        .bodyMedium
                        ?.copyWith(color: Colors.black),
                  )
                ],
              ),
            ),
          ),
          InkWell(onTap: (){
            clickOnItem(MenuItems.settings);
          },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  const Icon(Icons.settings),
                  const SizedBox(
                    width: 4,
                  ),
                  Text(
                    "settings",
                    style: Theme.of(context)
                        .textTheme
                        .bodyMedium
                        ?.copyWith(color: Colors.black),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
