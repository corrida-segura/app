import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TTextTheme {
  
  static final TextTheme lightTheme = TextTheme(

    titleLarge: GoogleFonts.montserrat(
      color: Colors.black87,
      fontWeight: FontWeight.bold,
    ),
    bodyLarge: GoogleFonts.poppins(
      color: Colors.black87,
    ),
    bodyMedium: GoogleFonts.poppins(
      color: Colors.black87, fontSize: 16,
    ),
    labelMedium: GoogleFonts.poppins(
      color: Colors.black87,
    ),
  );
  static final TextTheme darkTheme =  TextTheme(
    titleLarge: GoogleFonts.montserrat(
      color: Colors.white,
      fontWeight: FontWeight.bold,
    ),
    bodyLarge: GoogleFonts.poppins(
      color: Colors.white, fontSize: 24,
    ),
    bodyMedium: GoogleFonts.poppins(
      color: Colors.white, fontSize: 16,
    ),
    labelMedium: GoogleFonts.poppins(
      color: Colors.white,
    ),
  );
}