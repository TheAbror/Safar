import 'package:safar/ui/home_page/bloc/orders_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:safar/ui/manage_order_page/widgets/from_to_fields.dart';

class CommentsForDrier extends StatelessWidget {
  final TextEditingController commentsController;

  const CommentsForDrier({
    super.key,
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
        onChanged: (value) {
          context.read<OrdersBloc>().updateData(commentsForDriver: value);
          print(value);
        },
        controller: commentsController,
        textInputAction: TextInputAction.next,
        decoration: ToFromDecoration(context, 'Комментарии для водителя', false),
      ),
    );
  }
}
