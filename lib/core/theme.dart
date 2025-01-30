import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'app_colors.dart';

ThemeData appTheme = ThemeData(
  brightness: Brightness.light,
  primaryColor: AppColors.primary,
  scaffoldBackgroundColor: AppColors.background,

  // AppBar Theme
  appBarTheme: AppBarTheme(
    backgroundColor: AppColors.background,
    elevation: 0,
    iconTheme: const IconThemeData(color: Colors.black), // Set to black
    titleTextStyle: TextStyle(
      color: Colors.black, // Set text color to black
      fontSize: 20.sp,
      fontFamily: GoogleFonts.roboto().fontFamily,
      fontWeight: FontWeight.bold,
    ),
  ),

  // Bottom Navigation Bar Theme
  bottomNavigationBarTheme: const BottomNavigationBarThemeData(
    backgroundColor: AppColors.background,
    selectedItemColor: AppColors.primary,
    unselectedItemColor: AppColors.textSecondary,
    showUnselectedLabels: true,
  ),

  // Floating Action Button Theme
  floatingActionButtonTheme: const FloatingActionButtonThemeData(
    backgroundColor: AppColors.primary,
    foregroundColor: AppColors.background,
  ),

  // Text Theme
  textTheme: TextTheme(
    bodyLarge: TextStyle(color: Colors.black, fontSize: 18.sp),
    bodyMedium: TextStyle(color: Colors.black, fontSize: 16.sp),
  ),

  // Icon Theme
  iconTheme: const IconThemeData(color: Colors.black),
);
