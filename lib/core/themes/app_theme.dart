import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import '../utils/app_colors.dart';

ThemeData getAppTheme() {
  return ThemeData(
    primaryColor: AppColors.primary,
    //scaffoldBackgroundColor
    scaffoldBackgroundColor: AppColors.white,
    //appBar theme
    appBarTheme: const AppBarTheme(
      backgroundColor: AppColors.white,
      centerTitle: true,
    ),
    //text theme
    textTheme: TextTheme(
      displayLarge: GoogleFonts.roboto(
          color: AppColors.black, fontWeight: FontWeight.w700, fontSize: 40.sp),
      displayMedium: GoogleFonts.roboto(
          color: AppColors.black, fontSize: 32.sp, fontWeight: FontWeight.w700),
      displaySmall: GoogleFonts.roboto(
        color: AppColors.black,
        fontWeight: FontWeight.w400,
        fontSize: 16.sp,
      ),
    ),
    //button theme
    elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.primary,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8)))),
    inputDecorationTheme: InputDecorationTheme(
        //enabled border
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: const BorderSide(color: AppColors.primary),
        ),
        //focused border
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        errorBorder:
            OutlineInputBorder(borderRadius: BorderRadius.circular(15)),

        //hint
        hintStyle: TextStyle(
          color: AppColors.primary,
          fontSize: 16.sp,
        ),
        labelStyle: TextStyle(
          color: AppColors.primary,
          fontSize: 16.sp,
        ),
        //fill color
        fillColor: AppColors.white,
        filled: true),
  );
}
