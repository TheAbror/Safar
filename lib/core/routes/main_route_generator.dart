import 'package:flutter/material.dart';
import 'package:safar/core/routes/route_constants.dart';
import 'package:safar/ui_staff/bildirgi_page/bildirgi_page.dart';
import 'package:safar/ui_staff/staff_home_page/staff_home_page.dart';
import 'package:safar/core/routes/cupertino_style_navigation_route.dart';
import 'package:safar/ui_staff/manage_inquiry_page/manage_inquiry_page.dart';

class MainRouteGenerator {
  Route<dynamic>? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      // case AppRoutes.splashPage:
      //   return CustomCupertinoStyleNavigationRoute(
      //     builder: (_) => const SplashPage(),
      //   );

      // case AppRoutes.signIn:
      //   return CustomCupertinoStyleNavigationRoute(
      //     builder: (_) => const SignInPage(),
      //   );
      // case AppRoutes.homePage:
      //   return CustomCupertinoStyleNavigationRoute(
      //     builder: (_) => const HomePage(),
      //   );
      // case AppRoutes.pinPage:
      //   return CustomCupertinoStyleNavigationRoute(
      //     builder: (_) => const PinCodePage(),
      //   );
      case AppRoutes.staffHome:
        return CustomCupertinoStyleNavigationRoute(
          builder: (_) => const StaffHomePage(),
        );
      case AppRoutes.manageInquiry:
        return CustomCupertinoStyleNavigationRoute(
          builder: (_) => ManageInquiryPage(
            viewModel: settings.arguments as ManageInquiryPageViewModel,
          ),
        );
      case AppRoutes.bildirgi:
        return CustomCupertinoStyleNavigationRoute(
          builder: (context) => BildirgiPage(
            viewModel: settings.arguments as BildirgiPageViewModel,
          ),
        );

      default:
        return CustomCupertinoStyleNavigationRoute(
          // builder: (_) => const MainModuleLessonsQuestionsPage(),
          builder: (_) => const StaffHomePage(),
          // builder: (_) => const AssessmentInfoEditPage(),
        );
    }
  }
}
