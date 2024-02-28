import 'package:safar/core/bottomsheet/primary_bottom_sheet.dart';
import 'package:safar/core/colors/app_colors.dart';
import 'package:safar/core/dialogs/dialog_success_failure.dart';
import 'package:safar/gen/assets.gen.dart';
import 'package:safar/ui/bildirgi_page/action/bloc/action_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CommentsOption extends StatefulWidget {
  final List<String> initialList;

  const CommentsOption({
    super.key,
    required TextEditingController titleController,
    required this.initialList,
  }) : _titleController = titleController;

  final TextEditingController _titleController;

  @override
  State<CommentsOption> createState() => _CommentsOptionState();
}

class _CommentsOptionState extends State<CommentsOption> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        SizedBox(
          height: 150.h,
          child: TextFormField(
            maxLines: null,
            expands: true,
            // validator: (username) {
            //   if (username == null || username.isEmpty) {
            //     return 'Please enter comment';
            //   }
            //   return null;
            // },
            textAlignVertical: TextAlignVertical.top,
            controller: widget._titleController,
            textInputAction: TextInputAction.next,
            decoration: InputDecoration(
              filled: true,
              border: InputBorder.none, // Remove border color
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: AppColors.stroke, width: 0.5.w),
                borderRadius: BorderRadius.circular(12),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: AppColors.primary, width: 0.5.w),
                borderRadius: BorderRadius.circular(12),
              ),
              errorBorder: OutlineInputBorder(
                borderSide: BorderSide(color: AppColors.stroke, width: 0.5.w),
                borderRadius: BorderRadius.circular(12),
              ),
              focusedErrorBorder: OutlineInputBorder(
                borderSide: BorderSide(color: AppColors.stroke, width: 0.5.w),
                borderRadius: BorderRadius.circular(12),
              ),
              hintText: 'Comment',
              fillColor: Theme.of(context).colorScheme.surfaceTint,
              hintMaxLines: 1,
              hintStyle: const TextStyle(color: AppColors.textSecondary),
              suffixIcon: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(right: 12.w, top: 20.h),
                    child: GestureDetector(
                      onTap: () async {
                        final result = await PrimaryBottomSheet.show(
                          context,
                          isSearchNeeded: false,
                          heightRatio: 0.5,
                          isConfirmationNeeded: false,
                          title: 'Quick reply',
                          selectedValue: 'Room',
                          initialList: widget.initialList.toList().reversed.toList(),
                        );

                        if (result != null) {
                          if (!mounted) return;

                          context.read<ActionBloc>().comment(widget._titleController.text = result);
                        }
                      },
                      child: Container(
                        alignment: Alignment.topRight,
                        height: 24.h,
                        width: 24.h,
                        child: const Icon(Icons.arrow_drop_down_outlined),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            onChanged: (value) {
              context.read<ActionBloc>().comment(value);
            },
          ),
        ),
        SizedBox(height: 10.h),
        GestureDetector(
          onTap: () {
            var text = widget._titleController.text.trim();
            if (text.isNotEmpty) {
              // context.read<ActionBloc>().postComment(text);
            } else {
              return showMessage('Can`t be empty', isError: true);
            }
          },
          child: Container(
            height: 36.h,
            width: 161.w,
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.inversePrimary,
              borderRadius: BorderRadius.circular(24.r),
            ),
            child: Row(
              children: [
                const Spacer(),
                Assets.icons.staffIcons.additem.svg(),
                SizedBox(width: 8.w),
                Text(
                  'Save as template',
                  style: TextStyle(
                    fontSize: 13.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const Spacer(),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
