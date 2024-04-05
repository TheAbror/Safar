import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:safar/ui/manage_order_page/widgets/from_to_fields.dart';

class CommentsForDrier extends StatelessWidget {
  final Function(String)? onChanged;
  final TextEditingController commentsController;

  const CommentsForDrier({
    super.key,
    required this.onChanged,
    required this.commentsController,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 130.h,
      child: TextFormField(
        expands: true,
        minLines: null,
        maxLines: null,
        textAlignVertical: TextAlignVertical.top,
        onChanged: onChanged,
        controller: commentsController,
        textInputAction: TextInputAction.next,
        decoration: ToFromDecoration(context, 'Комментарии для водителя', false),
      ),
    );
  }
}
