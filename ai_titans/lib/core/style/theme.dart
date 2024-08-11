import 'package:ai_titans/core/style/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

enum AppTheme { dark }

final appThemeData = {
  AppTheme.dark: ThemeData(
    primaryTextTheme: GoogleFonts.rubikTextTheme(),
    textTheme: GoogleFonts.rubikTextTheme(),
    fontFamily: GoogleFonts.rubik().fontFamily,
    shadowColor: darkPrimaryColor.withOpacity(0.25),
    brightness: Brightness.dark,
    primaryColor: darkPrimaryColor,
    scaffoldBackgroundColor: darkPageBackgroundColor,
    canvasColor: darkCanvasColor,
    tabBarTheme: TabBarTheme(
      labelColor: darkCanvasColor,
      labelStyle: GoogleFonts.rubik(
        textStyle: const TextStyle(
          fontWeight: FontWeight.normal,
          fontSize: 14,
        ),
      ),
      unselectedLabelColor: Colors.black26,
      indicatorSize: TabBarIndicatorSize.tab,
      indicator: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
        color: primaryColor,
      ),
    ),
    cupertinoOverrideTheme: NoDefaultCupertinoThemeData(
      textTheme: CupertinoTextThemeData(
        textStyle: GoogleFonts.rubik(),
      ),
    ),
    highlightColor: Colors.transparent,
    splashColor: Colors.transparent,
    colorScheme: ThemeData()
        .colorScheme
        .copyWith(
          brightness: Brightness.dark,
          secondary: darkSecondaryColor,
          onPrimary: darkOnPrimaryColor,
          background: darkBackgroundColor,
          onSecondary: darkOnSecondaryColor,
          onTertiary: darkPrimaryTxtColor,
          onSurface: darkBackgroundColor,
        )
        .copyWith(background: darkBackgroundColor),
  ),
};
