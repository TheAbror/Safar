import 'package:flutter/material.dart';
import 'package:safar/core/colors/app_colors.dart';
import 'package:safar/core/widgets/search_input.dart';
import 'package:safar/core/widgets/search_settings.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:safar/core/bottomsheet/primary_bottom_sheet.dart';
import 'package:safar/ui/root_page/bloc/orders_bloc.dart';

class SearchAndFilterTaxi extends StatelessWidget {
  final OrdersState state;
  final List<String> statusesList;
  final TextEditingController searchTaxi;

  const SearchAndFilterTaxi({
    super.key,
    required this.state,
    required this.statusesList,
    required this.searchTaxi,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 12.h, right: 8.w, left: 8.w),
      child: SearchInput(
        fillColor: Theme.of(context).colorScheme.onBackground,
        width: 344.w,
        hintText: 'Поиск',
        controller: searchTaxi,
        onChanged: (val) {
          // context.read<InquiryBloc>().searchTaxi(val);
        },
        suffixIcon: SearchSettings(
          color: AppColors.primary,
          onTap: () async {
            // final selectedValue = state.listOfSelectedStatusesCreated.isNotEmpty
            //     ? state.listOfSelectedStatusesCreated.last
            //     : '';
            final result = await PrimaryBottomSheet.show(
              context,
              isSearchNeeded: false,
              isConfirmationNeeded: false,
              heightRatio: 0.7,
              title: 'Поиск',
              selectedValue: 'selectedValue',
              initialList: statusesList,
            );

            if (result != null) {
              if (!context.mounted) return;
              // context.read<InquiryBloc>().changeStatusTaxi(result);
            }
          },
        ),
      ),
    );
  }
}
