import 'package:bot_toast/bot_toast.dart';
import 'package:safar/core/colors/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void showMessage(String text, {bool isError = false}) {
  BotToast.showAttachedWidget(
    attachedBuilder: (_) {
      return Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Card(
            color: isError ? Colors.red : Colors.green,
            child: Container(
              padding: EdgeInsets.only(
                top: 8.h,
                bottom: 8.h,
                left: 16.w,
                right: 11.w,
              ),
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(
                  Radius.circular(6),
                ),
              ),
              constraints: BoxConstraints(minHeight: 64.h),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Center(
                    child: Icon(
                      isError ? Icons.error : Icons.done,
                      size: 24.w,
                      color: AppColors.float,
                    ),
                  ),
                  SizedBox(width: 10.w),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          text,
                          maxLines: 2,
                          style: const TextStyle(
                            color: AppColors.float,
                          ),
                        ),
                      ],
                    ),
                  ),
                  GestureDetector(
                    behavior: HitTestBehavior.opaque,
                    child: Container(
                      padding: EdgeInsets.all(5.w),
                      child: Icon(
                        Icons.close,
                        size: 24.w,
                        color: AppColors.float,
                      ),
                    ),
                    onTap: () {
                      BotToast.cleanAll();
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      );
    },
    duration: const Duration(seconds: 5),
    target: const Offset(600, 600),
  );
}
