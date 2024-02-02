import 'package:safar/core/colors/app_colors.dart';
import 'package:safar/ui_staff/bildirgi_page/widgets/change_log/chage_log_dot.dart';
import 'package:safar/ui_staff/bildirgi_page/widgets/change_log/change_log_item_card.dart';
import 'package:safar/ui_staff/staff_home_page/model/inquiry_list_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

class ChangeLogItem extends StatelessWidget {
  final History item;

  const ChangeLogItem({
    super.key,
    required this.item,
  });

  @override
  Widget build(BuildContext context) {
    DateTime date = DateTime.fromMillisecondsSinceEpoch(item.created_date);

    String formattedDate = DateFormat('MMMM-d-yyyy, HH:mm').format(date);

    return IntrinsicHeight(
      child: Row(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SizedBox(
            width: 9.w,
            child: Stack(
              alignment: Alignment.topCenter,
              children: [
                const ChangeLogDot(),
                Container(
                  width: 1.w,
                  margin: EdgeInsets.only(top: 11.h, bottom: 17.h),
                  decoration: BoxDecoration(
                    color: AppColors.primary,
                    borderRadius: BorderRadius.circular(5.r),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(left: 7.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    formattedDate,
                    style: TextStyle(
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w600,
                      color: AppColors.primary,
                    ),
                  ),
                  SizedBox(height: 5.h),
                  ChangeLogItemCard(
                    formattedDate: formattedDate,
                    item: item,
                  ),
                  SizedBox(height: 16.h),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
