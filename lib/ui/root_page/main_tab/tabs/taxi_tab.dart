import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:safar/core/bloc_progress/bloc_progress.dart';
import 'package:safar/core/colors/app_colors.dart';
import 'package:safar/core/constants/something_went_wrong.dart';
import 'package:safar/core/widgets/tabs_no_data.dart';
import 'package:safar/gen/assets.gen.dart';
import 'package:safar/ui/root_page/bloc/orders_bloc.dart';
import 'package:safar/ui/root_page/widgets/taxi_orders_card.dart';

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
        context.read<OrdersBloc>().getTaxiOrders();
      },
      child: BlocBuilder<OrdersBloc, OrdersState>(
        builder: (context, state) {
          if (state.blocProgress == BlocProgress.IS_LOADING) {
            return Center(
              child: CircularProgressIndicator(
                color: Theme.of(context).colorScheme.primaryContainer,
              ),
            );
          }
          if (state.blocProgress == BlocProgress.FAILED) {
            return const SomethingWentWrong();
          }
          return SingleChildScrollView(
            controller: scrollController,
            physics: const AlwaysScrollableScrollPhysics(),
            child: Padding(
              padding: EdgeInsets.only(bottom: 100.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 20.h),
                  // SearchAndFilterTaxi(
                  //   state: state,
                  //   statusesList: statusesList,
                  //   searchTaxi: searchTaxi,
                  // ),
                  _FilterCards(state, context),
                  // CheckboxesForDriverAndUser(state: state),
                  if (state.taxiOrdersList.results.isNotEmpty)
                    ListView.builder(
                      itemCount: state.taxiOrdersList.results.length,
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                        return TaxiOrdersCard(
                          index: index,
                          model: state.taxiOrdersList.results,
                          child: Assets.icons.carTab.image(),
                        );
                      },
                    ),
                  if (state.taxiOrdersList.results.isEmpty) TabsNoData()
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

class CheckboxesForDriverAndUser extends StatelessWidget {
  final OrdersState state;

  const CheckboxesForDriverAndUser({
    super.key,
    required this.state,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 8.w),
      margin: EdgeInsets.symmetric(vertical: 5.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Показать только:   ',
            style: TextStyle(
              color: AppColors.iconSecondary,
              fontSize: 14.sp,
            ),
          ),
          Row(
            children: [
              Text(
                'Водителей',
                style: TextStyle(fontSize: 14.sp),
              ),
              Checkbox(
                checkColor: AppColors.float,
                fillColor: MaterialStateProperty.resolveWith<Color>(
                  (Set<MaterialState> states) {
                    if (states.contains(MaterialState.selected)) {
                      return AppColors.primary;
                    }
                    return Colors.transparent;
                  },
                ),
                value: state.isDriver,
                onChanged: (value) {
                  context.read<OrdersBloc>().isDriver();
                },
              ),
              Text(
                'Пассажиров',
                style: TextStyle(fontSize: 14.sp),
              ),
              Checkbox(
                checkColor: AppColors.float,
                fillColor: MaterialStateProperty.resolveWith<Color>(
                  (Set<MaterialState> states) {
                    if (states.contains(MaterialState.selected)) {
                      return AppColors.primary;
                    }
                    return Colors.transparent;
                  },
                ),
                value: !state.isDriver,
                onChanged: (value) {
                  context.read<OrdersBloc>().isPassenger();
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
