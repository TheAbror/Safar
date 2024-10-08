import 'bloc/auth_bloc.dart';
import 'package:flutter/material.dart';
import 'package:safar/gen/assets.gen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'textfields/contact_info_field.dart';
import 'textfields/sign_in_password_field.dart';
import 'textfields/sign_in_username_field.dart';
import 'package:safar/core/colors/app_colors.dart';
import 'package:safar/core/routes/route_constants.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:safar/core/bloc_progress/bloc_progress.dart';
import 'package:safar/core/dialogs/dialog_success_failure.dart';
import '../splash_page/terms_and_conditions/terms_and_conditions_bottomsheet.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final _formKey = GlobalKey<FormState>();

  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  final _contactsController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Scaffold(
        backgroundColor: AppColors.float,
        resizeToAvoidBottomInset: false,
        body: BlocConsumer<AuthBloc, AuthState>(
          listener: (context, state) async {
            if (state.blocProgress == BlocProgress.IS_SUCCESS) {
              Navigator.pushNamed(context, AppRoutes.rootPage);
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
            return Stack(
              children: [
                SingleChildScrollView(
                  physics: AlwaysScrollableScrollPhysics(),
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.h),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 40.h),
                        Center(
                          child: Assets.icons.logoGreen.image(
                            width: double.infinity,
                            fit: BoxFit.fill,
                          ),
                        ),
                        Text(
                          'Войти',
                          style: TextStyle(
                            fontSize: 24.sp,
                            fontWeight: FontWeight.w500,
                            color: Theme.of(context).colorScheme.tertiaryContainer,
                          ),
                        ),
                        SizedBox(height: 2.h),
                        Text(
                          'Введите свои учетные данные для доступа к платформе',
                          style: TextStyle(
                            fontSize: 15.sp,
                            fontWeight: FontWeight.w400,
                            color: Theme.of(context).colorScheme.tertiaryContainer,
                          ),
                        ),
                        SizedBox(height: 10.h),
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
                        Text(
                          'Номер',
                          style: TextStyle(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w500,
                            color: AppColors.logInInTextColor,
                          ),
                        ),
                        SizedBox(height: 5.h),
                        ContactInfoField(contactsController: _contactsController),
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
                        _AgreeWithTermsText(state, context),
                        // SizedBox(height: 10.h),
                        // Row(
                        //   mainAxisAlignment: MainAxisAlignment.end,
                        //   children: [
                        //     InkWell(
                        //       onTap: () {
                        //         Navigator.pushNamed(context, AppRoutes.rootPage);
                        //       },
                        //       child: Text(
                        //         'Skip for now',
                        //         style: TextStyle(
                        //           color: AppColors.primary,
                        //           decoration: TextDecoration.underline,
                        //           decorationColor: AppColors.primary,
                        //         ),
                        //       ),
                        //     ),
                        //   ],
                        // ),
                        SizedBox(height: 250.h),
                      ],
                    ),
                  ),
                ),
                Positioned(
                  bottom: 30.h,
                  right: 16.w,
                  left: 16.w,
                  child: _ContinueButton(
                    context,
                    state,
                    state.isAgreedToTerms,
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }

  GestureDetector _ContinueButton(
    BuildContext context,
    AuthState state,
    bool isAgreed,
  ) {
    return GestureDetector(
      onTap: !isAgreed
          ? null
          : () async {
              final username = _usernameController.text.trim();
              final password = _passwordController.text.trim();
              final contactInfo = _contactsController.text.trim();

              if (_formKey.currentState!.validate()) {
                context.read<AuthBloc>().signIn(username, password, contactInfo);
              }
            },
      child: Container(
        height: 50.h,
        decoration: BoxDecoration(
          color: isAgreed ? AppColors.primary : Colors.grey.shade500,
          borderRadius: BorderRadius.all(Radius.circular(40.r)),
          border: Border.all(color: AppColors.primary, width: 1),
        ),
        child: Center(
          child: state.blocProgress == BlocProgress.IS_LOADING
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

  Row _AgreeWithTermsText(AuthState state, BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        GestureDetector(
          onTap: () => termsAndConditions(),
          child: Text(
            'Согласен с условиями использования',
            style: TextStyle(
              fontSize: 14.sp,
              fontWeight: FontWeight.w500,
              color: AppColors.primary,
            ),
          ),
        ),
        Checkbox(
          activeColor: AppColors.primary,
          value: state.isAgreedToTerms,
          onChanged: (value) {
            context.read<AuthBloc>().isAgreedToTerms(value ?? false);
          },
        ),
      ],
    );
  }

  void termsAndConditions() async {
    final result = await TermsBottomSheet.show(context);
    if (result != null) {
      if (!mounted) return;
      context.read<AuthBloc>().isAgreedToTerms(result);
    }
  }
}
