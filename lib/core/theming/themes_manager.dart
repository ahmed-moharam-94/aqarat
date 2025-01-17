import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'colors_manager.dart';

class ThemesManager {
  static ThemeData lightTheme = ThemeData(
    dialogBackgroundColor: ColorsManager.white,
    scaffoldBackgroundColor: ColorsManager.white,
    splashColor: Colors.transparent,
    primaryColor: ColorsManager.primary,
    primaryColorLight: ColorsManager.primary,
    colorScheme: const ColorScheme.light(
      onPrimary: ColorsManager.primary,
      surface: ColorsManager.white,
    ),
    // bottomNavigationBarTheme: const BottomNavigationBarThemeData(
    //   backgroundColor: ColorsManager.primary,
    //   unselectedLabelStyle: TextStyle(fontSize: 0.1),
    //   selectedItemColor: ColorsManager.secondary,
    //   unselectedItemColor: ColorsManager.white,
    //   type: BottomNavigationBarType.fixed,
    // ),
    appBarTheme:
    const AppBarTheme(backgroundColor: Colors.transparent, elevation: 0),
    inputDecorationTheme: const InputDecorationTheme(
      filled: true,
      fillColor: ColorsManager.white,
    ),
    textTheme: TextTheme(

      //button text theme
      labelLarge: TextStyle(
          fontFamily: "Poppins",
          fontSize: 16.sp,
          fontWeight: FontWeight.w500,
          color: ColorsManager.darkGreyShade),

      //title text theme
      displayLarge: TextStyle(
          fontFamily: "Poppins",
          fontSize: 18.sp,
          fontWeight: FontWeight.w700,
          color: ColorsManager.black),
      //white text
      displaySmall: TextStyle(
          fontFamily: "Poppins",
          fontSize: 13.sp,
          fontWeight: FontWeight.w600,
          color: ColorsManager.white),
      //input field text theme
      displayMedium: TextStyle(
          fontFamily: "Poppins",
          fontSize: 9.sp,
          fontWeight: FontWeight.w300,
          color: ColorsManager.black),
      //title text theme
      bodyLarge: TextStyle(
          fontFamily: "Poppins",
          fontSize: 10.sp,
          fontWeight: FontWeight.w400,
          color: ColorsManager.black),

      labelSmall: TextStyle(
          fontFamily: "Poppins",
          fontSize: 8.sp,
          fontWeight: FontWeight.w500,
          color: ColorsManager.black),
      headlineMedium: TextStyle(
          fontFamily: "Poppins",
          fontSize: 14.sp,
          fontWeight: FontWeight.w500,
          color: ColorsManager.black),
      headlineSmall: TextStyle(
          fontFamily: "Poppins",
          fontSize: 12.sp,
          fontWeight: FontWeight.w600,
          color: ColorsManager.primary),

      bodyMedium: TextStyle(
          fontFamily: "Poppins",
          fontWeight: FontWeight.w500,
          fontSize: 5.sp,
          color: ColorsManager.black),

      bodySmall: TextStyle(
          fontFamily: "Poppins",
          fontSize: 12.sp,
          fontWeight: FontWeight.w400,
          color: ColorsManager.black,
          height: 1.7),
      // normal black text
      titleMedium: TextStyle(
          fontFamily: "Poppins",
          fontSize: 16.sp,
          fontWeight: FontWeight.w400,
          color: ColorsManager.black),
      titleLarge: TextStyle(
          fontFamily: "Poppins",
          fontSize: 18.sp,
          fontWeight: FontWeight.w600,
          color: ColorsManager.black),
      headlineLarge: TextStyle(
          fontFamily: "Poppins",
          fontSize: 14.sp,
          fontWeight: FontWeight.w600,
          color: ColorsManager.black),
      titleSmall: TextStyle(
          fontFamily: "Poppins",
          fontSize: 20.sp,
          fontWeight: FontWeight.w400,
          color: ColorsManager.black),
      labelMedium: TextStyle(
          fontFamily: "Poppins",
          fontSize: 18.sp,
          fontWeight: FontWeight.w600,
          color: ColorsManager.black),
    ),
  );

