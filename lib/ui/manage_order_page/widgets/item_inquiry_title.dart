import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:safar/core/colors/app_colors.dart';
import 'delivery_item.dart';

class ItemInquiryTitle extends StatefulWidget {
  final int index;
  final DeliveryItem item;

  const ItemInquiryTitle({
    super.key,
    required this.index,
    required this.item,
  });

  @override
  State<ItemInquiryTitle> createState() => _ItemInquiryTitleState();
}

class _ItemInquiryTitleState extends State<ItemInquiryTitle> {
  late TextEditingController controller;

  @override
  void initState() {
    controller = TextEditingController(text: widget.item.name);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 10.h),
        TextFormField(
          onChanged: (value) {
            // final updatedItem = InquiryItem(
            //   name: value,
            //   quantity: widget.item.quantity,
            //   measurement: widget.item.measurement,
            // );

            // context
            //     .read<ManageInquiryBloc>()
            //     .updateInquiryItem(index: widget.index, data: updatedItem);
          },
          // validator: (username) {
          //   if (username == null || username.isEmpty) {
          //     return context.localizations.pleaseEnterValue;
          //   }
          //   return null;
          // },
          controller: controller,
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
            hintText: 'Title',
            fillColor: Theme.of(context).colorScheme.surfaceTint,
            hintStyle: const TextStyle(color: AppColors.textSecondary),
          ),
        ),
        SizedBox(height: 8.h),
      ],
    );
  }
}
