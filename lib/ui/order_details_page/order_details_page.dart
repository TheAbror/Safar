import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:safar/core/bloc_progress/bloc_progress.dart';
import 'package:safar/core/bottomsheet/primary_bottom_sheet.dart';
import 'package:safar/core/bottomsheet/primary_loader.dart';
import 'package:safar/core/constants/something_went_wrong.dart';
import 'package:safar/core/dialogs/dialog_success_failure.dart';
import 'package:safar/core/routes/route_constants.dart';
import 'package:safar/gen/assets.gen.dart';
import 'package:safar/ui/home_page/bloc/orders_bloc.dart';
import 'package:safar/ui/manage_order_page/manage_taxi_orders_page.dart';
import 'package:safar/ui/manage_order_page/widgets/app_bar/inqury_appbar.dart';
import 'package:safar/ui/order_details_page/modalPopups/delete_dialog.dart';
import 'package:safar/ui/signin_page/auth/models/all_models.dart';

class OrderDetailsPageViewModel {
  final int index;
  final List<OrdersResponse> model;

  const OrderDetailsPageViewModel({
    Key? key,
    required this.model,
    this.index = 0,
  });
}

class OrderDetailsPage extends StatefulWidget {
  final OrderDetailsPageViewModel viewModel;

  const OrderDetailsPage({
    super.key,
    required this.viewModel,
  });

  @override
  State<OrderDetailsPage> createState() => _OrderDetailsPageState();
}

class _OrderDetailsPageState extends State<OrderDetailsPage> {
  @override
  void initState() {
    super.initState();
    context.read<OrdersBloc>().getOrderById(widget.viewModel.model[widget.viewModel.index].id);
  }

  @override
  Widget build(BuildContext context) {
    return _Body(
      model: widget.viewModel.model[widget.viewModel.index],
      index: widget.viewModel.index,
    );
  }
}

class _Body extends StatefulWidget {
  final int index;
  final OrdersResponse model;

  const _Body({
    required this.model,
    required this.index,
  });

  @override
  State<_Body> createState() => _BodyState();
}

