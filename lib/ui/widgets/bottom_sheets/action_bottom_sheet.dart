// ignore_for_file: unused_field, unused_local_variable

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:safar/core/bloc_progress/bloc_progress.dart';
import 'package:safar/core/bottomsheet/default_bottom_sheet.dart';
import 'package:safar/core/bottomsheet/primary_loader.dart';
import 'package:safar/core/bottomsheet/widgets/bottomsheet_top_radius.dart';
import 'package:safar/core/colors/app_colors.dart';
import 'package:safar/core/dialogs/dialog_success_failure.dart';
import 'package:safar/ui/order_details_page/action/bloc/action_bloc.dart';
import 'package:safar/ui/order_details_page/action/options/comments_option.dart';
import 'package:safar/ui/order_details_page/action/options/date_option.dart';
import 'package:safar/ui/order_details_page/action/widgets/choose_date_box.dart';
import 'package:safar/ui/widgets/bottom_sheets/bottom_sheet_decoration.dart';

class ActionBottomSheet extends StatefulWidget {
  final String title;
  final bool isSearchNeeded;
  final bool? isConfirmationNeeded;
  final double heightRatio;
  final int id;
  final String status;

  const ActionBottomSheet({
    super.key,
    required this.title,
    required this.isSearchNeeded,
    required this.heightRatio,
    required this.id,
    required this.status,
    this.isConfirmationNeeded,
  });

  static Future<bool?> show(
    BuildContext parentContext, {
    required String title,
    required bool isConfirmationNeeded,
    required bool isSearchNeeded,
    required double heightRatio,
    required String selectedValue,
    required List<String> initialList,
    required int id,
    required String status,
  }) async {
    return showModalBottomSheet<bool>(
      backgroundColor: Theme.of(parentContext).colorScheme.onSurface,
      context: parentContext,
      useSafeArea: true,
      shape: BottomSheetRadius(),
      isScrollControlled: true,
      builder: (context) {
        return BlocProvider(
          create: (context) => ActionBloc()
          // ..getCommentsList()
          ,
          child: ActionBottomSheet(
            title: title,
            isSearchNeeded: isSearchNeeded,
            isConfirmationNeeded: isConfirmationNeeded,
            heightRatio: heightRatio,
            id: id,
            status: status,
          ),
        );
      },
    );
  }

  @override
  State<ActionBottomSheet> createState() => _ActionBottomSheetState();
}

