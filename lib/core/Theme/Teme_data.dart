import 'package:bmi_task/constants.dart';
import 'package:bmi_task/core/utils/styles.dart';
import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData lightTheme = ThemeData(
    cardColor: Colors.white,

    shadowColor: Colors.black.withOpacity(0.2),

    navigationBarTheme: const NavigationBarThemeData(
      surfaceTintColor: Colors.white,
      backgroundColor: Colors.white,
      indicatorColor: kPrimaryKey,
      elevation: 0.0,
    ),
    // bottomNavigationBarTheme: const BottomNavigationBarThemeData(
    //   backgroundColor: Colors.white,
    //   unselectedItemColor: Colors.grey,
    //   selectedItemColor: kPrimaryKey,
    //   elevation: 0.0,
    //   type: BottomNavigationBarType.fixed,
    // ),
    scaffoldBackgroundColor: Colors.white,
    primaryColor: kPrimaryKey, // Change primary color as needed
    // Change accent color as needed
    textTheme: TextTheme(
      bodySmall: Styles.textStyle12BlackBoldPoppings,
      displayLarge: Styles.textStyle32Black,
      displayMedium: Styles.textStyle32Orange,
      bodyLarge: Styles.textStyle12Black,
      bodyMedium: Styles.textStyle12BoldGrey,
      titleMedium: const TextStyle(color: Colors.black),
      titleSmall: Styles.textStyle12Orange,
      displaySmall: Styles.textStyle24BoldBlack,
      headlineMedium: Styles.textStyle14Grey,
      headlineSmall: Styles.textStyle14Orange,
      titleLarge: Styles.textStyle14Black,
      labelLarge: Styles.textStyle16Black, // Text color for light mode
    ),
    inputDecorationTheme: InputDecorationTheme(
      fillColor: Colors.white,
      enabledBorder: OutlineInputBorder(
        borderSide: const BorderSide(color: Colors.black),
        borderRadius: BorderRadius.circular(10.0),
      ),
      border: OutlineInputBorder(
        borderSide: const BorderSide(
            color: Colors.black), // Border color for light mode
        borderRadius: BorderRadius.circular(10.0),
      ),
    ),
    iconTheme: const IconThemeData(color: Colors.black),
  );

  static ThemeData darkTheme = ThemeData(
    cardColor: Colors.black,
    shadowColor: Colors.white.withOpacity(0.2),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: Colors.black,
      unselectedItemColor: Colors.grey,
      selectedItemColor: kPrimaryKey,
      elevation: 0.0,
      type: BottomNavigationBarType.fixed,
    ),
    scaffoldBackgroundColor: Colors.black,

    primaryColor: kPrimaryKey, // Change primary color as needed
    textTheme: TextTheme(
      bodySmall: Styles.textStyle12WhiteBoldPoppings,
      displayLarge: Styles.textStyle32White,
      displayMedium: Styles.textStyle32Orange,
      bodyLarge: Styles.textStyle12White,
      bodyMedium: Styles.textStyle12BoldGrey,
      titleMedium: const TextStyle(color: Colors.white),
      titleSmall: Styles.textStyle12Orange,
      displaySmall: Styles.textStyle24BoldWhite,
      headlineMedium: Styles.textStyle14Grey,
      headlineSmall: Styles.textStyle14Orange,
      titleLarge: Styles.textStyle14White,
      labelLarge: Styles.textStyle16White,
      // Text color for light mode
    ),
    brightness: Brightness.dark,
    inputDecorationTheme: InputDecorationTheme(
      fillColor: Colors.black,
      enabledBorder: OutlineInputBorder(
        borderSide: const BorderSide(color: Colors.white),
        borderRadius: BorderRadius.circular(10.0),
      ),
      border: OutlineInputBorder(
        borderSide:
            const BorderSide(color: Colors.white), // Border color for dark mode
        borderRadius: BorderRadius.circular(10.0),
      ),
    ),
    iconTheme: const IconThemeData(color: Colors.white),
  );
}
