import 'package:flutter/material.dart';

// const Color primary = Color(0xFF9CECFB);
// const Color secondary = Color(0xFF65C7F7);
//const Color primary = Color(0xFF004e92);
const Color primary = Color(0xff05457e);
const Color secondary = Color(0xFF000428);
const Color tertiary = Color(0xFF0052D4);
const Color textColor100 = Color(0xFF000000);
const Color textColor50 = Color(0xFF3D3D3D);
const Color textColor10 = Color(0xFF737171);
const Color textColor3D = Color(0xFF3D3D3D);
const Color greyColorCC = Color(0xFFAEAEAE);
const Color greyColorC3 = Color(0xFFC3C3C3);
const Color greyColor8A = Color(0x668A8A8A);
const Color colorRed = Color(0xFFE90C0C);
const Color colorGreen = Color(0xFF00BD35);

const Color customErrorRed = Color(0xFFC5032B);

const Color customSurfaceWhite = Color(0xFFFFFBFA);
const Color customBackgroundWhite = Colors.white;

class GlobalTheme {
  final globalTheme = ThemeData(
    colorScheme: _customColorScheme,
    textTheme: const TextTheme(
      bodyLarge: TextStyle(
        fontSize: 14,
        fontStyle: FontStyle.normal,
        fontWeight: FontWeight.w300,
        color: textColor50,
      )
    ),
    appBarTheme: const AppBarTheme(
      backgroundColor: primary,
      // This will control the "back" icon
      iconTheme: IconThemeData(color: Colors.red),
      // This will control action icon buttons that locates on the right
      actionsIconTheme: IconThemeData(color: textColor100),
      centerTitle: false,
      elevation: 15,
      titleTextStyle: TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.bold,
        fontFamily: 'Allison',
        fontSize: 40,
      ),
    ),
  );
}

const ColorScheme _customColorScheme = ColorScheme(
  primary: primary,
  secondary: secondary,
  surface: Colors.purpleAccent,
  background: customSurfaceWhite,
  error: Colors.black,
  onPrimary: Colors.black,
  onSecondary: Colors.black,
  onSurface: textColor100,
  onBackground: primary,
  onError: Colors.redAccent,
  brightness: Brightness.light,
);