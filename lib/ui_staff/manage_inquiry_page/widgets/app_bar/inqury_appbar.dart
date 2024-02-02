import 'package:safar/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

AppBar staff_inruiry_appbar(
  BuildContext context,
  String text,
  Widget widget,
) {
  return AppBar(
    elevation: 1,
    backgroundColor: Theme.of(context).colorScheme.onBackground,
    automaticallyImplyLeading: false,
    title: Stack(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w),
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
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
              padding: EdgeInsets.zero,
              constraints: const BoxConstraints(),
              icon: Assets.icons.appBarIcons.arrowLeft.svg(
                colorFilter: ColorFilter.mode(
                  Theme.of(context).colorScheme.tertiary,
                  BlendMode.srcIn,
                ),
              ),
              onPressed: () {
                //  Navigator.of(context).popUntil((route) => route.isFirst);
                Navigator.of(context).pop();
              },
            ),
            widget,
          ],
        ),
      ],
    ),
  );
}
