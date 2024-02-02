import 'package:flutter/material.dart';
import 'package:safar/core/constants/app_configs.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

RoundedRectangleBorder BottomSheetRadius() {
  return RoundedRectangleBorder(
    borderRadius: BorderRadius.only(
      topLeft: Radius.circular(corex * 5.r),
      topRight: Radius.circular(corex * 5.r),
    ),
  );
}
