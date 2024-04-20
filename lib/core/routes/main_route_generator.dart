import 'package:flutter/material.dart';
import 'package:safar/core/routes/route_constants.dart';
import 'package:safar/ui/manage_order_page/manage_taxi_orders_page.dart';
import 'package:safar/ui/order_details_page/delivery_details_page.dart';
import 'package:safar/ui/order_details_page/taxi_details_page.dart';
import 'package:safar/ui/signin_page/signin_page.dart';
import 'package:safar/ui/splash_page/splash_page.dart';
import 'package:safar/ui/home_page/root_page.dart';
import 'package:safar/core/routes/cupertino_style_navigation_route.dart';
import 'package:safar/ui/manage_order_page/manage_delievry_orders_page.dart';

class MainRouteGenerator {
  Route<dynamic>? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutes.splashPage:
        return CustomCupertinoStyleNavigationRoute(
          builder: (_) => const SplashPage(),
        );

      case AppRoutes.signIn:
        return CustomCupertinoStyleNavigationRoute(
          builder: (_) => const SignInPage(),
        );
      case AppRoutes.homePage:
        return CustomCupertinoStyleNavigationRoute(
          builder: (_) => const HomePage(),
        );

      case AppRoutes.manageTaxiOrder:
        return CustomCupertinoStyleNavigationRoute(
          builder: (_) => ManageTaxiOrdersPage(
            viewModel: settings.arguments as ManageTaxiOrdersPageViewModel,
          ),
        );
      case AppRoutes.taxiDetails:
        return CustomCupertinoStyleNavigationRoute(
          builder: (context) => TaxiDetailsPage(
            viewModel: settings.arguments as TaxiDetailsPageViewModel,
          ),
        );
      case AppRoutes.manageDeliveryOrder:
        return CustomCupertinoStyleNavigationRoute(
          builder: (_) => ManagDeliveryOrdersPage(
            viewModel: settings.arguments as ManagDeliveryOrdersPageViewModel,
          ),
        );
      case AppRoutes.deliveryDetails:
        return CustomCupertinoStyleNavigationRoute(
          builder: (context) => DeliveryDetailsPage(
            viewModel: settings.arguments as DeliveryDetailsPageViewModel,
          ),
        );

      default:
        return CustomCupertinoStyleNavigationRoute(
          builder: (_) => const SplashPage(),
        );
    }
  }
}
