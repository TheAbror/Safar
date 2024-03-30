import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:safar/core/colors/app_colors.dart';

class ManageTaxiFieldsHeadline extends StatelessWidget {
  final String text;

  const ManageTaxiFieldsHeadline({
    super.key,
    this.text = 'Необязательно',
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 8.h),
        Text(
          text,
          style: TextStyle(
            fontSize: 14.sp,
            fontWeight: FontWeight.w400,
            color: AppColors.textSecondary,
          ),
        ),
        SizedBox(height: 8.h),
      ],
    );
  }
}
