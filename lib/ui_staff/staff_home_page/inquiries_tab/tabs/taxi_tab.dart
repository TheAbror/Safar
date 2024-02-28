import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:safar/core/widgets/tabs_no_data.dart';
import 'package:safar/gen/assets.gen.dart';
import 'package:safar/ui_staff/staff_home_page/bloc/orders_bloc.dart';
import 'package:safar/ui_staff/staff_home_page/inquiries_tab/widgets/search_and_filter_taxi.dart';
import 'package:safar/ui_staff/staff_home_page/widgets/inquiry_card.dart';

class TaxiTab extends StatelessWidget {
  final List<String> statusesList;
  final TextEditingController searchTaxi;
  final ScrollController scrollController;

  const TaxiTab({
    super.key,
    required this.statusesList,
    required this.searchTaxi,
    required this.scrollController,
  });

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      color: Theme.of(context).colorScheme.primaryContainer,
      onRefresh: () async {
        // context.read<InquiryBloc>().getInitiallyCreated();
      },
      child: BlocBuilder<OrdersBloc, OrdersState>(
        builder: (context, state) {
          return SingleChildScrollView(
            controller: scrollController,
            physics: const AlwaysScrollableScrollPhysics(),
            child: Padding(
              padding: EdgeInsets.only(bottom: 100.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SearchAndFilterTaxi(
                    state: state,
                    statusesList: statusesList,
                    searchTaxi: searchTaxi,
                  ),
                  _FilterCards(state, context),
                  if (state.orders.results.isNotEmpty)
                    ListView.builder(
                      itemCount: state.orders.results.length,
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                        return InquiryCard(
                          model: state.orders.results,
                          index: index,
                          child: Assets.icons.deliveryIcon.image(),
                        );
                      },
                    ),
                  if (state.orders.results.isEmpty) TabsNoData()
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Padding _FilterCards(OrdersState state, BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 8.w),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: const [
            // for (var status in state.listOfSelectedStatusesCreated)
            //   FilterCard(
            //     text: status,
            //     onTap: () => context.read<InquiryBloc>().changeStatusTaxi(status),
            //   ),
          ],
        ),
      ),
    );
  }
}
