


import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'color_manager.dart';

var themelight = ThemeData(
    primarySwatch:Colors.teal, // بتاع اللي  بيلف
    scaffoldBackgroundColor: Colors.white,
    appBarTheme: const AppBarTheme(
        titleSpacing: 20,
        backwardsCompatibility: false, //states Bare
        systemOverlayStyle: SystemUiOverlayStyle(statusBarColor: Colors.white),
        backgroundColor: Colors.white,
        elevation: 0.0,
        titleTextStyle: TextStyle(
            color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),
        iconTheme: IconThemeData(color: Colors.black,size: 25)),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      type: BottomNavigationBarType.fixed,
      selectedItemColor:ColorManager.primary,
      unselectedItemColor: Colors.grey,
      backgroundColor: Colors.white,
      elevation: 20.0,
    ),
    textTheme: const TextTheme(
        bodyText1: TextStyle(
            fontFamily: 'jannah',
            fontSize: 20,
            fontWeight: FontWeight.w700,
            color: Colors.black)));

var darktheme = ThemeData(
    scaffoldBackgroundColor: const Color(0xff2B2B2B),
    primarySwatch: Colors.teal, // بتاع اللي  بيلف
    appBarTheme: const AppBarTheme(
        titleSpacing: 20,
        backwardsCompatibility: false, //states Bare
        systemOverlayStyle: SystemUiOverlayStyle(
            statusBarColor: Color(0xff2B2B2B),
            statusBarIconBrightness: Brightness.light),
        backgroundColor: Color(0xff2B2B2B),
        elevation: 0.0,
        titleTextStyle: TextStyle(
            color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
        iconTheme: IconThemeData(color: Colors.white)),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      type: BottomNavigationBarType.fixed,
      selectedItemColor: Colors.teal,
      unselectedItemColor: Colors.grey,
      backgroundColor:Color(0xff2B2B2B),
      elevation: 20.0,
    ),
    textTheme: const TextTheme(
        bodyText1: TextStyle(
            fontSize: 20, fontWeight: FontWeight.w700, color: Colors.white)));