class _BodyState extends State<_Body> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.inverseSurface,
      appBar: order_appbar(
          context,
          widget.model.pickup,
          widget.model.createdAt == true
              ? GestureDetector(
                  onTap: () async {
                    final result = await PrimaryBottomSheet.show(
                      context,
                      title: 'Choose Action',
                      isConfirmationNeeded: false,
                      isSearchNeeded: false,
                      heightRatio: 0.30,
                      selectedValue: '',
                      initialList: ['Edit', 'Delete'],
                    );

                    if (result != null) {
                      if (!mounted) return;

                      result.toLowerCase() == 'edit'
                          ? Navigator.of(context).pushNamed(AppRoutes.manageTaxiOrder,
                              arguments:
                                  ManageTaxiOrdersPageViewModel(id: widget.model.id, isEdit: true))
                          : delete_dialog(context).then((value) {
                              if (value) {
                                // context
                                //     .read<ManageOrderBloc>()
                                //     .deleteInquiryById(widget.model.id);
                                // Navigator.pop(context);
                              } else if (value == false) {}
                            });
                    }
                  },
                  child: Assets.icons.staffIcons.edit.svg(
                    height: 24.h,
                    width: 24.h,
                  ),
                )
              : const SizedBox()),
      body: BlocConsumer<OrdersBloc, OrdersState>(
        listener: (context, state) {
          if (state.blocProgress == BlocProgress.IS_SUCCESS) {
            //
            // context.read<InquiryBloc>().getInitiallyCreated();

            Navigator.pushNamed(context, AppRoutes.homePage);

            showMessage('Inquiry was successfully deleted');
          }
        },
        builder: (context, state) {
          if (state.blocProgress == BlocProgress.IS_LOADING) {
            return const PrimaryLoader();
          }

          if (state.blocProgress == BlocProgress.FAILED) {
            return const SomethingWentWrong();
          }

          return Stack(
            children: [
              RefreshIndicator(
                onRefresh: () async {
                  // context.read<ManageOrderBloc>().getInquiryById(state.item.id);
                },
                child: ListView(
                  physics: const AlwaysScrollableScrollPhysics(),
                  children: [
                    Container(
                      padding: EdgeInsets.all(10.w),
                      margin: EdgeInsets.only(right: 8.w, left: 8.w, bottom: 2.h, top: 8.h),
                      decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.outline,
                        borderRadius: BorderRadius.circular(16.r),
                      ),
                      child: ListView(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        children: [
                          SizedBox(height: 8.h),
                          Text(
                            widget.model.pickup,
                            style: TextStyle(
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          SizedBox(height: 4.h),
                          Text(
                            widget.model.destination,
                            style: TextStyle(
                              height: 1.4.h,
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          SizedBox(height: 18.h),
                          // ListView.builder(
                          //   padding: EdgeInsets.zero,
                          //   itemCount: state.item.items.length,
                          //   shrinkWrap: true,
                          //   physics: const NeverScrollableScrollPhysics(),
                          //   itemBuilder: (context, index) {
                          //     final item = state.item.items[index];

                          //     return Container(
                          //       margin: EdgeInsets.only(bottom: 10.h),
                          //       padding: EdgeInsets.all(12.w),
                          //       decoration: BoxDecoration(
                          //         color: Theme.of(context).colorScheme.background,
                          //         border: Border.all(
                          //           color: Theme.of(context).colorScheme.inversePrimary,
                          //           width: 0.5.w,
                          //         ),
                          //         borderRadius: BorderRadius.circular(8.r),
                          //       ),
                          //       child: Column(
                          //         crossAxisAlignment: CrossAxisAlignment.start,
                          //         children: [
                          //           Text(
                          //             'Name ',
                          //             style: TextStyle(
                          //               fontSize: 11.sp,
                          //               fontWeight: FontWeight.w500,
                          //             ),
                          //           ),
                          //           Text(
                          //             item.name,
                          //             style: TextStyle(
                          //               fontSize: 14.sp,
                          //               fontWeight: FontWeight.w700,
                          //             ),
                          //           ),
                          //           SizedBox(height: 8.h),
                          //           Row(
                          //             children: [
                          //               SizedBox(
                          //                 width: 94.w,
                          //                 child: Column(
                          //                   crossAxisAlignment: CrossAxisAlignment.start,
                          //                   children: [
                          //                     Text(
                          //                       'Amount',
                          //                       style: TextStyle(
                          //                         fontSize: 11.sp,
                          //                         fontWeight: FontWeight.w500,
                          //                       ),
                          //                     ),
                          //                     SizedBox(height: 4.h),
                          //                     Text(
                          //                       (item.quantity).toString(),
                          //                       style: TextStyle(
                          //                         fontSize: 12.sp,
                          //                         fontWeight: FontWeight.w500,
                          //                       ),
                          //                     ),
                          //                   ],
                          //                 ),
                          //               ),
                          //               SizedBox(width: 8.w),
                          //               SizedBox(
                          //                 width: 94.w,
                          //                 child: Column(
                          //                   crossAxisAlignment: CrossAxisAlignment.start,
                          //                   children: [
                          //                     Text(
                          //                       'Unit',
                          //                       style: TextStyle(
                          //                         fontSize: 11.sp,
                          //                         fontWeight: FontWeight.w500,
                          //                       ),
                          //                     ),
                          //                     Text(
                          //                       item.measurement?.label ?? '',
                          //                       style: TextStyle(
                          //                         fontSize: 12.sp,
                          //                         fontWeight: FontWeight.w500,
                          //                       ),
                          //                     ),
                          //                   ],
                          //                 ),
                          //               ),
                          //               SizedBox(width: 8.w),
                          //             ],
                          //           ),
                          //         ],
                          //       ),
                          //     );
                          //   },
                          // ),
                          SizedBox(height: 10.h),
                        ],
                      ),
                    ),
                    //
                    Container(
                      margin: EdgeInsets.only(right: 8.w, left: 8.w, bottom: 24.h),
                      padding: EdgeInsets.all(10.w),
                      decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.outline,
                        borderRadius: BorderRadius.circular(16.r),
                      ),
                      child: ListView(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        children: [
                          Text(
                            'Change log',
                            style: TextStyle(
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          SizedBox(height: 16.h),
                          // ListView.builder(
                          //   itemCount: state.item.history.length,
                          //   shrinkWrap: true,
                          //   physics: const NeverScrollableScrollPhysics(),
                          //   itemBuilder: (context, index) {
                          //     final currentItem = state.item.history[index];
                          //     return ChangeLogItem(item: currentItem);
                          //   },
                          // ),
                        ],
                      ),
                    ),
                    SizedBox(height: 40.h)
                  ],
                ),
              ),
              // if (state.item.buttons.isNotEmpty)
              //   OrdersActionButton(
              //     id: state.item.id,
              //     buttons: state.item.buttons,
              //   ),
            ],
          );
        },
      ),
    );
  }
}
