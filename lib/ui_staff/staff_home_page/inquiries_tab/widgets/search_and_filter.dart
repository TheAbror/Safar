import 'package:flutter/material.dart';
import 'package:safar/core/colors/app_colors.dart';
import 'package:safar/core/widgets/search_input.dart';
import 'package:safar/core/widgets/search_settings.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:safar/core/bottomsheet/primary_bottom_sheet.dart';
import 'package:safar/ui_staff/staff_home_page/bloc/inquiry_bloc.dart';

class SearchAndFilterAssigned extends StatelessWidget {
  final InquiryState state;
  final List<String> statusesList;
  final TextEditingController searchAssigned;

  const SearchAndFilterAssigned({
    super.key,
    required this.state,
    required this.statusesList,
    required this.searchAssigned,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 12.h, horizontal: 8.w),
      child: SearchInput(
        fillColor: Theme.of(context).colorScheme.onBackground,
        width: 344.w,
        hintText: 'Search',
        suffixIcon: SearchSettings(
          color: state.listOfSelectedStatusesAssigned.isEmpty
              ? AppColors.iconSecondary
              : AppColors.primary,
          onTap: () async {
            final selectedValue = state.listOfSelectedStatusesAssigned.isNotEmpty
                ? state.listOfSelectedStatusesAssigned.last
                : '';

            final result = await PrimaryBottomSheet.show(
              context,
              isSearchNeeded: false,
              isConfirmationNeeded: false,
              heightRatio: 0.7,
              title: 'Filter by status',
              selectedValue: selectedValue,
              initialList: statusesList,
            );

            if (result != null) {
              if (!context.mounted) return;
              context.read<InquiryBloc>().changeStatusAssigned(result);
            }
          },
        ),
        controller: searchAssigned,
        onChanged: (val) {
          context.read<InquiryBloc>().searchAssigned(val);
        },
      ),
    );
  }
}
