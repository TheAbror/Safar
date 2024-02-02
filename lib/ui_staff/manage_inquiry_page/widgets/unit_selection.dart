import 'package:safar/core/colors/app_colors.dart';
import 'package:safar/ui_staff/manage_inquiry_page/bloc/manage_inquiry_bloc.dart';
import 'package:safar/ui_staff/manage_inquiry_page/inquiry_bottom_sheet.dart';
import 'package:safar/ui_staff/manage_inquiry_page/model/inquiry_item.dart';
import 'package:safar/ui_staff/manage_inquiry_page/model/inquiry_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class UnitSelection extends StatefulWidget {
  final InquiryItem item;
  final int index;

  const UnitSelection({
    super.key,
    required this.item,
    required this.index,
  });

  @override
  State<UnitSelection> createState() => _UnitSelectionState();
}

class _UnitSelectionState extends State<UnitSelection> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ManageInquiryBloc, ManageInquiryState>(
      builder: (context, state) {
        final measurement = widget.item.measurement ??
            (state.measurementsList.isNotEmpty
                ? state.measurementsList.first
                : MeasurementResponse(label: '', value: ''));

        return GestureDetector(
          onTap: () async {
            var result = await InquiryBottomSheet.show(
              context,
              isSearchNeeded: true,
              heightRatio: 0.7,
              isConfirmationNeeded: false,
              title: 'Select Unit',
              selectedValue: measurement,
              initialList: state.measurementsList,
            );
            print(result);

            if (result != null) {
              final updatedItem = InquiryItem(
                name: widget.item.name,
                quantity: widget.item.quantity,
                measurement: result,
              );

              if (!mounted) return;

              context
                  .read<ManageInquiryBloc>()
                  .updateInquiryItem(index: widget.index, data: updatedItem);
            }
          },
          child: Container(
            height: 56.h,
            width: double.infinity,
            margin: EdgeInsets.only(top: 8.h),
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.surfaceTint,
              border: Border.all(color: AppColors.stroke, width: 0.5.w),
              borderRadius: BorderRadius.circular(12.r),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  measurement.label,
                  style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w400,
                    color: AppColors.textSecondary,
                  ),
                  textAlign: TextAlign.center,
                ),
                Icon(
                  Icons.arrow_drop_down_outlined,
                  color: AppColors.iconSecondary,
                  size: 24.sp,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