  // static ThemeData darkTheme = ThemeData(
  //   dialogBackgroundColor: ColorsManager.black,
  //   useMaterial3: false,
  //   scaffoldBackgroundColor: ColorsManager.black,
  //   fontFamily: "Poppins",
  //   inputDecorationTheme: const InputDecorationTheme(
  //     fillColor: ColorsManager.black,
  //     filled: true,
  //   ),
  //   bottomNavigationBarTheme: const BottomNavigationBarThemeData(
  //     backgroundColor: ColorsManager.black,
  //     unselectedLabelStyle: TextStyle(fontSize: 0.1),
  //     selectedItemColor: ColorsManager.white,
  //     unselectedItemColor: ColorsManager.greyDarkShade1,
  //     type: BottomNavigationBarType.fixed,
  //   ),
  //   appBarTheme:
  //   const AppBarTheme(backgroundColor: Colors.transparent, elevation: 0),
  //   textTheme: TextTheme(
  //     labelLarge: TextStyle(
  //         fontFamily: "Poppins",
  //         fontSize: 16.sp,
  //         fontWeight: FontWeight.w600,
  //         color: ColorsManager.black),
  //
  //     //title text theme
  //     displayLarge: TextStyle(
  //         fontFamily: "Poppins",
  //         fontSize: 18.sp,
  //         fontWeight: FontWeight.w700,
  //         color: ColorsManager.black),
  //
  //     displaySmall: TextStyle(
  //         fontFamily: "Poppins",
  //         fontSize: 14.sp,
  //         fontWeight: FontWeight.w400,
  //         color: ColorsManager.black),
  //     //input field text theme
  //     displayMedium: TextStyle(
  //         fontFamily: "Poppins",
  //         fontSize: 14.sp,
  //         fontWeight: FontWeight.w500,
  //         color: ColorsManager.black),
  //
  //     labelSmall: TextStyle(
  //         fontFamily: "Poppins",
  //         fontSize: 10.sp,
  //         fontWeight: FontWeight.w500,
  //         color: ColorsManager.black),
  //     headlineMedium: TextStyle(
  //         fontFamily: "Poppins",
  //         fontSize: 14.sp,
  //         fontWeight: FontWeight.w500,
  //         color: ColorsManager.black),
  //     headlineSmall: TextStyle(
  //         fontFamily: "Poppins",
  //         fontSize: 12.sp,
  //         fontWeight: FontWeight.w600,
  //         color: ColorsManager.black),
  //
  //     // normal black text
  //
  //     titleLarge: TextStyle(
  //         fontFamily: "Poppins",
  //         fontSize: 18.sp,
  //         fontWeight: FontWeight.w600,
  //         color: ColorsManager.black),
  //     headlineLarge: TextStyle(
  //         fontFamily: "Poppins",
  //         fontSize: 14.sp,
  //         fontWeight: FontWeight.w600,
  //         color: ColorsManager.black),
  //     titleSmall: TextStyle(
  //         fontFamily: "Poppins",
  //         fontSize: 20.sp,
  //         fontWeight: FontWeight.w400,
  //         color: ColorsManager.black),
  //     bodyLarge: TextStyle(
  //         fontSize: 20.sp,
  //         fontWeight: FontWeight.w400,
  //         color: ColorsManager.black),
  //
  //     bodySmall: TextStyle(
  //         fontSize: 12.sp,
  //         fontWeight: FontWeight.w500,
  //         color: ColorsManager.black,
  //         height: 1.7),
  //     titleMedium: TextStyle(
  //         fontSize: 16.sp,
  //         fontWeight: FontWeight.w400,
  //         color: ColorsManager.black),
  //     bodyMedium: TextStyle(
  //         fontWeight: FontWeight.w400,
  //         fontSize: 14.sp,
  //         height: 1.3,
  //         color: ColorsManager.black),
  //     labelMedium: TextStyle(
  //         fontFamily: "Poppins",
  //         fontSize: 18.sp,
  //         fontWeight: FontWeight.w600,
  //         color: ColorsManager.black),
  //   ),
  //   buttonTheme: const ButtonThemeData(disabledColor: ColorsManager.greyDarkShade1),
  // );
}