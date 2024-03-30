import 'package:safar/core/colors/app_colors.dart';
import 'package:safar/ui/home_page/bloc/orders_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AdditionalField extends StatefulWidget {
  final String hintText;
  final TextEditingController thisController;

  const AdditionalField({
    super.key,
    required this.thisController,
    required this.hintText,
  });

  @override
  State<AdditionalField> createState() => _AdditionalFieldState();
}

class _AdditionalFieldState extends State<AdditionalField> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged: (value) {
        context.read<OrdersBloc>().updateData(destinationReference: value);
        print(value);
      },
      controller: widget.thisController,
      textInputAction: TextInputAction.next,
      decoration: _Decoration(context, widget.hintText),
    );
  }
}

class PickUpReferenceField extends StatefulWidget {
  final String hintText;
  final TextEditingController thisController;

  const PickUpReferenceField({
    super.key,
    required this.thisController,
    required this.hintText,
  });

  @override
  State<PickUpReferenceField> createState() => _PickUpReferenceFieldState();
}

class _PickUpReferenceFieldState extends State<PickUpReferenceField> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged: (value) {
        context.read<OrdersBloc>().updateData(pickUpReference: value);
        print(value);
      },
      controller: widget.thisController,
      textInputAction: TextInputAction.next,
      decoration: _Decoration(context, widget.hintText),
    );
  }
}

class OfferedPriceField extends StatefulWidget {
  final String hintText;
  final TextEditingController thisController;

  const OfferedPriceField({
    super.key,
    required this.thisController,
    required this.hintText,
  });

  @override
  State<OfferedPriceField> createState() => _OfferedPriceFieldState();
}

class _OfferedPriceFieldState extends State<OfferedPriceField> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged: (value) {
        context.read<OrdersBloc>().updateData(offeredPrice: value);
        print(value);
      },
      controller: widget.thisController,
      textInputAction: TextInputAction.next,
      decoration: _Decoration(context, widget.hintText),
    );
  }
}

class PhoneNumberField extends StatefulWidget {
  final String hintText;
  final TextEditingController thisController;

  const PhoneNumberField({
    super.key,
    required this.thisController,
    required this.hintText,
  });

  @override
  State<PhoneNumberField> createState() => _PhoneNumberFieldState();
}

class _PhoneNumberFieldState extends State<PhoneNumberField> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged: (value) {
        context.read<OrdersBloc>().updateData(offeredPrice: value);
        print(value);
      },
      controller: widget.thisController,
      textInputAction: TextInputAction.next,
      decoration: _Decoration(context, widget.hintText),
    );
  }
}

InputDecoration _Decoration(BuildContext context, String hintText) {
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
    hintText: hintText,
    fillColor: Theme.of(context).colorScheme.surfaceTint,
    hintStyle: const TextStyle(color: AppColors.textSecondary),
  );
}
