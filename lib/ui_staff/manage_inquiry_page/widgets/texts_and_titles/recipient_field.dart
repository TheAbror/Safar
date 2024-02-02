import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:safar/ui_staff/manage_inquiry_page/bloc/manage_inquiry_bloc.dart';
import 'package:safar/ui_staff/manage_inquiry_page/widgets/texts_and_titles/recepient_bottomSheet.dart';
import 'package:safar/ui_staff/manage_inquiry_page/widgets/texts_and_titles/text_form_fields/recepient_decoration.dart';

class RecipientField extends StatefulWidget {
  final TextEditingController recipientController;

  const RecipientField({
    super.key,
    required this.recipientController,
  });

  @override
  State<RecipientField> createState() => _RecipientFieldState();
}

class _RecipientFieldState extends State<RecipientField> {
  @override
  Widget build(BuildContext context) {
    final state = context.read<ManageInquiryBloc>().state;
    return TextFormField(
      onTap: () async {
        final dynamic result = await RecepientBottomSheet.show(
          context,
          isSearchNeeded: true,
          heightRatio: 0.9,
          title: 'Recepient',
          isConfirmationNeeded: false,
          selectedStaffIDs: [state.recipientID],
          initialList: [],
        );

        if (result != null) {
          if (!mounted) return;

          if (result is String) {
            print(result);
            var involvedUsersText = '';
            involvedUsersText = result;
            widget.recipientController.text = involvedUsersText;

            if (result == 'Rector') {
              involvedUsersText = 'RECTOR';
            } else {
              involvedUsersText = 'PURCHASES_COMMISSION';
            }
            context.read<ManageInquiryBloc>().updateData(recipientGroup: involvedUsersText);
          } else {
            var involvedUsersText = '';
            involvedUsersText = '${result.firstname} ${result.lastname}';
            widget.recipientController.text = involvedUsersText;

            context.read<ManageInquiryBloc>().updateData(
                  recipientID: result.id,
                  recipientName: involvedUsersText,
                );

            print(result.id);
          }
        }
      },
      readOnly: true,
      controller: widget.recipientController,
      textInputAction: TextInputAction.next,
      decoration: RecepientDecoration(context),
    );
  }
}
