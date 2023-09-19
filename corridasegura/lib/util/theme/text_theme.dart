import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TTextTheme {
  
  static final TextTheme lightTheme = TextTheme(

     displaySmall: GoogleFonts.montserrat(
      color: Colors.black87,
      fontWeight: FontWeight.bold,
      fontSize: 40,
    ),

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
      color: Colors.black87, fontSize: 14
    ),
  );
  static final TextTheme darkTheme =  TextTheme(

    displaySmall: GoogleFonts.montserrat(
      color: Colors.white,
      fontWeight: FontWeight.bold,
      fontSize: 40,
    ),

    titleLarge: GoogleFonts.montserrat(
      color: Colors.white,
      fontWeight: FontWeight.bold,
    ),
    bodyLarge: GoogleFonts.poppins(
      color: Colors.white,
    ),
    bodyMedium: GoogleFonts.poppins(
      color: Colors.white, fontSize: 16,
    ),
    labelMedium: GoogleFonts.poppins(
      color: Colors.white, fontSize: 14
    ),
  );
}