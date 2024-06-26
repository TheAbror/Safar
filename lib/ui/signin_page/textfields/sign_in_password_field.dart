import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/colors/app_colors.dart';
import '../bloc/auth_bloc.dart';

class SignInPasswordField extends StatelessWidget {
  const SignInPasswordField({
    super.key,
    required TextEditingController passwordController,
  }) : _passwordController = passwordController;

  final TextEditingController _passwordController;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthBloc, AuthState>(
      builder: (context, state) {
        return SizedBox(
          height: 55.h,
          child: TextFormField(
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Все поля должны быть заполнены';
              }
              return null;
            },
            controller: _passwordController,
            textInputAction: TextInputAction.next,
            obscureText: state.isPasswordHidden,
            decoration: InputDecoration(
              filled: true,
              border: InputBorder.none,
              contentPadding: EdgeInsets.symmetric(vertical: 1.h, horizontal: 12.w),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: AppColors.inputField, width: 1.w),
                borderRadius: BorderRadius.circular(12.r),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: AppColors.primary, width: 1.w),
                borderRadius: BorderRadius.circular(12.r),
              ),
              errorBorder: OutlineInputBorder(
                borderSide: BorderSide(color: AppColors.inputField, width: 1.w),
                borderRadius: BorderRadius.circular(12.r),
              ),
              focusedErrorBorder: OutlineInputBorder(
                borderSide: BorderSide(color: AppColors.inputField, width: 1.w),
                borderRadius: BorderRadius.circular(12.r),
              ),
              fillColor: Theme.of(context).colorScheme.surfaceTint,
              hintText: 'Создайте пароль',
              suffixIcon: InkWell(
                onTap: () {
                  context.read<AuthBloc>().isPasswordHidden();
                },
                child: state.isPasswordHidden
                    ? Icon(
                        Icons.visibility_outlined,
                        size: 20.sp,
                        color: AppColors.primary,
                      )
                    : Icon(
                        Icons.visibility_off_outlined,
                        size: 20.sp,
                        color: AppColors.primary,
                      ),
              ),
            ),
          ),
        );
      },
    );
  }
}
