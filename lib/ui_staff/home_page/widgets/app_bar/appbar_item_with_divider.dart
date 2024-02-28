import 'package:safar/core/colors/app_colors.dart';
import 'package:safar/core/constants/app_configs.dart';
import 'package:safar/gen/fonts.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppBarItemWithDivider extends StatelessWidget {
  final String text;

  const AppBarItemWithDivider({
    super.key,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: corex.h),
      child: Container(
        height: 20.h,
        width: double.infinity,
        decoration: const BoxDecoration(
          border: Border(
            right: BorderSide(
              color: Palette.grey150,
              width: 1,
              style: BorderStyle.solid,
            ),
          ),
        ),
        child: Center(
          child: Text(
            text,
            style: TextStyle(
              fontSize: 13.sp,
              fontFamily: FontFamily.roboto,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
