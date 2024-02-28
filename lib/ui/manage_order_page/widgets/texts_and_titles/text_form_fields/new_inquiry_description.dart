import 'package:safar/core/colors/app_colors.dart';
import 'package:safar/ui/manage_order_page/bloc/manage_order_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NewInquiryDescription extends StatelessWidget {
  final TextEditingController decriptionController;

  const NewInquiryDescription({
    super.key,
    required this.decriptionController,
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
        validator: (username) {
          if (username == null || username.isEmpty) {
            return 'Please enter description';
          }
          return null;
        },
        onChanged: (value) {
          context.read<ManageOrderBloc>().updateData(description: value);
          print(value);
        },
        controller: decriptionController,
        textInputAction: TextInputAction.next,
        decoration: InputDecoration(
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
          hintText: 'Description',
          fillColor: Theme.of(context).colorScheme.surfaceTint,

          hintStyle: const TextStyle(color: AppColors.textSecondary),
        ),
      ),
    );
  }
}
