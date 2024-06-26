import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:safar/core/widgets/search_input.dart';
import 'package:safar/ui/root_page/bloc/orders_bloc.dart';

class SearchAndFilterDelivery extends StatelessWidget {
  final OrdersState state;
  final List<String> statusesList;
  final TextEditingController searchDelivery;

  const SearchAndFilterDelivery({
    super.key,
    required this.state,
    required this.statusesList,
    required this.searchDelivery,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 12.h, horizontal: 8.w),
      child: SearchInput(
        fillColor: Theme.of(context).colorScheme.onBackground,
        width: 344.w,
        hintText: 'Поиск',
        // suffixIcon: SearchSettings(
        //   color: AppColors.primary,
        //   onTap: () async {
        //     // final selectedValue = state.listOfSelectedStatusesAssigned.isNotEmpty
        //     //     ? state.listOfSelectedStatusesAssigned.last
        //     //     : '';

        //     final result = await PrimaryBottomSheet.show(
        //       context,
        //       isSearchNeeded: false,
        //       isConfirmationNeeded: false,
        //       heightRatio: 0.7,
        //       title: 'Поиск',
        //       selectedValue: 'selectedValue',
        //       initialList: statusesList,
        //     );

        //     if (result != null) {
        //       if (!context.mounted) return;
        //       // context.read<InquiryBloc>().changeStatusDelivery(result);
        //     }
        //   },
        // ),
        controller: searchDelivery,
        onChanged: (val) {
          // context.read<InquiryBloc>().searchDelivery(val);
        },
      ),
    );
  }
}
