import 'package:safar/core/colors/app_colors.dart';
import 'package:safar/ui/manage_inquiry_page/bloc/manage_order_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RemoveButton extends StatelessWidget {
  final int index;

  const RemoveButton({
    super.key,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.read<ManageOrderBloc>().removeInquiry(index);
      },
      child: Text(
        'Remove',
        style: TextStyle(
          color: AppColors.error,
          fontSize: 14.sp,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}
