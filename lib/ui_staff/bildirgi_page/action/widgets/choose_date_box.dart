import 'package:safar/core/colors/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ChooseDate extends StatelessWidget {
  final String text;
  final VoidCallback? onTap;
  final Color textColor;
  final Color backgroundColor;

  const ChooseDate({
    super.key,
    required this.text,
    this.onTap,
    required this.textColor,
    required this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 32.h,
      width: 100.w,
      child: ElevatedButton(
        onPressed: onTap,
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(backgroundColor),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8.r),
              side: BorderSide(color: AppColors.stroke, width: 0.5.w),
            ),
          ),
        ),
        child: Text(
          text,
          style: TextStyle(
            fontSize: 12.sp,
            color: textColor,
          ),
        ),
      ),
    );
  }
}
