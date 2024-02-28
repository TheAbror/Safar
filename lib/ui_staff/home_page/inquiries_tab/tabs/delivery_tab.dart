import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:safar/core/bloc_progress/bloc_progress.dart';
import 'package:safar/core/colors/app_colors.dart';
import 'package:safar/core/constants/something_went_wrong.dart';
import 'package:safar/core/widgets/tabs_no_data.dart';
import 'package:safar/gen/assets.gen.dart';
import 'package:safar/ui_staff/home_page/bloc/orders_bloc.dart';
import 'package:safar/ui_staff/home_page/widgets/orders_card.dart';

import '../widgets/search_and_filter_delivery.dart';

class DeliveryTab extends StatelessWidget {
  final List<String> statusesList;
  final TextEditingController searchDelivery;
  final ScrollController scrollController;

  const DeliveryTab({
    super.key,
    required this.statusesList,
    required this.searchDelivery,
    required this.scrollController,
  });

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      color: Theme.of(context).colorScheme.primaryContainer,
      onRefresh: () async {
        context.read<OrdersBloc>().getInitiallyAssigned();
      },
      child: BlocBuilder<OrdersBloc, OrdersState>(
        builder: (context, state) {
          if (state.blocProgress == BlocProgress.IS_LOADING) {
            return const Center(
              child: CircularProgressIndicator(color: AppColors.primary),
            );
          }
          if (state.blocProgress == BlocProgress.FAILED) {
            return SomethingWentWrong();
          }
          return SingleChildScrollView(
            controller: scrollController,
            physics: const AlwaysScrollableScrollPhysics(),
            child: Padding(
              padding: EdgeInsets.only(bottom: 100.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SearchAndFilterDelivery(
                    state: state,
                    statusesList: statusesList,
                    searchDelivery: searchDelivery,
                  ),
                  _FilterCards(state, context),
                  if (state.orders.results.isNotEmpty)
                    ListView.builder(
                      itemCount: state.orders.results.length,
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                        return OrdersCard(
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
            // for (var status in state.listOfSelectedStatusesAssigned)
            //   FilterCard(
            //     text: status,
            //     onTap: () => context.read<InquiryBloc>().changeStatusDelivery(status),
            //   ),
          ],
        ),
      ),
    );
  }
}
