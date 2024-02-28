import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:safar/core/bottomsheet/primary_bottom_sheet.dart';
import 'package:safar/core/buttons/action_button.dart';
import 'package:safar/ui/home_page/model/inquiry_list_model.dart';
import 'package:safar/ui/widgets/bottom_sheets/action_bottom_sheet.dart';

class OrdersActionButton extends StatefulWidget {
  final List<InquiryActionButtons> buttons;
  final int id;

  const OrdersActionButton({
    super.key,
    required this.buttons,
    required this.id,
  });

  @override
  State<OrdersActionButton> createState() => _OrdersActionButtonState();
}

class _OrdersActionButtonState extends State<OrdersActionButton> {
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomLeft,
      child: Container(
        margin: EdgeInsets.only(
          right: 8.w,
          left: 8.w,
          top: 12.h,
          bottom: 48.h,
        ),
        child: ActionButton(
          text: 'Action',
          onPressed: () async {
            final status = await PrimaryBottomSheet.show(
              context,
              isSearchNeeded: false,
              heightRatio: 0.5,
              isConfirmationNeeded: false,
              title: 'Filter by status',
              selectedValue: '',
              initialList: widget.buttons.map((e) => e.title).toList(),
            );
            if (status != null) {
              final statusList =
                  widget.buttons.where((element) => element.title == status).toList();

              if (statusList.isNotEmpty) {
                final statusType = statusList.first.type;
                final statusTitle = statusList.first.title;

                if (!mounted) return;

                final bool? result = await ActionBottomSheet.show(
                  context,
                  isSearchNeeded: false,
                  heightRatio: 0.65,
                  isConfirmationNeeded: false,
                  title: statusTitle,
                  selectedValue: 'Room',
                  initialList: [],
                  id: widget.id,
                  status: statusType,
                );

                if (result != null && result) {
                  // context.read<ManageInquiryBloc>().getInquiryById(id);
                }
              }
            }
          },
        ),
      ),
    );
  }
}
