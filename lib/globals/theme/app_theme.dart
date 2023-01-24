import 'package:flutter/material.dart';

final ThemeData tsCustomTheme = _tsCustomTheme();

//define Base theme for app: LIGHT
  ThemeData _tsCustomTheme() {
    final ThemeData base = ThemeData.light();

    return base.copyWith(
      colorScheme: base.colorScheme.copyWith(
        primary: const Color.fromARGB(255, 255, 153, 51),
        onPrimary: Colors.white,
        secondary: const Color.fromARGB(255, 251, 157, 64),
        onSecondary: Colors.white,
        error: Colors.red,
        background: const Color.fromARGB(255, 228, 243, 228),
        onBackground: Colors.black,
      ),
      textTheme: _tsCustomTextTheme(base.textTheme),
      // below text theme add this

      // Define styles for elevated button
      elevatedButtonTheme: _elevatedButtonTheme(base.elevatedButtonTheme),

      // theme for text input
        inputDecorationTheme: const InputDecorationTheme(
          border: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.black)),
          focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.deepOrangeAccent))),
    );
  }

  TextTheme _tsCustomTextTheme(TextTheme base) => base.copyWith(
//  appbars title
    headline1: base.headline1!.copyWith(
        fontFamily: "Proxima Nova Rg Regular",
        fontSize: 30,
        fontWeight: FontWeight.w500,
        color: Colors.white),
// widgets heading/title
    headline2: base.headline2!.copyWith(
      fontFamily: "Proxima Nova Rg Regular",
      fontSize: 26,
      fontWeight: FontWeight.w400,
      color: Colors.black,
    ),
// sub-widgets heading/title
    headline3: base.headline3!.copyWith(
      fontFamily: "Proxima Nova Rg Regular",
      fontSize: 24,
      fontWeight: FontWeight.w400,
      color: Colors.black,
    ),
// widgets contents/paragraph
    bodyText1: base.bodyText1!.copyWith(
        fontFamily: "Proxima Nova Rg Regular",
        fontSize: 20,
        fontWeight: FontWeight.w300,
        color: Colors.black),
// sub-widgets contents/paragraph
    bodyText2: base.bodyText2!.copyWith(
        fontFamily: "Proxima Nova Rg Regular",
        fontSize: 18,
        fontWeight: FontWeight.w300,
        color: Colors.black),

// labels
 /*
     labelStyle: TextStyle(color: Colors.black),

    labelSmall: base.labelSmall!.copyWith(
        fontFamily: "Proxima Nova Rg Regular",
        fontSize: 18,
        fontWeight: FontWeight.w300,
        color: Colors.black),
    labelLarge: base.labelLarge!.copyWith(
        fontFamily: "Proxima Nova Rg Regular",
        fontSize: 18,
        fontWeight: FontWeight.w300,
        color: Colors.black),
*/
  );

  InputDecorationTheme _inputDecorationTheme(InputDecorationTheme base) =>
      const InputDecorationTheme(
// Label color for the inputs
        labelStyle: TextStyle(color: Colors.black),
        floatingLabelStyle: TextStyle(color: Colors.black),
// border of input form while focused on
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            width: 1.0,
            color: Colors.black,
            style: BorderStyle.solid,
          ),
        ),
      );

  ElevatedButtonThemeData _elevatedButtonTheme(ElevatedButtonThemeData base) =>
      ElevatedButtonThemeData(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all<Color>(
            const Color.fromARGB(255, 251, 157, 64),
          ),
          foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
        ),
      );
