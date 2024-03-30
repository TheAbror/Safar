import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:safar/core/colors/app_colors.dart';
import 'package:safar/core/routes/route_constants.dart';
import 'package:safar/core/utils/navigation_utils.dart';
import 'package:safar/gen/assets.gen.dart';

import '../app_updates_page/app_updates_view.dart';
import 'auth_status/splash_auth_status.dart';
import 'bloc/splash_bloc.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();

    context.read<SplashBloc>().getMinimumAppVersion();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SplashBloc, SplashState>(
      listener: (context, state) {
        if (state.authStatus == SplashAuthStatus.authorized) {
          NavigationUtils.navigateToNextRouteByAccountType(
            context,
            state.accountType,
          );
        } else if (state.authStatus == SplashAuthStatus.notAuthorized) {
          Navigator.of(context).pushNamedAndRemoveUntil(
            AppRoutes.signIn,
            (route) => false,
          );
        }
      },
      builder: (context, state) {
        return Scaffold(
          backgroundColor: AppColors.float,
          body: state.showAppUpdatesPage ? const AppUpdatesView() : const _SplashView(),
        );
      },
    );
  }
}

class _SplashView extends StatelessWidget {
  const _SplashView();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        SizedBox(height: 150.h),
        Padding(
          padding: EdgeInsets.all(16.w),
          child: Center(
            child: Assets.icons.logoGreen.image(
              width: double.infinity,
              fit: BoxFit.fill,
            ),
          ),
        ),
        SizedBox(height: 150.h),
        const Center(
          child: CircularProgressIndicator(color: AppColors.primary),
        ),
      ],
    );
  }
}
