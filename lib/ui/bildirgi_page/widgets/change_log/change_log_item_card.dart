import 'package:safar/core/colors/app_colors.dart';
import 'package:safar/ui/bildirgi_page/widgets/views/involved_user_view.dart';
import 'package:safar/ui/home_page/model/inquiry_list_model.dart';
import 'package:safar/ui/home_page/widgets/inquiry_status_color.dart';
import 'package:safar/ui/home_page/widgets/status_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

class ChangeLogItemCard extends StatelessWidget {
  final String formattedDate;
  final History item;

  const ChangeLogItemCard({
    super.key,
    required this.formattedDate,
    required this.item,
  });

  @override
  Widget build(BuildContext context) {
    final involvedUsers = item.involvedUsers;

    final involvedUsersWidgetList = <Widget>[];
    final involvedUsersWidgetListEmpty = <Widget>[const Text('None')];

    for (var involvedUser in involvedUsers) {
      involvedUsersWidgetList.add(
        Container(
          margin: EdgeInsets.only(bottom: 12.h),
          child: Row(
            children: [
              Text(
                '${involvedUser.firstname} ${involvedUser.lastname}',
                textAlign: TextAlign.right,
              ),
              SizedBox(width: 5.w),
              Container(
                height: 20.h,
                width: 20.h,
                decoration: BoxDecoration(
                  color: AppColors.outline,
                  borderRadius: BorderRadius.circular(50.r),
                ),
              ),
              // CircleAvatar(),
            ],
          ),
        ),
      );
    }

    DateTime date = DateTime.fromMillisecondsSinceEpoch(item.deadline);

    String deadline = DateFormat('MMMM-d-yyyy, HH:mm:ss').format(date);

    Color textColor = AppColors.textMain;
    Color backgroundColor = AppColors.background;

    StatusColors statusColors = InquiryChengeLogItemStatusColor.displayColorByStatus(item);
    textColor = statusColors.textColor;
    backgroundColor = statusColors.backgroundColor;

    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.background,
        borderRadius: BorderRadius.circular(8.r),
        border: Border.all(color: Theme.of(context).colorScheme.inversePrimary),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.all(8.w),
            child: Row(
              children: [
                StatusWidget(
                  radius: 4,
                  backgroundColor: backgroundColor,
                  status: item.status?.title ?? '',
                  textColor: textColor,
                ),
                const Spacer(),
                InvolvedUserView(
                  userName: '${item.created_by?.firstname} ${item.created_by?.lastname}',
                ),
              ],
            ),
          ),
          if (involvedUsersWidgetList.isNotEmpty || item.comment.isNotEmpty)
            Divider(
              height: 2.h,
              thickness: 0.5.h,
              color: AppColors.outline,
            ),
          if (involvedUsersWidgetList.isNotEmpty)
            Container(
              // margin: EdgeInsets.symmetric(vertical: 16.h, horizontal: 8.w),
              margin: EdgeInsets.only(top: 16.h, right: 8.w, left: 8.w),
              child: Column(
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Involved users',
                        style: TextStyle(
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: involvedUsersWidgetList.isEmpty
                            ? involvedUsersWidgetListEmpty
                            : involvedUsersWidgetList,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          if (involvedUsersWidgetList.isEmpty && item.comment.isNotEmpty) SizedBox(height: 4.h),
          if (item.comment.isNotEmpty)
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.w),
              child: Text(
                'Comment',
                style: TextStyle(
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          if (involvedUsersWidgetList.isNotEmpty || item.comment.isNotEmpty) SizedBox(height: 4.h),
          if (item.comment.isNotEmpty)
            Padding(
              padding: EdgeInsets.only(right: 8.w, left: 8.w, bottom: 16.h),
              child: Text(
                item.comment.isEmpty ? 'None' : item.comment,
                style: TextStyle(
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          item.deadline != 0
              ? Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Deadline',
                        style: TextStyle(
                          fontSize: 11.sp,
                          fontWeight: FontWeight.w500,
                          color: AppColors.textSecondary,
                        ),
                      ),
                      Text(
                        deadline,
                        style: TextStyle(
                          fontSize: 11.sp,
                          fontWeight: FontWeight.w400,
                          color: AppColors.textSecondary,
                        ),
                      ),
                    ],
                  ),
                )
              : const SizedBox()
        ],
      ),
    );
  }
}
