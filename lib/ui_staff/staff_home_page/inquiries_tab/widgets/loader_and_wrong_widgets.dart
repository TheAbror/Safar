import 'package:safar/core/bottomsheet/primary_loader.dart';
import 'package:safar/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
            child: Assets.icons.homePageIcons.noData.svg(),
          ),
        ],
      ),
    );
  }
}

class TabsLoader extends StatelessWidget {
  const TabsLoader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 400.h,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          Center(child: PrimaryLoader()),
        ],
      ),
    );
  }
}
