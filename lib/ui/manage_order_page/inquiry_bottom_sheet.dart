import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:safar/core/bottomsheet/default_bottom_sheet.dart';
import 'package:safar/core/bottomsheet/bloc/bottom_sheet_data_bloc.dart';
import 'package:safar/core/bottomsheet/widgets/bottomsheet_top_radius.dart';

class OrdersBottomSheet extends StatelessWidget {
  final String title;
  // final MeasurementResponse selectedValue;
  // final List<MeasurementResponse> initialList;
  final bool isSearchNeeded;
  final bool? isConfirmationNeeded;
  final double heightRatio;

  const OrdersBottomSheet({
    super.key,
    required this.title,
    // required this.selectedValue,
    // required this.initialList,
    required this.isSearchNeeded,
    required this.heightRatio,
    required this.isConfirmationNeeded,
  });

  static Future<String?> show(
    BuildContext parentContext, {
    required String title,
    required bool isConfirmationNeeded,
    required bool isSearchNeeded,
    required double heightRatio,
    // required MeasurementResponse selectedValue,
    // required List<MeasurementResponse> initialList,
  }) async {
    return showModalBottomSheet<String>(
      backgroundColor: Theme.of(parentContext).colorScheme.onSurface,
      context: parentContext,
      useSafeArea: true,
      shape: BottomSheetRadius(),
      isScrollControlled: true,
      builder: (context) {
        return BlocProvider(
          create: (context) => BottomSheetDataBloc(
            initialValue: '',
            initialList: [],
          ),
          child: OrdersBottomSheet(
            title: title,
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
              ],
            ),
          ),
        );
      },
    );
  }
}
