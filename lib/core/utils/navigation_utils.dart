import 'package:safar/core/dialogs/dialog_success_failure.dart';
import 'package:safar/core/routes/route_constants.dart';
import 'package:safar/core/utils/account_type.dart';
import 'package:flutter/material.dart';

class NavigationUtils {
  static void navigateToNextRouteByAccountType(
    BuildContext context,
    AccountType accountType,
  ) {
    switch (accountType) {
      // to be deleted
      case AccountType.unknown:
        Navigator.pushNamedAndRemoveUntil(context, AppRoutes.rootPage, (route) => false);
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
