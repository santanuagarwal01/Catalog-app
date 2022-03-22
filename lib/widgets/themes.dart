import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyTheme {
  ThemeData get lightTheme => ThemeData(
        primarySwatch: Colors.deepPurple,
        fontFamily: GoogleFonts.lato().fontFamily,
        appBarTheme: AppBarTheme(
          color: Colors.white,
          elevation: 0.0,
          titleTextStyle: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
          iconTheme: IconThemeData(color: Colors.black),
        ),
      );
  ThemeData get darkTheme => ThemeData(
        brightness: Brightness.dark,
      );
}
