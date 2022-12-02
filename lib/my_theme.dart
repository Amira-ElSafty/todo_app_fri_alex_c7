import 'package:flutter/material.dart';

class MyThemeData{
  static Color primaryLightColor = Color(0xff5D9CEC);
  static Color whiteColor = Colors.white;
  static Color greenColor = Color(0xff61E757);
  static Color redColor = Color(0xffEC4B4B);
  static Color blackColor = Color(0xff363636);
  static Color backgroundColorLight = Color(0xffDFECDB);
  static Color greyColor = Color(0xffC8C9CB);
  static Color primaryDarkColor = Color(0xff060E1E);

  static ThemeData lightTheme = ThemeData(
    primaryColor: primaryLightColor,
    primaryTextTheme: TextTheme(
      headline1: TextStyle(
        fontSize: 22,
        fontWeight: FontWeight.bold,
        color: whiteColor
      ),
      headline2: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
          color: blackColor
      ),
      subtitle1: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
          color: blackColor
      ),
      subtitle2: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w400,
          color: blackColor
      ),
      bodyText1: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
          color: primaryLightColor
      ),
    ),
    appBarTheme: AppBarTheme(
      backgroundColor: primaryLightColor,
      elevation: 0
    ),
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: primaryLightColor
    ),
    scaffoldBackgroundColor: backgroundColorLight,
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      selectedItemColor: primaryLightColor,
      unselectedItemColor: greyColor,
      backgroundColor: Colors.transparent,
      elevation: 0

    )
  );

}