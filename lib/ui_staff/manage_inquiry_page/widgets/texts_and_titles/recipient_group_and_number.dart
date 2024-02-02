import 'package:flutter/material.dart';
import 'package:safar/core/colors/app_colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RecipientGroupAndNumber extends StatelessWidget {
  const RecipientGroupAndNumber({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 25.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Recipient group',
            style: TextStyle(
              fontSize: 16.sp,
              fontWeight: FontWeight.bold,
              decoration: TextDecoration.underline,
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 6.w),
            decoration: BoxDecoration(
              color: AppColors.stroke,
              borderRadius: BorderRadius.circular(
                12.r,
              ),
            ),
            child: Text(
              '2',
              style: TextStyle(
                fontSize: 14.sp,
                color: AppColors.textMain,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
