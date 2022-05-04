import 'package:flutter/material.dart';
import 'package:mobile/utils/colors.dart';
import 'package:mobile/utils/util.dart';

import 'Constants.dart';

class ThemeClass {
  static ThemeData lightTheme = ThemeData(
      primarySwatch: Colors.blue,
      primaryColor: Colors.white,
      brightness: Brightness.light,
      accentColor: Colors.black,
      accentIconTheme: IconThemeData(color: Colors.white),
      dividerColor: Colors.white54,
      backgroundColor: Colors.white,
      scaffoldBackgroundColor: scaffoldBackgroundColor,
      appBarTheme: AppBarTheme(
        backgroundColor: colorPrimary,
        foregroundColor: Colors.white,
        actionsIconTheme: IconThemeData(color: Colors.white),
          iconTheme: IconThemeData(
              color: colorPrimary
          )
      ),
      textTheme: TextTheme(
          headline1: TextStyle(color: Colors.black, fontSize: 25.0, fontWeight: FontWeight.bold),
          headline2: TextStyle(color: Colors.black, fontSize: 20.0,fontWeight: FontWeight.w500),
          headline3: TextStyle(color: Colors.black, fontSize: 16.0),
          headline4: TextStyle(color: Colors.black, fontSize: 12.0)),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: scaffoldBackgroundColor,
        unselectedIconTheme: new IconThemeData(color: Colors.blueGrey),
        selectedIconTheme: new IconThemeData(
          color: Constants.clr_blue,
        ),
        unselectedItemColor: Colors.blueGrey,
        selectedItemColor: Constants.clr_blue,
      ),
      tabBarTheme: TabBarTheme(
        unselectedLabelColor: Colors.black54,
        labelColor: Constants.clr_blue,
      ),
      floatingActionButtonTheme: FloatingActionButtonThemeData(
        backgroundColor: colorPrimary,
        foregroundColor: md_theme_light_background,
        hoverColor: md_theme_light_onTertiary,
        focusColor: md_theme_light_onTertiaryContainer,

      ),
      dividerTheme: DividerThemeData(
          color: md_theme_light_onTertiaryContainer
      ),
      cardTheme: CardTheme(
        color: md_theme_light_onPrimary,
        shadowColor: md_theme_light_tertiaryContainer,
        elevation: 1.0,
        shape: Utils.cardShapeRound(),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: Utils.coloredButtonStyle(colorPrimary),
      ),
      iconTheme: IconThemeData(color: md_theme_light_onSurfaceVariant)
  );

  /* Dark theme settings */
  static ThemeData darkTheme = ThemeData(
      primarySwatch: Colors.grey,
      primaryColor: md_theme_dark_primary,
      brightness: Brightness.dark,
      accentColor: Colors.white,
      accentIconTheme: IconThemeData(color: Colors.white),
      dividerColor: Colors.black,
      scaffoldBackgroundColor: md_theme_dark_onSecondary,
      backgroundColor: md_theme_dark_background,
      appBarTheme: AppBarTheme(
        backgroundColor: md_theme_dark_background,
        foregroundColor: md_theme_dark_background,
        actionsIconTheme: IconThemeData(color: Colors.white),
        iconTheme: IconThemeData(
          color: Colors.white
        )
      ),
      textTheme: TextTheme(
          headline1: TextStyle(
              color: Colors.white, fontSize: 25.0, fontWeight: FontWeight.bold),
          headline2: TextStyle(color: Colors.white, fontSize: 20.0,fontWeight: FontWeight.w500),
          headline3: TextStyle(color: Colors.white, fontSize: 16.0),
          headline4: TextStyle(color: Colors.white, fontSize: 12.0)),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: colorPrimaryDark,
        unselectedIconTheme: new IconThemeData(color: Colors.blueGrey),
        selectedIconTheme: new IconThemeData(
          color: Colors.white,
        ),
        unselectedItemColor: Colors.blueGrey,
        selectedItemColor: Colors.white,
      ),
      tabBarTheme: TabBarTheme(
        unselectedLabelColor: Colors.white70,
        labelColor: Colors.white,
      ),
      floatingActionButtonTheme: FloatingActionButtonThemeData(
        backgroundColor: colorPrimary,
        foregroundColor: md_theme_dark_background,
        hoverColor: md_theme_dark_onTertiary,
        focusColor: md_theme_dark_onTertiaryContainer,

      ),
      dividerTheme: DividerThemeData(
        color: md_theme_dark_onTertiaryContainer
      ),
      cardTheme: CardTheme(
        color: md_theme_dark_surface,
        shadowColor: md_theme_dark_tertiaryContainer,
        elevation: 1.0,
        shape: Utils.cardShapeRound(),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: Utils.coloredButtonStyle(colorPrimary),
      ),
      iconTheme: IconThemeData(color: Colors.white));
}