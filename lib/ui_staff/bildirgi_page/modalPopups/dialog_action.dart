import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DialogAction extends StatelessWidget {
  final String text;
  final double width;
  final Color textColor;
  final Color backgroundColor;
  final VoidCallback? onTap;

  const DialogAction({
    super.key,
    required this.text,
    required this.width,
    required this.textColor,
    required this.backgroundColor,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: width,
        height: 48.h,
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(40.r),
        ),
        child: Center(
          child: Text(
            text,
            style: TextStyle(
              fontSize: 15.sp,
              color: textColor,
            ),
          ),
        ),
      ),
    );
  }
}
