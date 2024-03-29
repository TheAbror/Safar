import 'package:safar/core/colors/app_colors.dart';
import 'package:safar/ui/manage_order_page/bloc/manage_order_bloc.dart';
import 'package:safar/ui/manage_order_page/model/inquiry_item.dart';
import 'package:safar/ui/manage_order_page/widgets/create_amount.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AmountSelection extends StatelessWidget {
  final InquiryItem item;
  final int index;

  const AmountSelection({
    super.key,
    required this.item,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Количество пассажиров',
          style: TextStyle(
            fontSize: 14.sp,
            fontWeight: FontWeight.w400,
            color: AppColors.textSecondary,
          ),
        ),
        Container(
          margin: EdgeInsets.only(top: 8.h),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CounterAmount(
                text: '-',
                width: 56.w,
                onTap: () {
                  final updatedItem = InquiryItem(
                    name: item.name,
                    quantity: item.quantity - 1,
                    measurement: item.measurement,
                  );
                  context
                      .read<ManageOrderBloc>()
                      .updateInquiryItem(data: updatedItem, index: index);
                },
              ),
              CounterAmount(
                text: item.quantity.abs().toString(),
                textSize: 16.sp,
                width: 196.w,
              ),
              CounterAmount(
                text: '+',
                width: 56.w,
                onTap: () {
                  final updatedItem = InquiryItem(
                    name: item.name,
                    quantity: item.quantity + 1,
                    measurement: item.measurement,
                  );
                  context
                      .read<ManageOrderBloc>()
                      .updateInquiryItem(data: updatedItem, index: index);
                },
              ),
            ],
          ),
        ),
      ],
    );
  }
}
