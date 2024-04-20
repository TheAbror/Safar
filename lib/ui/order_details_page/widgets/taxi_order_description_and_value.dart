import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TaxiOrderDescriptionAndValue extends StatelessWidget {
  final String description;
  final String value;
  final int fonsize;

  const TaxiOrderDescriptionAndValue({
    super.key,
    required this.description,
    required this.value,
    this.fonsize = 12,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          description,
          style: TextStyle(
            height: 1.4.h,
            fontSize: fonsize.sp,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          value,
          style: TextStyle(
            height: 1.4.h,
            fontSize: fonsize.sp,
            fontWeight: FontWeight.w400,
          ),
        ),
      ],
    );
  }
}
