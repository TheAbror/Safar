import 'package:safar/core/bottomsheet/primary_bottom_sheet.dart';
import 'package:safar/core/colors/app_colors.dart';
import 'package:safar/core/db/shared_keys.dart';
import 'package:safar/ui/home_page/bloc/orders_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TaxiToField extends StatefulWidget {
  final TextEditingController titleController;

  const TaxiToField({
    super.key,
    required this.titleController,
  });

  @override
  State<TaxiToField> createState() => _TaxiToFieldState();
}

class _TaxiToFieldState extends State<TaxiToField> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      readOnly: true,
      onTap: () async {
        final result = await PrimaryBottomSheet.show(
          context,
          isSearchNeeded: true,
          heightRatio: 0.9,
          isConfirmationNeeded: false,
          title: 'Quick reply',
          selectedValue: 'Room',
          initialList: ShPrefKeys.listOfStates,
        );

        if (result != null) {
          if (!mounted) return;
          widget.titleController.text = result;
          context.read<OrdersBloc>().updateData(destination: result);
          print(result);
        }
      },
      controller: widget.titleController,
      textInputAction: TextInputAction.next,
      decoration: _Decoration(context),
    );
  }

  InputDecoration _Decoration(BuildContext context) {
    return InputDecoration(
      filled: true,
      border: InputBorder.none, // Remove border color
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: AppColors.stroke, width: 0.5.w),
        borderRadius: BorderRadius.circular(12),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: AppColors.primary, width: 0.5.w),
        borderRadius: BorderRadius.circular(12),
      ),
      errorBorder: OutlineInputBorder(
        borderSide: BorderSide(color: AppColors.stroke, width: 0.5.w),
        borderRadius: BorderRadius.circular(12),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderSide: BorderSide(color: AppColors.stroke, width: 0.5.w),
        borderRadius: BorderRadius.circular(12),
      ),
      hintText: 'В',
      fillColor: Theme.of(context).colorScheme.surfaceTint,
      hintStyle: const TextStyle(color: AppColors.textSecondary),
      suffixIcon: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            alignment: Alignment.topRight,
            height: 24.h,
            width: 24.h,
            child: const Icon(Icons.arrow_drop_down_outlined),
          ),
        ],
      ),
    );
  }
}
