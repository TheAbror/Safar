import 'package:safar/core/dialogs/dialog_success_failure.dart';
import 'package:safar/core/routes/route_constants.dart';
import 'package:safar/core/utils/account_type.dart';
import 'package:flutter/material.dart';

class NavigationUtils {
  static void navigateToNextRouteByAccountType(
    BuildContext context,
    AccountType accountType,
    String? passcode,
  ) {
    switch (accountType) {
      case AccountType.superAdmin:
      case AccountType.director:
        Navigator.pushNamedAndRemoveUntil(
          context,
          AppRoutes.staffHome,
          (route) => false,
        );
        break;
      case AccountType.staff:
        Navigator.pushNamedAndRemoveUntil(
          context,
          AppRoutes.staffHome,
          (route) => false,
        );
        break;
      case AccountType.student:
        passcode != null
            ? Navigator.pushNamedAndRemoveUntil(context, AppRoutes.pinPage, (route) => false)
            : Navigator.pushNamedAndRemoveUntil(context, AppRoutes.homePage, (route) => false);
        break;

      // to be deleted
      case AccountType.unknown:
        passcode != null
            ? Navigator.pushNamedAndRemoveUntil(context, AppRoutes.pinPage, (route) => false)
            : Navigator.pushNamedAndRemoveUntil(context, AppRoutes.staffHome, (route) => false);
        break;
      //
      default:
        showMessage(
          'You must have either student or director role',
          isError: true,
        );
        break;
    }
  }
}
