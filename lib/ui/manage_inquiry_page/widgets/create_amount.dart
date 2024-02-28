import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:safar/core/colors/app_colors.dart';

class CounterAmount extends StatelessWidget {
  final String text;
  final double width;
  final double textSize;
  final VoidCallback? onTap;

  const CounterAmount({
    super.key,
    required this.text,
    required this.width,
    this.textSize = 24,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 56.w,
        width: width,
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.surfaceTint,
          borderRadius: BorderRadius.circular(60.r),
          border: Border.all(color: AppColors.stroke, width: 0.5.w),
        ),
        child: Center(
          child: Text(
            text,
            style: TextStyle(
              fontSize: textSize,
              fontWeight: FontWeight.w200,
            ),
          ),
        ),
      ),
    );
  }
}
