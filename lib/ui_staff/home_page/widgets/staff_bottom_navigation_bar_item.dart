import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class StaffBottomNavigationBarItem extends StatelessWidget {
  final String text;
  final String svg;
  final VoidCallback onTap;
  final Color selectedColor;

  const StaffBottomNavigationBarItem({
    super.key,
    required this.text,
    required this.svg,
    required this.onTap,
    required this.selectedColor,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: SizedBox(
        height: 64.h,
        child: Column(
          children: [
            SvgPicture.asset(
              svg,
              colorFilter: ColorFilter.mode(
                selectedColor,
                BlendMode.srcIn,
              ),
            ),
            Text(
              text,
              style: TextStyle(
                fontSize: 10.sp,
                color: selectedColor,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
