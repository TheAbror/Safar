import 'package:safar/core/colors/app_colors.dart';
import 'package:safar/core/constants/app_configs.dart';
import 'package:safar/gen/assets.gen.dart';
import 'package:safar/gen/fonts.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SearchInput extends StatelessWidget {
  /// Constructor
  final TextEditingController controller;
  final dynamic validator;
  final String? labelText;
  final String? hintText;
  final bool isPassword;
  final bool? isEnabled;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final double width;
  final Color fillColor;
  final Function(String)? onChanged;

  const SearchInput({
    super.key,
    required this.controller,
    required this.width,
    required this.fillColor,
    this.validator,
    this.labelText,
    this.hintText,
    this.isPassword = false,
    this.isEnabled,
    this.prefixIcon,
    this.suffixIcon,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40.h,
      width: width,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(40.r)),
      child: TextFormField(
        obscureText: isPassword,
        enabled: isEnabled,
        validator: validator,
        controller: controller,
        onChanged: onChanged,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.only(top: 2.h),
          filled: true,
          fillColor: fillColor,
          suffixIcon: suffixIcon,
          prefixIcon: Padding(
            padding: EdgeInsets.only(
              right: 8.w,
              bottom: 10.h,
              top: 10.h,
              left: 12.w,
            ),
            child: Assets.icons.staffIcons.searchNormal.svg(
              height: 20.h,
              width: 20.h,
            ),
          ),
          hintText: hintText,
          hintStyle: TextStyle(
            fontSize: 16.sp,
            color: AppColors.iconSecondary,
            fontFamily: FontFamily.lato,
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: AppColors.stroke, width: 0.33.w),
            borderRadius: BorderRadius.circular(corex * 10),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: AppColors.primary, width: 0.33.w),
            borderRadius: BorderRadius.circular(corex * 10),
          ),
          errorBorder: OutlineInputBorder(
            borderSide: BorderSide(color: AppColors.inputField, width: 0.33.w),
            borderRadius: BorderRadius.circular(corex * 10),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderSide: BorderSide(color: AppColors.inputField, width: 0.33.w),
            borderRadius: BorderRadius.circular(corex * 10),
          ),
        ),
      ),
    );
  }
}
