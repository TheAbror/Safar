import 'package:safar/core/colors/app_colors.dart';
import 'package:safar/gen/assets.gen.dart';
import 'package:safar/gen/fonts.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AddItemButton extends StatelessWidget {
  final String text;
  final double width;
  final VoidCallback ontap;

  const AddItemButton({
    super.key,
    required this.text,
    required this.width,
    required this.ontap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ontap,
      child: Container(
        height: 44.h,
        width: width,
        decoration: BoxDecoration(
          color: Palette.grey850,
          borderRadius: BorderRadius.circular(40.r),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 2,
              blurRadius: 4,
              offset: Offset(0, 3), // changes position of shadow
            ),
          ],
        ),
        child: Center(
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
              SizedBox(width: 8.w),
              Text(
                text,
                style: TextStyle(
                  color: AppColors.float,
                  fontSize: 15.sp,
                  fontWeight: FontWeight.w600,
                  fontFamily: FontFamily.roboto,
                ),
              ),
              const Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}
