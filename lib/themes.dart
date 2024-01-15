import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:weather_app/consts/colors.dart';

class CustomThemes {
  static final lighTheme = ThemeData(
    textTheme: GoogleFonts.poppinsTextTheme(
      Typography.material2021().black,
    ),
    scaffoldBackgroundColor: Colors.white,
    primaryColor: Vx.gray900,
    iconTheme: const IconThemeData(
      color: Vx.gray600,
    ),
    cardColor: Vx.gray200,
  );

  static final darkTheme = ThemeData(
    textTheme: GoogleFonts.poppinsTextTheme(
      Typography.material2021().black,
    ),
    scaffoldBackgroundColor: bgColor,
    primaryColor: Colors.white,
    iconTheme: const IconThemeData(
      color: Colors.white,
    ),
    cardColor: cardColor,
  );
}
