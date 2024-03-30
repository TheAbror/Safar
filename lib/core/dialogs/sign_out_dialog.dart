import 'package:flutter/material.dart';
import 'package:flutter_dialogs/flutter_dialogs.dart';
import 'package:safar/core/api/api_provider.dart';
import 'package:safar/core/box/current_user_box.dart';
import 'package:safar/core/colors/app_colors.dart';
import 'package:safar/core/routes/route_constants.dart';
import '../db/preferences_services.dart';

Future<dynamic> signOutDialog(BuildContext context) {
  return showPlatformDialog(
    context: context,
    builder: (mycontext) => BasicDialogAlert(
      title: const Text('Выход'),
      content: const Text('Вы хотите выйти из системы?'),
      actions: <Widget>[
        BasicDialogAction(
          title: Text('Да', style: _Style()),
          onPressed: () {
            PreferencesServices.clearAll().then((value) {
              if (value) {
                ApiProvider.create();
                boxCurrentUser.clear();

                Navigator.pushNamed(context, AppRoutes.splashPage);
              }
            });
          },
        ),
        BasicDialogAction(
          title: Text('Нет', style: _Style()),
          onPressed: () => Navigator.pop(mycontext),
        ),
      ],
    ),
  );
}

TextStyle _Style() => TextStyle(color: AppColors.primary);
