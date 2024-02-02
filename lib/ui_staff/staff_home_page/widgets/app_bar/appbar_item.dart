import 'package:flutter/material.dart';
import 'package:safar/gen/fonts.gen.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppBarItem extends StatelessWidget {
  final String text;

  const AppBarItem({
    super.key,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 28.h,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(10.r)),
      child: Center(
        child: Text(
          text,
          style: TextStyle(
            fontSize: 13.sp,
            fontFamily: FontFamily.roboto,
            fontWeight: FontWeight.w600,
            color: Theme.of(context).colorScheme.tertiary,
          ),
        ),
      ),
    );
  }
}
