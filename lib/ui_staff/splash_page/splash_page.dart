import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:safar/core/colors/app_colors.dart';
import 'package:safar/core/routes/route_constants.dart';
import 'package:safar/core/utils/navigation_utils.dart';
import 'package:safar/gen/assets.gen.dart';
import 'auth_status/splash_auth_status.dart';
import 'bloc/splash_bloc.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SplashBloc, SplashState>(
      listener: (context, state) {
        if (state.authStatus == SplashAuthStatus.authorized) {
          NavigationUtils.navigateToNextRouteByAccountType(
            context,
            state.accountType,
            state.passcode,
          );
        } else if (state.authStatus == SplashAuthStatus.initial) {
          Navigator.of(context).pushNamedAndRemoveUntil(
            AppRoutes.signIn,
            (route) => false,
          );
        } else {
          Navigator.pushNamed(context, AppRoutes.staffHome);
        }
      },
      builder: (context, state) {
        return Scaffold(
          backgroundColor: AppColors.float,
          body: _SplashView(),
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
        SizedBox(height: 100.h),
        Center(
          child: Assets.icons.logo.image(
            width: double.infinity,
            fit: BoxFit.fill,
          ),
        ),
        SizedBox(height: 30.h),
        const Center(
          child: CircularProgressIndicator(color: AppColors.primary),
        ),
      ],
    );
  }
}
