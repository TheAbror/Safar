import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:safar/core/colors/app_colors.dart';
import 'package:safar/ui/order_details_page/modalPopups/dialog_action.dart';

Future<dynamic> order_edit_or_delete_dialog(
  BuildContext context, {
  String textMain = 'Выбрать действие',
  String textSecondary = '',
  String firstButton = 'Удалить',
  String secondButton = 'Изменить',
}) {
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
                      textMain,
                      style: TextStyle(
                        fontSize: 17.sp,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                  textSecondary.isNotEmpty
                      ? Padding(
                          padding: EdgeInsets.only(bottom: 24.h, right: 24.w, left: 24.w),
                          child: Text(
                            textSecondary,
                            style: TextStyle(
                              height: 1.2.h,
                              fontSize: 14.sp,
                            ),
                          ),
                        )
                      : SizedBox(),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 16.w),
                    child: Column(
                      children: [
                        DialogAction(
                          width: double.infinity,
                          text: firstButton,
                          textColor: AppColors.float,
                          onTap: () => Navigator.pop(context, true),
                          backgroundColor: AppColors.error,
                        ),
                        SizedBox(height: 8.w),
                        DialogAction(
                          width: double.infinity,
                          text: secondButton,
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
