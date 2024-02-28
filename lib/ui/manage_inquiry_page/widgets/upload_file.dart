import 'package:safar/core/colors/app_colors.dart';
import 'package:safar/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FileUploadButton extends StatelessWidget {
  const FileUploadButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 157.h,
      width: double.infinity,
      margin: EdgeInsets.only(right: 8.w, left: 8.w, bottom: 2.h),
      padding: EdgeInsets.all(10.w),
      decoration: BoxDecoration(
        color: AppColors.float,
        borderRadius: BorderRadius.circular(16.r),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 4.h),
          Text(
            'Upload files',
            style: TextStyle(
              fontSize: 14.sp,
              fontWeight: FontWeight.w700,
            ),
          ),
          SizedBox(height: 8.h),
          Container(
            height: 100.h,
            width: double.infinity,
            decoration: BoxDecoration(
              color: AppColors.inputField,
              borderRadius: BorderRadius.circular(12.r),
              border: Border.all(color: AppColors.stroke, width: 0.5.w),
            ),
            child: Column(
              children: [
                const Spacer(),
                Assets.icons.staffIcons.iconPlus.svg(
                  height: 24.w,
                  width: 24.w,
                ),
                SizedBox(height: 12.h),
                Text(
                  'File upload',
                  style: TextStyle(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w400,
                    color: AppColors.textSecondary,
                  ),
                ),
                const Spacer(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
