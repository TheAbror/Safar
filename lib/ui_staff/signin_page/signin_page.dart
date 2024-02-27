import 'package:flutter/material.dart';
import 'package:safar/core/routes/route_constants.dart';
import 'package:safar/gen/assets.gen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'bloc/auth_bloc.dart';
import 'textfields/sign_in_password_field.dart';
import 'textfields/sign_in_username_field.dart';
import 'package:safar/core/colors/app_colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:safar/core/bloc_progress/bloc_progress.dart';
import 'package:safar/core/dialogs/dialog_success_failure.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final _formKey = GlobalKey<FormState>();

  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthBloc(),
      child: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Scaffold(
          backgroundColor: AppColors.float,
          resizeToAvoidBottomInset: false,
          body: BlocConsumer<AuthBloc, AuthState>(
            listener: (context, state) async {
              if (state.blocProgress == BlocProgress.IS_SUCCESS) {
                // NavigationUtils.navigateToNextRouteByAccountType(
                //   context,
                //   state.accountType,
                //   'isPasscodeOnDefault',
                // );
                Navigator.pushNamed(context, AppRoutes.staffHome);
              }
              if (state.blocProgress == BlocProgress.IS_LOADING) {
                Center(
                  child: CircularProgressIndicator(color: AppColors.primary),
                );
              } else if (state.blocProgress == BlocProgress.FAILED) {
                showMessage(
                  state.failureMessage,
                  isError: true,
                );
              }
            },
            builder: (context, state) {
              return Form(
                key: _formKey,
                child: SafeArea(
                  bottom: false,
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.h),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 30.h),
                        // Center(
                        //   child: Assets.icons.logoGreen.image(
                        //     width: double.infinity,
                        //     fit: BoxFit.fill,
                        //   ),
                        // ),
                        SizedBox(height: 5.h),
                        Text(
                          'Войти',
                          style: TextStyle(
                            fontSize: 24.sp,
                            fontWeight: FontWeight.w500,
                            color: Theme.of(context).colorScheme.tertiaryContainer,
                          ),
                        ),
                        SizedBox(height: 8.h),
                        Text(
                          'Введите свои учетные данные для доступа к платформе',
                          style: TextStyle(
                            fontSize: 15.sp,
                            fontWeight: FontWeight.w400,
                            color: Theme.of(context).colorScheme.tertiaryContainer,
                          ),
                        ),
                        SizedBox(height: 20.h),
                        Text(
                          'Логин',
                          style: TextStyle(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w500,
                            color: AppColors.logInInTextColor,
                          ),
                        ),
                        SizedBox(height: 5.h),
                        SignInUsernameField(usernameController: _usernameController),
                        SizedBox(height: 24.h),
                        Text(
                          'Пароль',
                          style: TextStyle(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w500,
                            color: AppColors.logInInTextColor,
                          ),
                        ),
                        SizedBox(height: 5.h),
                        SignInPasswordField(passwordController: _passwordController),
                        const Spacer(),
                        _ContinueButton(context, state),
                        SizedBox(height: 50.h),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  GestureDetector _ContinueButton(BuildContext context, AuthState state) {
    return GestureDetector(
      onTap: () async {
        final username = _usernameController.text.trim();
        final password = _passwordController.text.trim();
        if (_formKey.currentState!.validate()) {
          context.read<AuthBloc>().signIn(username, password, '998914309090');
        }
        // if (
        //     // state.isWaiting == false &&
        //     state.blocProgress == BlocProgress.IS_SUCCESS) {
        // }
      },
      child: Container(
        height: 48.h,
        width: double.infinity,
        decoration: BoxDecoration(
          color: AppColors.primary,
          borderRadius: BorderRadius.all(Radius.circular(40.r)),
          border: Border.all(color: AppColors.primary, width: 1),
        ),
        child: Center(
          child: state.isWaiting
              ? SizedBox(
                  width: 25.w,
                  height: 25.w,
                  child: CircularProgressIndicator(
                    color: AppColors.float,
                    strokeWidth: 2.w,
                  ),
                )
              : Text(
                  'Продолжить',
                  style: TextStyle(
                    letterSpacing: 0.5,
                    fontSize: 15.sp,
                    color: AppColors.onPrimary,
                    fontWeight: FontWeight.w600,
                  ),
                ),
        ),
      ),
    );
  }
}
