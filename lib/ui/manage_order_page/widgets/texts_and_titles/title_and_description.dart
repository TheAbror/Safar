import 'package:flutter/material.dart';
import 'package:safar/ui/manage_order_page/model/inquiry_item.dart';
import 'package:safar/ui/manage_order_page/model/inquiry_model.dart';
import 'package:safar/ui/manage_order_page/widgets/amount_selection.dart';
import 'text_form_fields/taxi_to_field.dart';
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
          AmountSelection(
            item: InquiryItem(
              name: '0',
              quantity: 1,
              measurement: MeasurementResponse(label: '', value: ''),
            ),
            index: 1,
          ),
          SizedBox(height: 8.h),
          NewInquiryDescription(decriptionController: widget.descriptionController),
          SizedBox(height: 8.h),
          SizedBox(height: 10.h),
        ],
      ),
    );
  }
}
