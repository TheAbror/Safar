import 'package:safar/core/colors/app_colors.dart';
import 'package:safar/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FilterCard extends StatelessWidget {
  final String text;
  final VoidCallback? onTap;

  const FilterCard({
    super.key,
    required this.text,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          height: 33.w,
          margin: EdgeInsets.only(bottom: 12.h, right: 8.w),
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.inverseSurface,
            border: Border.all(color: AppColors.outline, width: 0.5.w),
            borderRadius: BorderRadius.circular(8.r),
          ),
          child: Row(
            children: [
              Text(
                text,
                style: TextStyle(fontSize: 11.sp),
              ),
              SizedBox(width: 12.w),
              GestureDetector(
                onTap: onTap,
                behavior: HitTestBehavior.opaque,
                child: Assets.icons.staffIcons.closeCircle.svg(
                  height: 16.h,
                  width: 16.h,
                  colorFilter: ColorFilter.mode(
                    Theme.of(context).colorScheme.tertiary,
                    BlendMode.srcIn,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
