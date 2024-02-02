import 'package:safar/core/bottomsheet/bloc/bottom_sheet_data_bloc.dart';
import 'package:safar/core/bottomsheet/default_bottom_sheet.dart';
import 'package:safar/core/bottomsheet/widgets/bottomsheet_top_radius.dart';
import 'package:safar/core/colors/app_colors.dart';
import 'package:safar/ui_staff/manage_inquiry_page/model/inquiry_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class InquiryBottomSheet extends StatelessWidget {
  final String title;
  final MeasurementResponse selectedValue;
  final List<MeasurementResponse> initialList;
  final bool isSearchNeeded;
  final bool? isConfirmationNeeded;
  final double heightRatio;

  const InquiryBottomSheet({
    super.key,
    required this.title,
    required this.selectedValue,
    required this.initialList,
    required this.isSearchNeeded,
    required this.heightRatio,
    required this.isConfirmationNeeded,
  });

  static Future<MeasurementResponse?> show(
    BuildContext parentContext, {
    required String title,
    required bool isConfirmationNeeded,
    required bool isSearchNeeded,
    required double heightRatio,
    required MeasurementResponse selectedValue,
    required List<MeasurementResponse> initialList,
  }) async {
    return showModalBottomSheet<MeasurementResponse>(
      backgroundColor: Theme.of(parentContext).colorScheme.onSurface,
      context: parentContext,
      useSafeArea: true,
      shape: BottomSheetRadius(),
      isScrollControlled: true,
      builder: (context) {
        return BlocProvider(
          create: (context) => BottomSheetDataBloc(
            initialValue: selectedValue.label,
            initialList: initialList.map((e) => e.label).toList(),
          ),
          child: InquiryBottomSheet(
            title: title,
            selectedValue: selectedValue,
            initialList: initialList,
            isSearchNeeded: isSearchNeeded,
            isConfirmationNeeded: isConfirmationNeeded,
            heightRatio: heightRatio,
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BottomSheetDataBloc, BottomSheetDataState>(
      builder: (context, state) {
        return DefaultBottomSheet(
          title: title,
          heightRatio: heightRatio,
          isActionAvailable: false,
          action: () {},
          child: SingleChildScrollView(
            child: Column(
              children: [
                Divider(
                  color: Theme.of(context).colorScheme.onSurfaceVariant,
                  height: 1.h,
                  thickness: 1.h,
                ),
                ListView.builder(
                  shrinkWrap: true,
                  itemCount: initialList.length,
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        ListTile(
                          contentPadding: EdgeInsets.zero,
                          title: Padding(
                            padding: EdgeInsets.only(left: 16.w),
                            child: Text(initialList[index].label),
                          ),
                          trailing: Padding(
                            padding: EdgeInsets.only(right: 16.w),
                            child: const Icon(Icons.circle_outlined),
                          ),
                          hoverColor: AppColors.textMain,
                          enabled: true,
                          onTap: () {
                            final selectedMeasurement = initialList[index];

                            Navigator.pop(context, selectedMeasurement);
                          },
                        ),
                        Divider(
                          color: Theme.of(context).colorScheme.onSurfaceVariant,
                          height: 1.h,
                          thickness: 1.h,
                        ),
                      ],
                    );
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
