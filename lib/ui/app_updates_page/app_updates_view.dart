import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:safar/core/buttons/action_button.dart';
import 'package:safar/core/colors/app_colors.dart';
import 'package:safar/gen/assets.gen.dart';
import 'package:url_launcher/url_launcher.dart';

class AppUpdatesView extends StatefulWidget {
  const AppUpdatesView({super.key});

  @override
  State<AppUpdatesView> createState() => _AppUpdatesViewState();
}

class _AppUpdatesViewState extends State<AppUpdatesView> {
  int buildNumber = 1;
  bool showMaintenance = false;
  int latestAppVersion = 1;
  String title = '';
  String description = '';
  String androidStoreUrl = '';
  String iosStoreUrl = '';

  @override
  void initState() {
    getAppVersions();

    super.initState();
  }

  void getAppVersions() async {
    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    buildNumber = int.parse(packageInfo.buildNumber);

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.float,
      padding: EdgeInsets.symmetric(horizontal: 24.w),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          const Spacer(flex: 2),
          Column(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.all(24.w),
                child: Assets.icons.logo.image(
                  width: 260.w,
                  fit: BoxFit.fill,
                ),
              ),
            ],
          ),
          Expanded(
            flex: 8,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.w),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(height: 40.h),
                  // showMaintenance
                  //     ? Assets.icons.homePageIcons.maintenance.svg(width: 170.w)
                  //     : Platform.isAndroid
                  //         ? Assets.images.googlePlay.image(width: 80.w)
                  //         : Assets.images.iosAppStore.image(width: 80.w),
                  SizedBox(height: 40.h),
                  Text(
                    title,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w700,
                      color: AppColors.textMain,
                    ),
                  ),
                  SizedBox(height: 10.h),
                  Text(
                    description,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 16.sp,
                      color: AppColors.textMain,
                    ),
                  ),
                ],
              ),
            ),
          ),
          if (!showMaintenance)
            Padding(
              padding: EdgeInsets.only(top: 60.h),
              child: Column(
                children: [
                  ActionButton(
                    text: 'Update now'.toUpperCase(),
                    onPressed: () => _launchUrl(Platform.isAndroid ? androidStoreUrl : iosStoreUrl),
                  ),
                  if (buildNumber < latestAppVersion)
                    Padding(
                      padding: EdgeInsets.only(top: 10.h),
                      child: ActionButton(
                        isFilled: false,
                        text: 'Not now'.toUpperCase(),
                        onPressed: () {
                          // context.read<SplashBloc>().setupInitialSettings();
                        },
                      ),
                    ),
                  SizedBox(height: 60.h),
                ],
              ),
            )
        ],
      ),
    );
  }
}

Future<void> _launchUrl(String url) async {
  final Uri parsedUrl = Uri.parse(url);

  if (!await launchUrl(parsedUrl)) {
    throw Exception('Could not launch $parsedUrl');
  }
}
