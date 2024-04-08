import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:safar/ui/manage_order_page/widgets/from_to_fields.dart';

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
    return TextFormField(
      onChanged: widget.onChanged,
      controller: widget.thisController,
      textInputAction: TextInputAction.next,
      decoration: ToFromDecoration(context, widget.hintText, false),
    );
  }
}

class PhoneNumberField extends StatefulWidget {
  final String hintText;
  final bool isNumberNeeded;
  final Function(String)? onChanged;
  final TextEditingController thisController;

  const PhoneNumberField({
    super.key,
    required this.hintText,
    this.isNumberNeeded = false,
    required this.thisController,
    required this.onChanged,
  });

  @override
  State<PhoneNumberField> createState() => _PhoneNumberFieldState();
}

class _PhoneNumberFieldState extends State<PhoneNumberField> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      inputFormatters: [
        LengthLimitingTextInputFormatter(9),
      ],
      keyboardType: widget.isNumberNeeded ? TextInputType.number : TextInputType.text,
      onChanged: widget.onChanged,
      controller: widget.thisController,
      textInputAction: TextInputAction.next,
      decoration: ToFromDecoration(context, widget.hintText, false),
    );
  }
}
