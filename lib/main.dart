import 'dart:io';

import 'package:flutter/material.dart';
import 'package:news_app/core/Di/di.dart';
import 'package:news_app/core/my-theme.dart';
import 'package:news_app/persentation/screens/home-screen.dart';




class MyHttpOverrides extends HttpOverrides{
  @override
  HttpClient createHttpClient(SecurityContext? context){
    return super.createHttpClient(context)
      ..badCertificateCallback = (X509Certificate cert, String host, int port)=> true;
  }
}
void main() {
  configureDependencies();
  HttpOverrides.global =  MyHttpOverrides();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: MyTheme.lightTheme,
      initialRoute: HomeScreen.routName,
      routes: {
        HomeScreen.routName: (context) =>  const HomeScreen(),

      },
    );
  }
}
