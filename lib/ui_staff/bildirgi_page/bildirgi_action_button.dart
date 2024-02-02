import 'package:safar/core/bottomsheet/primary_bottom_sheet.dart';
import 'package:safar/core/buttons/action_button.dart';
import 'package:safar/ui_staff/manage_inquiry_page/bloc/manage_inquiry_bloc.dart';
import 'package:safar/ui_staff/staff_home_page/model/inquiry_list_model.dart';
import 'package:safar/ui_staff/widgets/bottom_sheets/action_bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
// ignore_for_file: use_build_context_synchronously

class BildirgiActionButton extends StatelessWidget {
  final List<InquiryActionButtons> buttons;
  final int id;

  const BildirgiActionButton({
    super.key,
    required this.buttons,
    required this.id,
  });

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
              initialList: buttons.map((e) => e.title).toList(),
              // buttons.first.title??[]
            );
            if (status != null) {
              final statusList = buttons.where((element) => element.title == status).toList();

              if (statusList.isNotEmpty) {
                final statusType = statusList.first.type;
                final statusTitle = statusList.first.title;

                final bool? result = await ActionBottomSheet.show(
                  context,
                  isSearchNeeded: false,
                  heightRatio: 0.65,
                  isConfirmationNeeded: false,
                  title: statusTitle,
                  selectedValue: 'Room',
                  initialList: [],
                  id: id,
                  status: statusType,
                );

                if (result != null && result) {
                  context.read<ManageInquiryBloc>().getInquiryById(id);
                }
              }
            }
          },
        ),
      ),
    );
  }
}
