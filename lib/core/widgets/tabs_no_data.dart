import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:safar/gen/assets.gen.dart';

class TabsNoData extends StatelessWidget {
  const TabsNoData({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 400.h,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Assets.icons.noData.svg(),
          ),
        ],
      ),
    );
  }
}
