import 'package:safar/core/colors/app_colors.dart';
import 'package:safar/core/routes/route_constants.dart';
import 'package:safar/gen/assets.gen.dart';
import 'package:safar/ui_staff/bildirgi_page/bildirgi_page.dart';
import 'package:safar/ui_staff/staff_home_page/model/inquiry_list_model.dart';
import 'package:safar/ui_staff/staff_home_page/widgets/inquiry_status_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'status_widget.dart';

class InquiryCard extends StatelessWidget {
  final int index;
  final List<InquiryListItemResponse> model;

  const InquiryCard({
    super.key,
    required this.model,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    DateTime date = DateTime.fromMillisecondsSinceEpoch(model[index].created_date);
    String formattedDate = DateFormat('d-MMMM, HH:mm').format(date);

    Color textColor = AppColors.textMain;
    Color backgroundColor = AppColors.background;

    StatusColors statusColors = InquiryItemStatusColor.displayColorByStatus(index, model);
    textColor = statusColors.textColor;
    backgroundColor = statusColors.backgroundColor;

    return GestureDetector(
      onTap: () {
        Navigator.of(context).pushNamed(
          AppRoutes.bildirgi,
          arguments: BildirgiPageViewModel(model: model, index: index),
        );
      },
      child: Container(
        margin: EdgeInsets.only(right: 8.w, left: 8.w, bottom: 4.w),
        width: double.infinity,
        height: 238.h,
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.onBackground,
          borderRadius: BorderRadius.circular(16.r),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(left: 16.w, right: 16.w, top: 16.h),
              child: _TitleAndTime(formattedDate),
            ),
            SizedBox(height: 5.h),
            Padding(
              padding: EdgeInsets.only(left: 51.w),
              child: Assets.icons.timeLine.image(),
            ),
            SizedBox(height: 5.h),
            Padding(
              padding: EdgeInsets.only(left: 12.w, right: 12.w),
              child: _IconNameStatus(context, backgroundColor, textColor),
            ),
          ],
        ),
      ),
    );
  }

  Row _IconNameStatus(BuildContext context, Color backgroundColor, Color textColor) {
    return Row(
      children: [
        Container(
          width: 40.w,
          height: 40.w,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(50.r)),
            border: Border.all(
              color: Theme.of(context).colorScheme.tertiary,
              width: 0.5.w,
            ),
            image: DecorationImage(
              colorFilter: ColorFilter.mode(
                Theme.of(context).colorScheme.tertiary,
                BlendMode.srcIn,
              ),
              image: AssetImage(
                Assets.icons.staffIconInquiryCard.path,
              ),
              fit: BoxFit.cover,
            ),
          ),
        ),
        SizedBox(width: 5.w),
        Expanded(
          flex: 5,
          child: Column(
            children: [
              Divider(height: 1.h, thickness: 0.5),
              SizedBox(height: 2.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '${model[index].created?.firstname} ${model[index].created?.lastname}',
                        style: TextStyle(
                          fontSize: 14.sp,
                          overflow: TextOverflow.ellipsis,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Text(
                        model[index].created?.email ?? '',
                        style: TextStyle(
                          fontSize: 12.sp,
                          overflow: TextOverflow.ellipsis,
                          fontWeight: FontWeight.w400,
                          color: AppColors.textSecondary,
                        ),
                      ),
                    ],
                  ),
                  StatusWidget(
                    radius: 8,
                    backgroundColor: backgroundColor,
                    textColor: textColor,
                    status: model[index].status?.title ?? '',
                  ),
                ],
              ),
            ],
          ),
        ),
        SizedBox(width: 4.w),
      ],
    );
  }

  Row _TitleAndTime(String formattedDate) {
    return Row(
      children: [
        Container(
          height: 40.w,
          width: 40.w,
          decoration: BoxDecoration(
            color: AppColors.background,
            borderRadius: BorderRadius.circular(8.r),
            border: Border.all(
              color: AppColors.outline,
              width: 0.5.w,
            ),
          ),
          child: Assets.icons.deliveryIcon.image(),
        ),
        SizedBox(width: 12.w),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    model[index].title,
                    style: TextStyle(
                      fontSize: 11.sp,
                      overflow: TextOverflow.ellipsis,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  Text(
                    formattedDate,
                    style: TextStyle(
                      fontSize: 11.sp,
                      overflow: TextOverflow.ellipsis,
                      fontWeight: FontWeight.w400,
                      color: AppColors.textSecondary,
                    ),
                    textAlign: TextAlign.end,
                  ),
                ],
              ),
              Text(
                model[index].description,
                style: TextStyle(
                  fontSize: 14.sp,
                  overflow: TextOverflow.ellipsis,
                  fontWeight: FontWeight.w700,
                ),
              ),
              SizedBox(height: 4.h),
              Divider(height: 1.h, thickness: 0.5),
            ],
          ),
        ),
      ],
    );
  }
}
