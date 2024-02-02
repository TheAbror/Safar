import 'package:safar/core/colors/app_colors.dart';
import 'package:safar/ui_staff/bildirgi_page/modalPopups/dialog_action.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// ignore: non_constant_identifier_names
Future<dynamic> delete_dialog(BuildContext context,
    {String text = 'This inquiry will be deleted immediately. \n You can`t undo this action'}) {
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
              color: Theme.of(context).colorScheme.onBackground,
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
                      'Are you sure you want to delete?',
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
                      text,
                      style: TextStyle(
                        height: 1.2.h,
                        fontSize: 14.sp,
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 16.w),
                    child: Column(
                      children: [
                        DialogAction(
                          width: double.infinity,
                          text: 'Delete',
                          textColor: AppColors.float,
                          onTap: () => Navigator.pop(context, true),
                          backgroundColor: AppColors.error,
                        ),
                        SizedBox(height: 8.w),
                        DialogAction(
                          width: double.infinity,
                          text: 'Cancel',
                          textColor: AppColors.primary,
                          onTap: () => Navigator.pop(context, false),
                          backgroundColor: AppColors.buttonDisabled,
                        ),
                      ],
                    ),
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
