import 'package:flutter/material.dart';
import 'package:safar/gen/fonts.gen.dart';
import 'package:safar/core/colors/app_colors.dart';
import 'package:safar/core/constants/app_configs.dart';
import 'package:safar/core/dialogs/sign_out_dialog.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class StaffAppBarTitle extends StatelessWidget {
  final String? fullName;
  final String? shortName;
  final String? role;

  const StaffAppBarTitle({
    super.key,
    this.fullName,
    this.shortName,
    this.role,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        GestureDetector(
          onTap: () => signOutDialog(context),
          child: Container(
            decoration: BoxDecoration(
              color: AppColors.float,
              borderRadius: BorderRadius.all(Radius.circular(corex * 3.r)),
            ),
            child: Container(
              margin: EdgeInsets.all(corex / 2.h),
              padding: EdgeInsets.only(bottom: corex / 2.h),
              width: 32.h,
              height: 32.h,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: Palette.grey75,
                borderRadius: BorderRadius.all(Radius.circular(corex * 2.r)),
              ),
              child: Text(
                shortName ?? '',
                style: TextStyle(
                  fontSize: 14.sp,
                  color: AppColors.textMain,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ),
        SizedBox(width: 8.w),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              fullName ?? '',
              style: TextStyle(
                fontSize: 14.sp,
                color: Theme.of(context).colorScheme.tertiary,
                fontFamily: FontFamily.roboto,
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(height: 0.h),
            Text(
              role?.replaceAll('_', ' ') ?? '',
              style: TextStyle(
                fontSize: 10.sp,
                color: AppColors.iconSecondary,
                fontFamily: FontFamily.roboto,
                fontWeight: FontWeight.w400,
              ),
            ),
          ],
        ),
        const Spacer(),
        SizedBox(width: 5.w)
      ],
    );
  }
}
