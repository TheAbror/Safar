import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../core/colors/app_colors.dart';

class ContactInfoField extends StatelessWidget {
  final TextEditingController _contactsController;

  const ContactInfoField({
    super.key,
    required TextEditingController contactsController,
  }) : _contactsController = contactsController;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: TextInputType.number,
      validator: (username) {
        if (username == null || username.isEmpty) {
          return 'Все поля должны быть заполнены';
        }
        return null;
      },
      controller: _contactsController,
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        filled: true,
        border: InputBorder.none, // Remove border color
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.inputField, width: 1.w),
          borderRadius: BorderRadius.circular(12),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.primary, width: 1.w),
          borderRadius: BorderRadius.circular(12),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.inputField, width: 1.w),
          borderRadius: BorderRadius.circular(12),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.inputField, width: 1.w),
          borderRadius: BorderRadius.circular(12),
        ),
        fillColor: Theme.of(context).colorScheme.surfaceTint,
        hintText: 'Телефон номер',
      ),
    );
  }
}
