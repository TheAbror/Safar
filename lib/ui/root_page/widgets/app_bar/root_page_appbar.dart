import 'package:safar/core/constants/app_configs.dart';
import 'package:safar/ui/root_page/widgets/app_bar/appbar_item.dart';
import 'package:flutter/material.dart';
import 'package:safar/core/colors/app_colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:safar/ui/root_page/widgets/app_bar/home_appbar.dart';

AppBar rootPage_appBar(context, String fullName, String role) {
  return AppBar(
    elevation: 1,
    backgroundColor: Theme.of(context).colorScheme.onBackground,
    bottom: PreferredSize(
      preferredSize: Size.fromHeight(44.h),
      child: Container(
        margin: EdgeInsets.all(corex * 2.h),
        padding: const EdgeInsets.all(3),
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.inversePrimary,
          borderRadius: BorderRadius.circular(corex * 3.r),
        ),
        child: TabBar(
          dividerColor: Colors.transparent,
          labelPadding: const EdgeInsets.all(0),
          indicatorPadding: const EdgeInsets.all(0),
          labelColor: AppColors.textMain,
          indicatorSize: TabBarIndicatorSize.tab,
          unselectedLabelColor: AppColors.iconSecondary,
          indicator: BoxDecoration(
            color: Theme.of(context).colorScheme.outline,
            borderRadius: BorderRadius.all(Radius.circular(corex * 2.r)),
          ),
          tabs: const [
            AppBarItem(text: 'Доставка'),
            AppBarItem(text: 'Такси'),
          ],
        ),
      ),
    ),
    automaticallyImplyLeading: false,
    title: HomeAppBar(fullName: fullName, role: role),
  );
}
