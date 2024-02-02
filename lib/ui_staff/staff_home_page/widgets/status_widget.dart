import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class StatusWidget extends StatelessWidget {
  final Color backgroundColor;
  final Color textColor;
  final double radius;
  final String status;

  const StatusWidget({
    super.key,
    required this.backgroundColor,
    required this.textColor,
    required this.status,
    required this.radius,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(radius),
      ),
      child: Center(
        child: Text(
          status,
          style: TextStyle(
            fontSize: 11.sp,
            overflow: TextOverflow.ellipsis,
            fontWeight: FontWeight.w500,
            color: textColor,
          ),
        ),
      ),
    );
  }
}
