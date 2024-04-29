import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:safar/ui/manage_order_page/widgets/from_to_fields.dart';
import 'package:safar/ui/signin_page/textfields/contact_info_field.dart';

class AdditionalField extends StatefulWidget {
  final String hintText;
  final Function(String)? onChanged;
  final TextEditingController thisController;

  const AdditionalField({
    super.key,
    required this.hintText,
    required this.thisController,
    required this.onChanged,
  });

  @override
  State<AdditionalField> createState() => _AdditionalFieldState();
}

class _AdditionalFieldState extends State<AdditionalField> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 55.h,
      child: TextFormField(
        onChanged: widget.onChanged,
        controller: widget.thisController,
        textInputAction: TextInputAction.next,
        decoration: ToFromDecoration(context, widget.hintText, false),
      ),
    );
  }
}

class PhoneNumberField extends StatefulWidget {
  final String hintText;
  final Function(String)? onChanged;
  final TextEditingController thisController;

  const PhoneNumberField({
    super.key,
    required this.hintText,
    required this.thisController,
    required this.onChanged,
  });

  @override
  State<PhoneNumberField> createState() => _PhoneNumberFieldState();
}

class _PhoneNumberFieldState extends State<PhoneNumberField> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 55.h,
      child: TextFormField(
        inputFormatters: [
          LengthLimitingTextInputFormatter(9),
        ],
        keyboardType: TextInputType.number,
        onChanged: widget.onChanged,
        controller: widget.thisController,
        textInputAction: TextInputAction.next,
        decoration: SignDeocration(
          context,
          widget.hintText.replaceAll('+998', ''),
        ),
      ),
    );
  }
}

class OfferedPriceField extends StatefulWidget {
  final String hintText;
  final Function(String)? onChanged;
  final TextEditingController thisController;

  const OfferedPriceField({
    super.key,
    required this.hintText,
    required this.thisController,
    required this.onChanged,
  });

  @override
  State<OfferedPriceField> createState() => _OfferedPriceFieldState();
}

class _OfferedPriceFieldState extends State<OfferedPriceField> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 55.h,
      child: TextFormField(
        inputFormatters: [
          LengthLimitingTextInputFormatter(8),
        ],
        keyboardType: TextInputType.number,
        onChanged: widget.onChanged,
        controller: widget.thisController,
        textInputAction: TextInputAction.next,
        decoration: ToFromDecoration(context, widget.hintText, false),
      ),
    );
  }
}
