import 'package:flutter/material.dart';
import 'package:safar/core/colors/app_colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

InputDecoration RecepientDecoration(BuildContext context) {
  return InputDecoration(
    filled: true,
    border: InputBorder.none, // Remove border color
    enabledBorder: OutlineInputBorder(
      borderSide: BorderSide(color: AppColors.stroke, width: 0.5.w),
      borderRadius: BorderRadius.circular(12),
    ),
    focusedBorder: OutlineInputBorder(
      borderSide: BorderSide(color: AppColors.primary, width: 0.5.w),
      borderRadius: BorderRadius.circular(12),
    ),
    errorBorder: OutlineInputBorder(
      borderSide: BorderSide(color: AppColors.stroke, width: 0.5.w),
      borderRadius: BorderRadius.circular(12),
    ),
    focusedErrorBorder: OutlineInputBorder(
      borderSide: BorderSide(color: AppColors.stroke, width: 0.5.w),
      borderRadius: BorderRadius.circular(12),
    ),

    hintText: 'Select recipient',
    fillColor: Theme.of(context).colorScheme.surfaceTint,
    hintStyle: const TextStyle(color: AppColors.textSecondary),
    suffixIcon: const SizedBox(
      height: 24,
      width: 24,
      child: Icon(Icons.arrow_drop_down_outlined),
    ),
  );
}
