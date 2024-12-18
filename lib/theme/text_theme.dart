import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomTextTheme {
  static final proofMasterTextTheme = TextTheme(
    displayLarge: GoogleFonts.montserrat(
      fontWeight: FontWeight.bold,
      fontSize: 32,
    ),
    displayMedium: GoogleFonts.montserrat(
      fontWeight: FontWeight.bold,
      fontSize: 20,
    ),
    displaySmall: GoogleFonts.montserrat(
      fontWeight: FontWeight.normal,
      fontSize: 16,
    ),
    bodyLarge: GoogleFonts.montserrat(
      fontWeight: FontWeight.w600,
      fontSize: 14,
    ),
    bodyMedium: GoogleFonts.montserrat(
      fontWeight: FontWeight.w400,
      fontSize: 14,
    ),
    labelMedium: GoogleFonts.montserrat(
      fontWeight: FontWeight.w600,
      fontSize: 12,
    ),
    labelSmall: GoogleFonts.montserrat(
      fontWeight: FontWeight.w600,
      fontSize: 10,
    ),
  );
}
