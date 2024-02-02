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
        height: 102.h,
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.onBackground,
          borderRadius: BorderRadius.circular(16.r),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Padding(
              padding: EdgeInsets.only(left: 12.w, right: 12.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    flex: 2,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _TitleAndTime(formattedDate),
                        _Description(),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Divider(
              height: 1.h,
              thickness: 0.5,
            ),
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
          width: 24.w,
          height: 24.w,
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
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '${model[index].created?.firstname} ${model[index].created?.lastname}',
                style: TextStyle(
                  fontSize: 12.sp,
                  overflow: TextOverflow.ellipsis,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Text(
                model[index].created?.email ?? '',
                style: TextStyle(
                  fontSize: 10.sp,
                  overflow: TextOverflow.ellipsis,
                  fontWeight: FontWeight.w400,
                  color: AppColors.textSecondary,
                ),
              ),
            ],
          ),
        ),
        SizedBox(width: 4.w),
        StatusWidget(
          radius: 8,
          backgroundColor: backgroundColor,
          textColor: textColor,
          status: model[index].status?.title ?? '',
        ),
      ],
    );
  }

  Text _Description() {
    return Text(
      model[index]
          .description
          .replaceAll('<p>', '')
          .replaceAll('</p>', '')
          .replaceAll('<br>', '')
          .replaceAll('</br>', '')
          .replaceAll('<strong>', '')
          .replaceAll('</strong>', '')
          .replaceAll('<em>', '')
          .replaceAll('</em>', '')
          .replaceAll('<u>', '')
          .replaceAll('</u>', '')
          .replaceAll('<p style="text-align: justify">', '')
          .replaceAll('</p style="text-align: justify">', ''),
      style: TextStyle(
        fontSize: 14.sp,
        overflow: TextOverflow.ellipsis,
        fontWeight: FontWeight.w700,
      ),
    );
  }

  Row _TitleAndTime(String formattedDate) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          flex: 3,
          child: Text(
            model[index].title,
            style: TextStyle(
              fontSize: 11.sp,
              overflow: TextOverflow.ellipsis,
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
        Expanded(
          flex: 2,
          child: Text(
            formattedDate,
            style: TextStyle(
              fontSize: 11.sp,
              overflow: TextOverflow.ellipsis,
              fontWeight: FontWeight.w400,
              color: AppColors.textSecondary,
            ),
            textAlign: TextAlign.end,
          ),
        ),
      ],
    );
  }
}
