import 'package:flutter/material.dart';
import 'package:safar/core/colors/app_colors.dart';
import 'package:safar/core/widgets/search_input.dart';
import 'package:safar/core/widgets/search_settings.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:safar/core/bottomsheet/primary_bottom_sheet.dart';
import 'package:safar/ui/home_page/bloc/orders_bloc.dart';

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
      margin: EdgeInsets.symmetric(vertical: 12.h, horizontal: 8.w),
      child: SearchInput(
        fillColor: Theme.of(context).colorScheme.onBackground,
        width: 344.w,
        hintText: 'Поиск',
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
              title: 'Filter by status',
              selectedValue: 'selectedValue',
              initialList: statusesList,
            );

            if (result != null) {
              if (!context.mounted) return;
              // context.read<InquiryBloc>().changeStatusTaxi(result);
            }
          },
        ),
        controller: searchTaxi,
        onChanged: (val) {
          // context.read<InquiryBloc>().searchTaxi(val);
        },
      ),
    );
  }
}
