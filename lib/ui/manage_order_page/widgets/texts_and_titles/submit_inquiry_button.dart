import 'package:safar/core/colors/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SubmitOrderButton extends StatelessWidget {
  final bool isEnabled;
  final VoidCallback? onTap;

  const SubmitOrderButton({
    super.key,
    this.isEnabled = false,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: isEnabled ? onTap : null,
      child: Text(
        'Создать',
        style: TextStyle(
          fontSize: 15.sp,
          color: isEnabled ? AppColors.primary : AppColors.buttonDisabled,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}