class _ActionBottomSheetState extends State<ActionBottomSheet> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _titleController = TextEditingController();

  final TextEditingController _involvedUsersController = TextEditingController();

  final TextEditingController _involvedInspectorsController = TextEditingController();

  final TextEditingController _dateController = TextEditingController();

  final _dateFormatter = DateFormat('dd-MM-yyyy, HH:mm');

  FocusNode focus1 = FocusNode();

  FocusNode focus2 = FocusNode();

  FocusNode focus3 = FocusNode();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ActionBloc, ActionState>(
      listener: (context, state) {
        if (state.blocProgress == BlocProgress.IS_SUCCESS) {
          showMessage('Inquiry successfully updated');
          Navigator.pop(context, true);
        } else if (state.isCommentSuccessfullyCreated) {
          showMessage('Comment template is successfully created!');
          context.read<ActionBloc>().clear();
        } else if (state.blocProgress == BlocProgress.FAILED) {
          showMessage('Error happened', isError: true);
          context.read<ActionBloc>().clear();
        }
      },
      builder: (context, state) {
        return SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Builder(builder: (context) {
            return DefaultBottomSheet(
              title: widget.title,
              heightRatio: widget.heightRatio,
              actionText: ' Confirm',
              isActionEnabled: true,
              isConfirmationNeeded: true,
              action: () {
                if (widget.status.toLowerCase() == 'meeting' ||
                    widget.status.toLowerCase() == 'assigned') {
                  //Validation
                  if (_formKey.currentState!.validate()) {
                    // context.read<ActionBloc>().postInquiry(
                    //       widget.id,
                    //       widget.status,
                    //     );
                  }
                } else {
                  // context.read<ActionBloc>().postInquiry(widget.id, widget.status);
                }
              },
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    BlocBuilder<ActionBloc, ActionState>(
                      builder: (context, state) {
                        var statusExceptions =
                            widget.status != 'UPDATE_REQUIRED' && widget.status != 'DECLINED';
                        var assignedViewer = widget.status != 'ASSIGNED_VIEWER';
                        var approveForDirectorOnly = widget.status == 'APPROVED';

                        bool isStatusDirector = false;

                        // final accountType = PreferencesServices.getAccountType();

                        // if (accountType == AccountType.superAdmin ||
                        //     accountType == AccountType.director) {
                        //   isStatusDirector = true;
                        // }

                        if (state.blocProgress == BlocProgress.IS_LOADING) {
                          return const Expanded(child: Center(child: PrimaryLoader()));
                        }
                        return Column(
                          children: [
                            Divider(color: AppColors.stroke, height: 0.h, thickness: 1.h),
                            Container(
                              padding: EdgeInsets.all(10.w),
                              margin: EdgeInsets.only(right: 8.w, left: 8.w, bottom: 2.h),
                              decoration: ActionBottomDecoration(context),
                              child: Column(
                                children: [
                                  // approveForDirectorOnly
                                  //     ?
                                  // isStatusDirector
                                  //     ? SizedBox(height: 10.h)
                                  //     : const SizedBox()
                                  // SizedBox()
                                  statusExceptions ? SizedBox(height: 10.h) : const SizedBox(),
                                  statusExceptions
                                      ? assignedViewer
                                          ? DateOption(
                                              dateController: _dateController,
                                              status: widget.status,
                                            )
                                          : const SizedBox()
                                      : const SizedBox(),
                                  statusExceptions ? SizedBox(height: 10.h) : const SizedBox(),
                                  statusExceptions
                                      ? assignedViewer
                                          ? dateSelectionByLabel(context)
                                          : const SizedBox()
                                      : const SizedBox(),
                                  statusExceptions ? SizedBox(height: 20.h) : const SizedBox(),
                                  assignedViewer
                                      ? CommentsOption(
                                          titleController: _titleController,
                                          initialList: const [],
                                        )
                                      : const SizedBox(),
                                ],
                              ),
                            ),
                          ],
                        );
                      },
                    ),
                    const Spacer(),
                  ],
                ),
              ),
            );
          }),
        );
      },
    );
  }

  Row dateSelectionByLabel(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        ChooseDate(
          text: 'Today',
          textColor: focus1.hasFocus
              ? Theme.of(context).colorScheme.onSurface
              : Theme.of(context).colorScheme.tertiary,
          backgroundColor:
              focus1.hasFocus ? AppColors.primary : Theme.of(context).colorScheme.inverseSurface,
          onTap: () {
            FocusScope.of(context).requestFocus(focus1);

            final today = DateTime.now();
            final finalDate = DateTime(today.year, today.month, today.day, 15, 0);

            // context
            //     .read<ActionBloc>()
            //     .meetingDate(_dateController.text = finalDate.toUtc().toIso8601String());

            _dateController.text = _dateFormatter.format(finalDate);
          },
        ),
        ChooseDate(
          textColor: focus2.hasFocus
              ? Theme.of(context).colorScheme.onSurface
              : Theme.of(context).colorScheme.tertiary,
          backgroundColor:
              focus2.hasFocus ? AppColors.primary : Theme.of(context).colorScheme.inverseSurface,
          text: 'Tomorrow',
          onTap: () {
            FocusScope.of(context).requestFocus(focus2);

            final tomorrow = DateTime.now().add(const Duration(days: 1));
            final finalDate = DateTime(tomorrow.year, tomorrow.month, tomorrow.day, 15, 0);

            // context
            //     .read<ActionBloc>()
            //     .meetingDate(_dateController.text = finalDate.toUtc().toIso8601String());
            _dateController.text = _dateFormatter.format(finalDate);
          },
        ),
        ChooseDate(
          textColor: focus3.hasFocus
              ? Theme.of(context).colorScheme.onSurface
              : Theme.of(context).colorScheme.tertiary,
          backgroundColor:
              focus3.hasFocus ? AppColors.primary : Theme.of(context).colorScheme.inverseSurface,
          text: 'Next week',
          onTap: () {
            FocusScope.of(context).requestFocus(focus3);

            final nextWeek = DateTime.now().add(const Duration(days: 7));
            final finalDate = DateTime(nextWeek.year, nextWeek.month, nextWeek.day, 15, 0);

            // context
            //     .read<ActionBloc>()
            //     .meetingDate(_dateController.text = finalDate.toUtc().toIso8601String());
            _dateController.text = _dateFormatter.format(finalDate);
          },
        ),
      ],
    );
  }
}
