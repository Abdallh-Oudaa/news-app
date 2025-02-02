import 'package:flutter/material.dart';

class MyTheme{
 static const Color primaryColor=Color(0xff39A552);
 static const Color bambyColor=Color(0xffCF7E48);
 static const Color redColor=Color(0xffC91C22);
 static const Color pinkColor=Color(0xffED1E79);
 static const Color blueColor=Color(0xff003E90);
 static const Color accentBlueColor=Color(0xff4882CF);
 static const Color yallowColor=Color(0xffF2D352);




 static ThemeData lightTheme=ThemeData(
  textTheme: const TextTheme(
   headlineLarge: TextStyle(fontSize: 25,fontWeight: FontWeight.w700,color: Color(0xff303030),
   ),
   headlineMedium: TextStyle(fontSize: 22,fontWeight: FontWeight.w400,color: Color(0xffFFFFFF),),
   bodyMedium: TextStyle(fontSize: 22,fontWeight: FontWeight.w400,color: Color(0xffFFFFFF),),
   bodySmall: TextStyle(fontSize: 14,fontWeight: FontWeight.w400,color: Color(0xff39A552),),
  ),
appBarTheme: const AppBarTheme(iconTheme: IconThemeData(color: Colors.white))
 );
}