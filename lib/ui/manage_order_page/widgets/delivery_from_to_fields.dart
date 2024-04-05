import 'package:flutter/material.dart';
import '../texts_and_titles/text_form_fields/taxi_from_field.dart';

class FromToFields extends StatefulWidget {
  final TextEditingController titleController;
  final Function()? onTap;

  const FromToFields({
    super.key,
    required this.titleController,
    required this.onTap,
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
      controller: widget.titleController,
      textInputAction: TextInputAction.next,
      decoration: ToFromDecoration(context),
    );
  }
}
