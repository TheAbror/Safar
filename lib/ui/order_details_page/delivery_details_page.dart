import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:safar/core/bloc_progress/bloc_progress.dart';
import 'package:safar/core/bottomsheet/primary_loader.dart';
import 'package:safar/core/constants/something_went_wrong.dart';
import 'package:safar/core/dialogs/dialog_success_failure.dart';
import 'package:safar/core/routes/route_constants.dart';
import 'package:safar/core/utils/all_models/all_models.dart';
import 'package:safar/core/widgets/order_edit_or_delete_dialog.dart';
import 'package:safar/gen/assets.gen.dart';
import 'package:safar/ui/manage_order_page/widgets/inqury_appbar.dart';
import 'package:safar/ui/order_details_page/widgets/taxi_order_description_and_value.dart';
import 'package:safar/ui/root_page/bloc/orders_bloc.dart';

import '../manage_order_page/delivery/manage_delievry_orders_page.dart';

class DeliveryDetailsPageViewModel {
  final int index;
  final List<DeliveryOrdersResponse> model;

  const DeliveryDetailsPageViewModel({
    Key? key,
    required this.model,
    this.index = 0,
  });
}

class DeliveryDetailsPage extends StatefulWidget {
  final DeliveryDetailsPageViewModel viewModel;

  const DeliveryDetailsPage({
    super.key,
    required this.viewModel,
  });

  @override
  State<DeliveryDetailsPage> createState() => _DeliveryDetailsPageState();
}

class _DeliveryDetailsPageState extends State<DeliveryDetailsPage> {
  @override
  void initState() {
    super.initState();
    context
        .read<OrdersBloc>()
        .getDeliveryOrderById(widget.viewModel.model[widget.viewModel.index].id);
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
  final DeliveryOrdersResponse model;

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
          widget.model.createdByThisUser
              ? GestureDetector(
                  onTap: () async {
                    order_edit_or_delete_dialog(context).then((value) {
                      if (value != null) {
                        if (value) {
                          context.read<OrdersBloc>().deleteDeliveryOrderById(widget.model.id);
                        } else if (!value) {
                          Navigator.of(context).pushNamed(
                            AppRoutes.manageDeliveryOrder,
                            arguments: ManagDeliveryOrdersPageViewModel(
                              id: widget.model.id,
                              isEdit: true,
                            ),
                          );
                        }
                      }
                    });
                  },
                  child: Assets.icons.staffIcons.edit.svg(
                    height: 24.h,
                    width: 24.h,
                  ),
                )
              : SizedBox()),
      body: BlocConsumer<OrdersBloc, OrdersState>(
        listener: (context, state) {
          if (state.blocProgress == BlocProgress.IS_SUCCESS && state.isDeliveryOrderDeleted) {
            Navigator.pushNamed(context, AppRoutes.rootPage);

            showMessage('Удалено');

            context.read<OrdersBloc>().makeDeletedFalse();
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
                          SizedBox(height: 4.h),
                          TaxiOrderDescriptionAndValue(
                            description: 'Из: ',
                            value: widget.model.pickup,
                            fonsize: 18,
                          ),
                          TaxiOrderDescriptionAndValue(
                            description: 'В: ',
                            value: widget.model.destination,
                            fonsize: 18,
                          ),
                          TaxiOrderDescriptionAndValue(
                            description: 'Дата отправления: ',
                            value: DateFormat('dd-MM-yyyy, HH:mm')
                                .format(DateTime.parse(widget.model.desiredPickupTime)),
                          ),
                          TaxiOrderDescriptionAndValue(
                            description: 'Предложенная сумма: ',
                            value: widget.model.offeredPrice,
                          ),
                          TaxiOrderDescriptionAndValue(
                            description: 'Комментарии для водителя: ',
                            value: widget.model.commentForDriver,
                          ),
                          TaxiOrderDescriptionAndValue(
                            description: 'Место встречи: ',
                            value: widget.model.pickupReference,
                          ),
                          TaxiOrderDescriptionAndValue(
                            description: 'Место назначения: ',
                            value: widget.model.destinationReference,
                          ),
                          TaxiOrderDescriptionAndValue(
                            description: 'Cоздан в : ',
                            value: DateFormat('dd-MM-yyyy, HH:mm')
                                .format(DateTime.parse(widget.model.createdAt)),
                          ),
                          TaxiOrderDescriptionAndValue(
                            description: 'Водитель: ',
                            value: widget.model.isDriver.toString(),
                          ),
                          TaxiOrderDescriptionAndValue(
                            description: 'Кем: ',
                            value: widget.model.username,
                          ),
                          SizedBox(height: 18.h),
                          SizedBox(height: 10.h),
                        ],
                      ),
                    ),
                    //

                    SizedBox(height: 40.h)
                  ],
                ),
              ),
              // if (state.item.buttons.isNotEmpty)
              // OrdersActionButton(
              //   id: 0,
              //   // buttons: const [],
              // ),
            ],
          );
        },
      ),
    );
  }
}
