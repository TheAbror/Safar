import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:safar/core/api/api_provider.dart';
import 'package:safar/core/box/current_user_box.dart';
import 'package:safar/core/db/preferences_services.dart';
import 'package:safar/core/routes/route_constants.dart';
import 'package:safar/gen/fonts.gen.dart';
import 'package:safar/core/colors/app_colors.dart';
import 'package:safar/core/constants/app_configs.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:safar/ui/signin_page/bloc/auth_bloc.dart';
import 'package:flutter_dialogs/flutter_dialogs.dart';

class HomeAppBar extends StatelessWidget {
  final String? fullName;
  final String? shortName;
  final String? role;

  const HomeAppBar({
    super.key,
    this.fullName,
    this.shortName,
    this.role,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        GestureDetector(
          onTap: () {
            showPlatformDialog(
              context: context,
              builder: (mycontext) => BasicDialogAlert(
                title: const Text('Выход'),
                content: const Text('Вы хотите выйти из системы?'),
                actions: <Widget>[
                  BasicDialogAction(
                    title: Text('Да', style: TextStyle(color: AppColors.primary)),
                    onPressed: () {
                      PreferencesServices.clearAll().then((value) {
                        if (value) {
                          ApiProvider.create();
                          boxCurrentUser.clear();

                          context.read<AuthBloc>().clearAll();

                          Navigator.pop(mycontext);
                          Navigator.of(context).pushNamed(AppRoutes.splashPage);
                        }
                      });
                    },
                  ),
                  BasicDialogAction(
                    title: Text('Нет', style: TextStyle(color: AppColors.primary)),
                    onPressed: () => Navigator.pop(mycontext),
                  ),
                ],
              ),
            );
          },
          child: Container(
            decoration: BoxDecoration(
              color: AppColors.float,
              borderRadius: BorderRadius.all(Radius.circular(corex * 3.r)),
            ),
            child: Container(
              margin: EdgeInsets.all(corex / 2.h),
              padding: EdgeInsets.only(bottom: corex / 2.h),
              width: 32.h,
              height: 32.h,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: Palette.grey75,
                borderRadius: BorderRadius.all(Radius.circular(corex * 2.r)),
              ),
              child: Text(
                shortName ?? '',
                style: TextStyle(
                  fontSize: 14.sp,
                  color: AppColors.textMain,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ),
        SizedBox(width: 8.w),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              fullName ?? '',
              style: TextStyle(
                fontSize: 14.sp,
                color: Theme.of(context).colorScheme.tertiary,
                fontFamily: FontFamily.roboto,
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(height: 0.h),
            Text(
              role?.replaceAll('_', ' ') ?? '',
              style: TextStyle(
                fontSize: 10.sp,
                color: AppColors.iconSecondary,
                fontFamily: FontFamily.roboto,
                fontWeight: FontWeight.w400,
              ),
            ),
          ],
        ),
        const Spacer(),
        SizedBox(width: 5.w)
      ],
    );
  }
}
