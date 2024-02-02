import 'package:safar/gen/fonts.gen.dart';
import 'package:flutter/material.dart';
import 'package:safar/core/colors/app_colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

ThemeData lightTheme() {
  return ThemeData(
    fontFamily: FontFamily.lato,
    colorScheme: ColorScheme.light(
      primary: AppColors.primary,
      background: AppColors.background,
      onBackground: AppColors.float,
      surface: AppColors.background,
      onSurface: AppColors.float,
      tertiary: AppColors.textMain,
      surfaceVariant: AppColors.float,
      onTertiary: const Color(0XFFF6F6F6),
      secondaryContainer: AppColors.iconSecondary,
      surfaceTint: AppColors.inputField,
      secondary: AppColors.backgroundModule,
      primaryContainer: AppColors.primary,
      tertiaryContainer: AppColors.signInTextColor,
      onTertiaryContainer: AppColors.backgroundModule,
      onSecondaryContainer: AppColors.marksSmallContainer,
      onSurfaceVariant: Colors.grey.shade300,
      inverseSurface: AppColors.stroke,
      outline: AppColors.float,
      onErrorContainer: AppColors.buttonDisabled,
      inversePrimary: AppColors.stroke,
    ),
    textTheme: TextTheme(
      bodyLarge: TextStyle(fontSize: 15.sp, color: AppColors.textMain),
      bodyMedium: const TextStyle(color: AppColors.textMain),
      displayLarge: TextStyle(
        fontSize: 11.sp,
        color: AppColors.textSecondary,
        fontWeight: FontWeight.w500,
      ),
      displayMedium: const TextStyle(color: AppColors.textMain),
      displaySmall: TextStyle(
        fontSize: 13.sp,
        // color: AppColors.textMain,
        fontWeight: FontWeight.w500,
      ),
      headlineMedium: TextStyle(
        fontSize: 14.sp,
        fontWeight: FontWeight.w700,
        color: AppColors.textMain,
        overflow: TextOverflow.ellipsis,
      ),
      headlineSmall: TextStyle(
        fontSize: 15.sp,
        fontWeight: FontWeight.w500,
        color: AppColors.textMain,
      ),
      titleLarge: TextStyle(
        fontWeight: FontWeight.w700,
        fontSize: 16.sp,
        height: 1.2.h,
        color: const Color(0xFF333333),
      ),
    ),
  );
}

ThemeData darkTheme() {
  return ThemeData(
    fontFamily: FontFamily.lato,
    colorScheme: const ColorScheme.dark(
      primary: AppColors.primaryDark,
      background: AppColors.textMain,
      onBackground: AppColors.onBackground,
      surface: AppColors.surface,
      onSurface: AppColors.textMain,
      tertiary: AppColors.float,
      onTertiary: AppColors.textMain,
      surfaceVariant: AppColors.surface,
      secondaryContainer: AppColors.float,
      surfaceTint: AppColors.textMain,
      secondary: AppColors.textMain,
      primaryContainer: AppColors.float,
      tertiaryContainer: AppColors.float,
      onTertiaryContainer: AppColors.textMain,
      onSecondaryContainer: AppColors.textMain,
      onSurfaceVariant: AppColors.surface,
      inverseSurface: AppColors.textMain,
      outline: AppColors.onBackground,
      onErrorContainer: AppColors.onBackground,
      inversePrimary: AppColors.surface,
    ),
    textTheme: TextTheme(
      bodyLarge: TextStyle(fontSize: 15.sp, color: AppColors.float),
      bodyMedium: const TextStyle(color: AppColors.float),
      displayLarge: TextStyle(
        fontSize: 11.sp,
        color: AppColors.float,
        fontWeight: FontWeight.w500,
      ),
      displayMedium: const TextStyle(color: AppColors.float),
      displaySmall: TextStyle(
        fontSize: 13.sp,
        color: AppColors.float,
        fontWeight: FontWeight.w500,
      ),
      headlineMedium: TextStyle(
        fontSize: 14.sp,
        fontWeight: FontWeight.w700,
        color: AppColors.float,
        overflow: TextOverflow.ellipsis,
      ),
      headlineSmall: TextStyle(
        fontSize: 15.sp,
        fontWeight: FontWeight.w500,
        color: AppColors.float,
      ),
    ),
  );
}
