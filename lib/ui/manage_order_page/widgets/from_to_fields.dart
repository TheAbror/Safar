import 'package:flutter/material.dart';
import '../texts_and_titles/text_form_fields/taxi_from_field.dart';

class FromToFields extends StatefulWidget {
  final TextEditingController controller;
  final Function()? onTap;
  final String hintText;

  const FromToFields({
    super.key,
    required this.controller,
    required this.onTap,
    required this.hintText,
  });

  @override
  State<FromToFields> createState() => _FromToFieldsState();
}

class _FromToFieldsState extends State<FromToFields> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      readOnly: true,
      onTap: widget.onTap,
      controller: widget.controller,
      textInputAction: TextInputAction.next,
      decoration: ToFromDecoration(context, widget.hintText),
    );
  }
}
