// ignore_for_file: unused_local_variable

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:safar/core/colors/app_colors.dart';
import 'package:safar/ui/home_page/bloc/orders_bloc.dart';
import 'create_amount.dart';
import 'delivery_item.dart';

class AmountSelection extends StatelessWidget {
  final DeliveryItem item;
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
          'Amount',
          style: TextStyle(
            fontSize: 14.sp,
            fontWeight: FontWeight.w400,
            color: AppColors.textSecondary,
          ),
        ),
        Container(
          margin: EdgeInsets.only(top: 4.h),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CounterAmount(
                text: '-',
                width: 56.w,
                onTap: () {
                  final updatedItem = DeliveryItem(
                    name: item.name,
                    quantity: item.quantity - 1,
                  );
                  context.read<OrdersBloc>().updateDeliveryItem(data: updatedItem, index: index);
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
                  final updatedItem = DeliveryItem(
                    name: item.name,
                    quantity: item.quantity + 1,
                  );
                },
              ),
            ],
          ),
        ),
      ],
    );
  }
}
