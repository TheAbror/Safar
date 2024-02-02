import 'package:safar/core/colors/app_colors.dart';
import 'package:safar/ui_staff/bildirgi_page/modalPopups/dialog_action.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Future<dynamic> edit_dialog(BuildContext context) {
  return showDialog(
    context: context,
    builder: (context) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            margin: EdgeInsets.symmetric(horizontal: 24.w),
            padding: EdgeInsets.only(bottom: 24.h),
            child: Material(
              borderRadius: BorderRadius.circular(20.r),
              color: AppColors.float,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                      top: 24.h,
                      bottom: 16.h,
                      right: 24.w,
                      left: 24.w,
                    ),
                    child: Text(
                      "Basic dialog title",
                      style: TextStyle(
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      bottom: 24.h,
                      right: 24.w,
                      left: 24.w,
                    ),
                    child: Text(
                      "A dialog is a type of modal window that appears in front of app content to provide critical information, or prompt for a decision to be made.",
                      style: TextStyle(
                        height: 1.2.h,
                        fontSize: 14.sp,
                      ),
                    ),
                  ),
                  Row(
                    children: [
                      const Spacer(),
                      DialogAction(
                        width: 136.w,
                        text: 'Cancel',
                        textColor: AppColors.primary,
                        onTap: () => Navigator.pop(context),
                        backgroundColor: AppColors.buttonDisabled,
                      ),
                      SizedBox(width: 8.w),
                      DialogAction(
                        text: 'Yes',
                        width: 136.w,
                        textColor: AppColors.float,
                        onTap: () => Navigator.pop(context),
                        backgroundColor: AppColors.primary,
                      ),
                      const Spacer(),
                    ],
                  ),
                  SizedBox(height: 24.h),
                ],
              ),
            ),
          ),
        ],
      );
    },
  );
}
