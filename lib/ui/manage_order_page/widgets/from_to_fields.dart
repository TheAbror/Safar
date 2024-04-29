import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:safar/core/colors/app_colors.dart';

class FromToFields extends StatefulWidget {
  final TextEditingController controller;
  final Function()? onTap;
  final String hintText;
  final bool? suffixIcon;

  const FromToFields({
    super.key,
    required this.controller,
    required this.onTap,
    required this.hintText,
    this.suffixIcon = false,
  });

  @override
  State<FromToFields> createState() => _FromToFieldsState();
}

class _FromToFieldsState extends State<FromToFields> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50.h,
      child: TextFormField(
        readOnly: true,
        onTap: widget.onTap,
        controller: widget.controller,
        textInputAction: TextInputAction.next,
        decoration: ToFromDecoration(
          context,
          widget.hintText,
          widget.suffixIcon ?? false,
        ),
      ),
    );
  }
}

InputDecoration ToFromDecoration(
  BuildContext context,
  String hintText,
  bool suffixIcon,
) {
  return InputDecoration(
    filled: true,
    contentPadding: EdgeInsets.symmetric(vertical: 1.h, horizontal: 12.w),
    border: InputBorder.none,
    enabledBorder: OutlineInputBorder(
      borderSide: BorderSide(color: AppColors.stroke, width: 0.5.w),
      borderRadius: BorderRadius.circular(12),
    ),
    focusedBorder: OutlineInputBorder(
      borderSide: BorderSide(color: AppColors.primary, width: 0.5.w),
      borderRadius: BorderRadius.circular(12),
    ),
    errorBorder: OutlineInputBorder(
      borderSide: BorderSide(color: AppColors.stroke, width: 0.5.w),
      borderRadius: BorderRadius.circular(12),
    ),
    focusedErrorBorder: OutlineInputBorder(
      borderSide: BorderSide(color: AppColors.stroke, width: 0.5.w),
      borderRadius: BorderRadius.circular(12),
    ),
    hintText: hintText,
    fillColor: Theme.of(context).colorScheme.surfaceTint,
    hintStyle: const TextStyle(color: AppColors.textSecondary),
    suffixIcon: suffixIcon
        ? Container(
            alignment: Alignment.topRight,
            padding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 12.w),
            height: 24.h,
            width: 24.h,
            child: const Icon(Icons.arrow_drop_down_outlined),
          )
        : SizedBox(),
  );
}
