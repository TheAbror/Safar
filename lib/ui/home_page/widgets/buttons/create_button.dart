import 'package:safar/core/colors/app_colors.dart';
import 'package:safar/core/constants/app_configs.dart';
import 'package:safar/gen/assets.gen.dart';
import 'package:safar/gen/fonts.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CreateButton extends StatelessWidget {
  final VoidCallback onPressed;

  const CreateButton({
    super.key,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 44.h,
      width: 101.w,
      child: FloatingActionButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(corex * 1000.r)),
        ),
        onPressed: onPressed,
        backgroundColor: Palette.grey850,
        child: Row(
          children: [
            const Spacer(),
            Assets.icons.staffIcons.createIcon.svg(
              colorFilter: const ColorFilter.mode(
                AppColors.float,
                BlendMode.srcIn,
              ),
              height: 24.w,
              width: 24.w,
            ),
            SizedBox(width: 4.w),
            Text(
              ' Create',
              style: TextStyle(
                color: AppColors.float,
                fontSize: 15.sp,
                letterSpacing: 0.1,
                fontWeight: FontWeight.w500,
                fontFamily: FontFamily.roboto,
              ),
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}
