import 'package:safar/core/colors/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class InvolvedUserView extends StatelessWidget {
  final String userName;

  const InvolvedUserView({
    super.key,
    required this.userName,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          userName,
          overflow: TextOverflow.ellipsis,
          maxLines: 1,
          textAlign: TextAlign.end,
          style: TextStyle(
            fontSize: 12.sp,
            fontWeight: FontWeight.w600,
          ),
        ),
        SizedBox(width: 5.w),
        Container(
          height: 20.w,
          width: 20.w,
          decoration: BoxDecoration(
            color: AppColors.outline,
            borderRadius: BorderRadius.circular(50.r),
          ),
        ),
      ],
    );
  }
}
