import 'package:safar/ui/manage_inquiry_page/widgets/buttons/remove_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CardNumberAndRemove extends StatelessWidget {
  final int index;

  const CardNumberAndRemove({
    super.key,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          '# ${index + 1}',
          style: TextStyle(
            fontSize: 14.sp,
            fontWeight: FontWeight.w700,
          ),
        ),
        RemoveButton(index: index),
      ],
    );
  }
}
