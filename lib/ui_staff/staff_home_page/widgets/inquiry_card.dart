import 'package:safar/core/colors/app_colors.dart';
import 'package:safar/gen/assets.gen.dart';
import 'package:safar/ui_staff/signin_page/auth/models/user_info.dart';
import 'package:safar/ui_staff/staff_home_page/widgets/inquiry_status_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'status_widget.dart';

class InquiryCard extends StatelessWidget {
  final int index;
  final List<OrdersResponse> model;
  final Widget child;

  const InquiryCard({
    super.key,
    required this.model,
    required this.index,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    DateTime date = DateTime.parse(model[index].createdAt);
    String formattedDate = DateFormat('d-MMMM, HH:mm').format(date);

    Color textColor = AppColors.textMain;
    Color backgroundColor = AppColors.background;

    StatusColors statusColors = InquiryItemStatusColor.displayColorByStatus(index, model);
    textColor = statusColors.textColor;
    backgroundColor = statusColors.backgroundColor;

    return GestureDetector(
      // onTap: () {
      //   Navigator.of(context).pushNamed(
      //     AppRoutes.bildirgi,
      //     arguments: BildirgiPageViewModel(model: model, index: index),
      //   );
      // },
      child: Container(
        margin: EdgeInsets.only(right: 8.w, left: 8.w, bottom: 4.w),
        width: double.infinity,
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.onBackground,
          borderRadius: BorderRadius.circular(16.r),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(left: 16.w, right: 16.w, top: 16.h),
              child: _TitleAndTime(formattedDate, child),
            ),
            SizedBox(height: 7.h),
            Padding(
              padding: EdgeInsets.only(right: 16.w),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _FromTo(model[index].pickup, model[index].destination),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        'Сумма: ',
                        style: TextStyle(color: AppColors.iconSecondary),
                      ),
                      Text(
                        model[index].offeredPrice,
                        style: TextStyle(
                          color: AppColors.primary,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 10.h),
            Padding(
              padding: EdgeInsets.only(left: 12.w, right: 12.w, bottom: 16.h),
              child: _IconNameStatus(context, backgroundColor, textColor),
            ),
          ],
        ),
      ),
    );
  }

  Padding _FromTo(String from, String to) {
    return Padding(
      padding: EdgeInsets.only(left: 51.w),
      child: Row(
        children: [
          Assets.icons.timeLine.image(),
          SizedBox(width: 10.h),
          SizedBox(
            height: 90.h,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Из',
                  style: TextStyle(color: AppColors.iconSecondary),
                ),
                Text(
                  from,
                  style: TextStyle(
                    color: AppColors.textMain,
                    fontSize: 15.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Spacer(),
                Text(
                  'В',
                  style: TextStyle(color: AppColors.iconSecondary),
                ),
                Text(
                  to,
                  style: TextStyle(
                    color: AppColors.textMain,
                    fontSize: 15.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Row _IconNameStatus(BuildContext context, Color backgroundColor, Color textColor) {
    return Row(
      children: [
        Container(
          height: 38.w,
          width: 38.w,
          margin: EdgeInsets.only(left: 4.w),
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
        SizedBox(width: 12.w),
        Expanded(
          flex: 5,
          child: Column(
            children: [
              Divider(height: 1.h, thickness: 0.5),
              SizedBox(height: 6.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Abror Shamuradov',
                        style: TextStyle(
                          fontSize: 14.sp,
                          overflow: TextOverflow.ellipsis,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      Text(
                        'oyjddkvj@gmail.com',
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
                    status: 'In process',
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

  Row _TitleAndTime(String formattedDate, Widget child) {
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
          child: child,
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
                    model[index].pickup,
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
                model[index].destination,
                style: TextStyle(
                  fontSize: 14.sp,
                  overflow: TextOverflow.ellipsis,
                  fontWeight: FontWeight.w700,
                ),
              ),
              SizedBox(height: 8.h),
              Divider(height: 1.h, thickness: 0.5),
            ],
          ),
        ),
      ],
    );
  }
}
