import 'package:safar/core/colors/app_colors.dart';
import 'package:safar/ui/manage_inquiry_page/bloc/manage_order_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NewInquiryTitle extends StatelessWidget {
  final TextEditingController titleController;

  const NewInquiryTitle({
    super.key,
    required this.titleController,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged: (value) {
        context.read<ManageOrderBloc>().updateData(title: value);
        print(value);
      },
      validator: (username) {
        if (username == null || username.isEmpty) {
          return 'Please enter title';
        }
        return null;
      },
      controller: titleController,
      textInputAction: TextInputAction.next,
      decoration: _Decoration(context),
    );
  }

  InputDecoration _Decoration(BuildContext context) {
    return InputDecoration(
      filled: true,
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
      hintText: 'Title',
      fillColor: Theme.of(context).colorScheme.surfaceTint,
      hintStyle: const TextStyle(color: AppColors.textSecondary),
    );
  }
}
