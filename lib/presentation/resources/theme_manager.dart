import 'package:flutter/material.dart';
import 'package:profile/presentation/resources/color_manager.dart';
import 'package:profile/presentation/resources/font_stayle_manager.dart';

class ThemeManager {
  FontStyleManager styleManager;
  ThemeManager(this.styleManager);
  ThemeData getTheme() {
    return ThemeData(
        primaryColor: ColorManager.primary,
        cardColor: ColorManager.secondary,
        cardTheme: const CardTheme(shadowColor: ColorManager.secondary),
        iconTheme: const IconThemeData(color: ColorManager.textColor),
        textTheme: TextTheme(
          displayLarge: styleManager.getBody1(),
          displayMedium: styleManager.getBody1(),
          displaySmall: styleManager.getSubTitle(),
          headlineLarge: styleManager.getHeading1(),
          headlineMedium: styleManager.getHeading2(),
          headlineSmall: styleManager.getHeading3(),
          bodyLarge: styleManager.getBody1(),
          bodyMedium: styleManager.getBody2(),
          bodySmall: styleManager.getBody3(),
        ));
  }
}
