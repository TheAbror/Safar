import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:safar/core/colors/app_colors.dart';

class CommentsForDrier extends StatelessWidget {
  final Function(String)? onChanged;
  final TextEditingController commentsController;

  const CommentsForDrier({
    super.key,
    required this.onChanged,
    required this.commentsController,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 130.h,
      child: TextFormField(
          expands: true,
          minLines: null,
          maxLines: null,
          textAlignVertical: TextAlignVertical.top,
          onChanged: onChanged,
          controller: commentsController,
          textInputAction: TextInputAction.next,
          decoration: InputDecoration(
            filled: true,
            contentPadding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 12.w),
            border: InputBorder.none, // Remove border color
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
            hintText: 'Комментарии для водителя',
            fillColor: Theme.of(context).colorScheme.surfaceTint,
            hintStyle: const TextStyle(color: AppColors.textSecondary),
          )),
    );
  }
}
