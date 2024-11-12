import 'package:flutter/material.dart';
import 'package:movie_app/core/colors_palette.dart';
import 'package:movie_app/core/config/constants.dart';

class ApplicationThemeManager{
  static ThemeData themeData=ThemeData(
    primaryColor: ColorsPalette.primaryColor,
    bottomNavigationBarTheme:
    BottomNavigationBarThemeData(
      backgroundColor: ColorsPalette.bottomNavigationColor,
      type: BottomNavigationBarType.fixed,
      selectedItemColor:ColorsPalette.selectedColor,
      unselectedItemColor:ColorsPalette.unSelectedColor,
        showUnselectedLabels: true,
      showSelectedLabels: true,
      selectedIconTheme: IconThemeData(
        color: ColorsPalette.selectedColor,
        size:40
      ),
      selectedLabelStyle: TextStyle(
        color: ColorsPalette.selectedColor,
        fontSize: 10,
        fontFamily:Constants.intlFontFamily
      ),
      unselectedIconTheme: IconThemeData(
        color: ColorsPalette.unSelectedColor,
        size: 30,
      ),
      unselectedLabelStyle:  TextStyle(
          color: ColorsPalette.unSelectedColor,
          fontSize: 8,
          fontFamily:Constants.intlFontFamily
      ),


    ),
    scaffoldBackgroundColor: ColorsPalette.primaryColor,
    textTheme:  TextTheme(
      bodyMedium:  TextStyle(
        fontFamily: Constants.intlFontFamily,
        fontWeight: FontWeight.w400,
        fontSize: 10,
        color:ColorsPalette.bodyMediumColor,
      ),
      bodySmall: TextStyle(
        color: ColorsPalette.bodySmallColor,
        fontFamily: Constants.intlFontFamily,
        fontSize: 10,
        fontWeight: FontWeight.w400,
      ),
      titleMedium: TextStyle(
        color: ColorsPalette.titleMediumColor,
        fontFamily: Constants.poppinsFontFamily,
        fontSize: 10,
        fontWeight: FontWeight.w400,
      ),
      titleSmall: TextStyle(
        color: ColorsPalette.titleMediumColor,
        fontFamily: Constants.poppinsFontFamily,
        fontSize: 14,
        fontWeight: FontWeight.w600,
      ),

    )
  );
}