import 'package:safar/core/colors/app_colors.dart';
import 'package:safar/core/dialogs/sign_out_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class StaffAppBarTitle extends StatelessWidget {
  const StaffAppBarTitle({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        GestureDetector(
          onTap: () => signOutDialog(context),
          child: Container(
            width: 24.h,
            height: 24.h,
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.tertiary,
              borderRadius: BorderRadius.all(Radius.circular(8.r)),
            ),
          ),
        ),
        SizedBox(width: 8.w),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Darlene Robertson",
              style: TextStyle(
                fontSize: 14.sp,
                color: AppColors.textMain,
                fontWeight: FontWeight.w400,
              ),
            ),
            Text(
              "Teacher",
              style: TextStyle(
                fontSize: 10.sp,
                color: AppColors.textMain,
                fontWeight: FontWeight.w400,
              ),
            ),
          ],
        ),
        SizedBox(
          width: 24.h,
          height: 24.h,
        ),
      ],
    );
  }
}
