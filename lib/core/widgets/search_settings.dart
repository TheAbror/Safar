import 'package:safar/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SearchSettings extends StatelessWidget {
  final VoidCallback? onTap;
  final Color color;

  const SearchSettings({
    super.key,
    this.onTap,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.only(
          right: 12.r,
          bottom: 10.h,
          top: 10.h,
        ),
        child: Assets.icons.staffIcons.settingIcon.svg(
          height: 24.w,
          width: 24.w,
          colorFilter: ColorFilter.mode(
            color,
            BlendMode.srcIn,
          ),
        ),
      ),
    );
  }
}
