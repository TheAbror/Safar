import 'package:flutter/material.dart';
import 'text_form_fields/taxi_from_field copy.dart';
import 'text_form_fields/taxi_from_field.dart';
import 'package:safar/core/colors/app_colors.dart';
import 'text_form_fields/new_inquiry_description.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TitleAndDescription extends StatefulWidget {
  final TextEditingController fromController;
  final TextEditingController toController;
  final TextEditingController descriptionController;

  const TitleAndDescription({
    super.key,
    required this.fromController,
    required this.toController,
    required this.descriptionController,
  });

  @override
  State<TitleAndDescription> createState() => _TitleAndDescriptionState();
}

class _TitleAndDescriptionState extends State<TitleAndDescription> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 8.h, right: 8.w, left: 8.w, bottom: 2.h),
      padding: EdgeInsets.all(10.w),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.onBackground,
        borderRadius: BorderRadius.circular(16.r),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TaxiFromField(titleController: widget.fromController),
          SizedBox(height: 8.h),
          TaxiToField(titleController: widget.toController),
          SizedBox(height: 8.h),
          NewInquiryDescription(decriptionController: widget.descriptionController),
          SizedBox(height: 8.h),
          _PleaseEnterTitleAndDescription(),
          SizedBox(height: 10.h),
        ],
      ),
    );
  }

  Text _PleaseEnterTitleAndDescription() {
    return Text(
      ' Please enter title and description of the inquiry',
      style: TextStyle(
        fontSize: 12.sp,
        fontWeight: FontWeight.w500,
        color: AppColors.textSecondary,
      ),
    );
  }
}
