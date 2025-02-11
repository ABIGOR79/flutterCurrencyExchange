import 'package:flutter/material.dart';

final themeLight = ThemeData(
  scaffoldBackgroundColor: const Color.fromARGB(255, 233, 226, 226),
  primarySwatch: Colors.yellow,
  dividerColor: Colors.white24,
  appBarTheme: const AppBarTheme(
    iconTheme: IconThemeData(color: Colors.white),
    elevation: 0,
    backgroundColor: Color.fromARGB(255, 31, 31, 31),
    titleTextStyle: TextStyle(
      color: Colors.white,
      fontSize: 20,
      fontWeight: FontWeight.w700,
    ),
  ),
  listTileTheme: const ListTileThemeData(iconColor: Colors.white),
  textTheme: TextTheme(
    bodyMedium: const TextStyle(
      color: Colors.white,
      fontWeight: FontWeight.w500,
      fontSize: 20,
    ),
    labelSmall: TextStyle(
      color: Colors.white.withOpacity(0.6),
      fontWeight: FontWeight.w700,
      fontSize: 14,
    ),
    headlineMedium: const TextStyle(
      color: Colors.white,
      fontWeight: FontWeight.w500,
      fontSize: 24,
    ),
  ),
);

// final themeDark = ThemeData(
//   scaffoldBackgroundColor: const Color.fromARGB(255, 31, 31, 31),
//   primarySwatch: Colors.lightBlue,
//   dividerColor: Colors.white24,
//   appBarTheme: const AppBarTheme(
//     iconTheme: IconThemeData(color: Colors.blue),
//     elevation: 0,
//     backgroundColor: Color.fromARGB(255, 31, 31, 31),
//     titleTextStyle: TextStyle(
//       color: Colors.white,
//       fontSize: 20,
//       fontWeight: FontWeight.w700,
//     ),
//   ),
//   listTileTheme: const ListTileThemeData(iconColor: Colors.white),
//   textTheme: TextTheme(
//     bodyMedium: const TextStyle(
//       color: Colors.white,
//       fontWeight: FontWeight.w500,
//       fontSize: 20,
//     ),
//     labelSmall: TextStyle(
//       color: Colors.white.withOpacity(0.6),
//       fontWeight: FontWeight.w700,
//       fontSize: 14,
//     ),
//     headlineMedium: const TextStyle(
//       color: Colors.white,
//       fontWeight: FontWeight.w500,
//       fontSize: 24,
//     ),
//   ),
// );
