import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

final ThemeData theme = ThemeData(
  primaryColor: const Color(0xFFC4A77D), // Color principal
  secondaryHeaderColor: const Color(0xFF454372), // Segundo color principal
  indicatorColor: const Color(0xFF7BE7ED),
  scaffoldBackgroundColor: const Color(0xFF2F2963),
  textTheme: TextTheme(
      displayLarge: GoogleFonts.urbanist(
        fontSize: 36,
        letterSpacing: 2,
        color: const Color(0xFF7BE7ED),
      ),
      displayMedium: GoogleFonts.urbanist(
        fontSize: 24,
        letterSpacing: 2,
        color: const Color(0xFF7BE7ED),
      ),
      displaySmall: GoogleFonts.urbanist(
        fontSize: 22,
        letterSpacing: 2,
        color: const Color(0xFF7BE7ED),
      ),
      headlineMedium: GoogleFonts.urbanist(
        fontSize: 20,
        letterSpacing: 2,
        color: const Color(0xFF7BE7ED),
      ),
      bodyLarge: GoogleFonts.urbanist(
        fontSize: 18,
        letterSpacing: 2,
        color: const Color(0xFF7BE7ED),
      ),
      bodyMedium: GoogleFonts.urbanist(
        fontSize: 16,
        letterSpacing: 2,
        color: const Color(0xFF7BE7ED),
      )),
  appBarTheme: AppBarTheme(
      color: const Color(0xFF7BE7ED),
      iconTheme: const IconThemeData(
        color: Color(0xFF7BE7ED),
      ),
      toolbarTextStyle: GoogleFonts.urbanistTextTheme()
          .copyWith(
              titleLarge: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w600,
            color: Color(0xFF7BE7ED),
          ))
          .bodyMedium,
      titleTextStyle: GoogleFonts.urbanistTextTheme()
          .copyWith(
              titleLarge: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w600,
            color: Color(0xFF7BE7ED),
          ))
          .titleLarge),

  dropdownMenuTheme: DropdownMenuThemeData(
    menuStyle: const MenuStyle(
        surfaceTintColor: MaterialStatePropertyAll(Color(0xFF454372)),
        backgroundColor: MaterialStatePropertyAll(Color(0xFF454372))),
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: const Color(0xFF454372),
      labelStyle: const TextStyle(fontSize: 18, color: Color(0xFFC4A77D)),
      errorStyle: const TextStyle(
        fontSize: 10,
        color: Colors.red,
      ),
      hintStyle: const TextStyle(
          fontSize: 16, color: Color(0xFFC4A77D), fontWeight: FontWeight.w200),
      contentPadding: const EdgeInsets.symmetric(
        vertical: 14.0,
        horizontal: 20.0,
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderSide: const BorderSide(width: 0, color: Colors.red),
        borderRadius: BorderRadius.circular(10),
      ),
      errorBorder: OutlineInputBorder(
        borderSide: const BorderSide(width: 0, color: Colors.red),
        borderRadius: BorderRadius.circular(10),
      ),
      enabledBorder: OutlineInputBorder(
        borderSide: const BorderSide(width: 0, color: Colors.transparent),
        borderRadius: BorderRadius.circular(10),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: const BorderSide(
            width: 0, color: Color.fromARGB(255, 174, 173, 174)),
        borderRadius: BorderRadius.circular(10),
      ),
    ),
  ),

  inputDecorationTheme: InputDecorationTheme(
    filled: true,
    fillColor: const Color(0xFF454372),
    labelStyle: const TextStyle(fontSize: 16, color: Color(0xFFC4A77D)),
    errorStyle: const TextStyle(
      fontSize: 10,
      color: Colors.red,
    ),
    hintStyle: const TextStyle(
        fontSize: 16, color: Color(0xFFC4A77D), fontWeight: FontWeight.w200),
    contentPadding: const EdgeInsets.symmetric(
      vertical: 16.0,
      horizontal: 20.0,
    ),
    focusedErrorBorder: OutlineInputBorder(
      borderSide: const BorderSide(width: 0, color: Colors.red),
      borderRadius: BorderRadius.circular(10),
    ),
    errorBorder: OutlineInputBorder(
      borderSide: const BorderSide(width: 0, color: Colors.red),
      borderRadius: BorderRadius.circular(10),
    ),
    enabledBorder: OutlineInputBorder(
      borderSide: const BorderSide(width: 0, color: Colors.transparent),
      borderRadius: BorderRadius.circular(10),
    ),
    focusedBorder: OutlineInputBorder(
      borderSide:
          const BorderSide(width: 0, color: Color.fromARGB(255, 174, 173, 174)),
      borderRadius: BorderRadius.circular(10),
    ),
  ),

  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ButtonStyle(
      textStyle: MaterialStateProperty.all(const TextStyle(
          fontSize: 16, color: Colors.white, fontWeight: FontWeight.bold)),
      backgroundColor: MaterialStateProperty.all(Colors.blue.shade800),
      foregroundColor: MaterialStateProperty.all(Colors.white),
      shape: MaterialStateProperty.all(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    ),
  ),
);
