import 'package:safar/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

AppBar order_appbar(
  BuildContext context,
  String text,
  Widget widget,
) {
  return AppBar(
    elevation: 1,
    backgroundColor: Theme.of(context).colorScheme.onBackground,
    automaticallyImplyLeading: false,
    title: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        InkWell(
          onTap: () {
            Navigator.of(context).pop();
          },
          child: Assets.icons.arrowLeft.svg(
            colorFilter: ColorFilter.mode(
              Theme.of(context).colorScheme.tertiary,
              BlendMode.srcIn,
            ),
          ),
        ),
        Expanded(
          child: Center(
            child: Text(
              text,
              style: TextStyle(
                fontSize: 18.sp,
                fontWeight: FontWeight.w700,
                color: Theme.of(context).colorScheme.tertiary,
              ),
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ),
        widget,
      ],
    ),
  );
}
