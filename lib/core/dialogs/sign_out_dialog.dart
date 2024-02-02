import 'package:flutter/material.dart';
import 'package:flutter_dialogs/flutter_dialogs.dart';
import 'package:safar/core/colors/app_colors.dart';

Future<dynamic> signOutDialog(BuildContext context) {
  return showPlatformDialog(
    context: context,
    builder: (mycontext) => BasicDialogAlert(
      title: const Text('Sign Out?'),
      content: const Text('Do you want to sign out from the system'),
      actions: <Widget>[
        BasicDialogAction(
          title: Text('Yes', style: _Style()),
          onPressed: () {
            // PreferencesServices.clearAll().then((value) {
            //   if (value) {
            //     ApiProvider.create();
            //     boxCurrentUser.clear();

            //     Navigator.of(mycontext).pushNamed(AppRoutes.splashPage);
            //   }
            // });
          },
        ),
        BasicDialogAction(
          title: Text('No', style: _Style()),
          onPressed: () => Navigator.pop(mycontext),
        ),
      ],
    ),
  );
}

TextStyle _Style() => TextStyle(color: AppColors.primary);
