import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:safar/core/bloc_progress/bloc_progress.dart';
import 'package:safar/core/bottomsheet/primary_bottom_sheet.dart';
import 'package:safar/core/constants/something_went_wrong.dart';
import 'package:safar/core/db/shared_keys.dart';
import 'package:safar/core/dialogs/dialog_success_failure.dart';
import 'package:safar/core/routes/route_constants.dart';
import 'package:safar/ui/home_page/bloc/orders_bloc.dart';
import 'package:safar/ui/home_page/widgets/buttons/add_item_button.dart';
import 'package:safar/ui/manage_order_page/widgets/app_bar/inqury_appbar.dart';
import 'package:safar/ui/manage_order_page/widgets/inquiry_item.dart';
import 'package:safar/ui/order_details_page/action/options/date_option.dart';
import 'texts_and_titles/submit_inquiry_button.dart';
import 'texts_and_titles/text_form_fields/additional_field.dart';
import 'texts_and_titles/text_form_fields/new_inquiry_description.dart';
import 'widgets/amount_selection.dart';
import 'widgets/card_number_and_remove.dart';
import 'widgets/from_to_fields.dart';
import 'widgets/item_inquiry_title.dart';

class ManagDeliveryOrdersPageViewModel {
  final int id;
  final bool isEdit;

  ManagDeliveryOrdersPageViewModel({
    required this.id,
    required this.isEdit,
  });
}

class ManagDeliveryOrdersPage extends StatefulWidget {
  final ManagDeliveryOrdersPageViewModel viewModel;

  const ManagDeliveryOrdersPage({super.key, required this.viewModel});

  @override
  State<ManagDeliveryOrdersPage> createState() => _ManagDeliveryOrdersPageState();
}

class _ManagDeliveryOrdersPageState extends State<ManagDeliveryOrdersPage> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        backgroundColor: Theme.of(context).colorScheme.inverseSurface,
        appBar: order_appbar(
          context,
          widget.viewModel.isEdit ? 'Изменить детали доставки' : 'Заказать доставку',
          SubmitOrderButton(
            // isEnabled: widget.viewModel.isEdit ? true : false,
            isEnabled: true,
            onTap: () {
              context.read<OrdersBloc>().postDeliveryOrders();
              if (widget.viewModel.isEdit) {}
            },
          ),
        ),
        body: _Body(viewModel: widget.viewModel),
      ),
    );
  }
}

class _Body extends StatefulWidget {
  final ManagDeliveryOrdersPageViewModel viewModel;

  const _Body({required this.viewModel});

  @override
  State<_Body> createState() => _BodyState();
}

class _BodyState extends State<_Body> {
  var fromController = TextEditingController();
  var toController = TextEditingController();
  var offeredPriceController = TextEditingController();
  var exactLocationController = TextEditingController();
  var exactDestinationController = TextEditingController();
  var commentsController = TextEditingController();
  var dateController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final item = InquiryItem(name: 'test', quantity: 1);

    return BlocConsumer<OrdersBloc, OrdersState>(
      listener: (context, state) {
        if (state.blocProgress == BlocProgress.IS_SUCCESS && state.isDeliveryPostSuccessfull) {
          //

          Navigator.pushNamed(context, AppRoutes.homePage);

          showMessage('Успех delivey created');

          context.read<OrdersBloc>().makeBlocProgressFalse();
        }
      },
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
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.only(top: 8.h, right: 8.w, left: 8.w, bottom: 2.h),
                padding: EdgeInsets.all(10.w),
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.onBackground,
                  borderRadius: BorderRadius.circular(16.r),
                ),
                child: Column(
                  children: [
                    // desiredPickupTime: '2024-04-01T08:00:00',
                    // commentForDriver: state.commentsForDriver,

                    FromToFields(
                      hintText: 'Из',
                      suffixIcon: true,
                      controller: fromController,
                      onTap: () async {
                        final result = await PrimaryBottomSheet.show(
                          context,
                          isSearchNeeded: true,
                          heightRatio: 0.9,
                          isConfirmationNeeded: false,
                          title: 'Выберите регион',
                          selectedValue: state.deliveryPickup,
                          initialList: ShPrefKeys.listOfStates,
                        );

                        if (result != null) {
                          if (!mounted) return;
                          fromController.text = result;
                          context.read<OrdersBloc>().updateDeliveryData(pickup: result);
                          print(result);
                        }
                      },
                    ),

                    SizedBox(height: 8.h),

                    FromToFields(
                      hintText: 'В',
                      suffixIcon: true,
                      controller: toController,
                      onTap: () async {
                        final result = await PrimaryBottomSheet.show(
                          context,
                          isSearchNeeded: true,
                          heightRatio: 0.9,
                          isConfirmationNeeded: false,
                          title: 'Выберите регион',
                          selectedValue: state.deliveryDestination,
                          initialList: ShPrefKeys.listOfStates,
                        );

                        if (result != null) {
                          if (!mounted) return;
                          toController.text = result;
                          context.read<OrdersBloc>().updateDeliveryData(destination: result);
                          print(result);
                        }
                      },
                    ),

                    SizedBox(height: 8.h),
                    AdditionalField(
                      thisController: offeredPriceController,
                      hintText: 'Предложенная цена (ex: 200.000 сум)',
                      onChanged: (value) {
                        context.read<OrdersBloc>().updateData(offeredPrice: value);
                        print(value);
                      },
                    ),

                    SizedBox(height: 8.h),
                    AdditionalField(
                      thisController: exactLocationController,
                      hintText: 'Место встречи : Необязательно',
                      onChanged: (value) {
                        context.read<OrdersBloc>().updateDeliveryData(pickUpReference: value);
                        print(value);
                      },
                    ),
                    SizedBox(height: 8.h),
                    AdditionalField(
                      thisController: exactDestinationController,
                      hintText: 'Место назначения : Необязательно',
                      onChanged: (value) {
                        context.read<OrdersBloc>().updateDeliveryData(destinationReference: value);
                        print(value);
                      },
                    ),

                    SizedBox(height: 8.h),
                    DateOption(
                      dateController: dateController,
                      onChanged: (value) {
                        context.read<OrdersBloc>().updateDeliveryData(date: value);
                      },
                    ),
                    SizedBox(height: 8.h),
                    CommentsForDrier(commentsController: commentsController),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(right: 8.w, left: 8.w, bottom: 2.h),
                padding: EdgeInsets.all(10.w),
                decoration: _Decoration(context),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CardNumberAndRemove(index: 0),
                    ItemInquiryTitle(index: 1, item: item),
                    AmountSelection(item: item, index: 1),
                  ],
                ),
              ),
              SizedBox(
                height: 40.h,
                width: double.infinity,
              ),
              AddItemButton(
                text: ' Add Item',
                width: 135.w,
                ontap: () {},
              ),
              SizedBox(height: 20.h),
              Container(
                margin: EdgeInsets.only(top: 8.h, right: 8.w, left: 8.w, bottom: 2.h),
                padding: EdgeInsets.all(10.w),
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.onBackground,
                  borderRadius: BorderRadius.circular(16.r),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text('Upload photo'),
                    Container(
                      margin: EdgeInsets.only(top: 8.h, right: 8.w, left: 8.w, bottom: 2.h),
                      decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.background,
                        borderRadius: BorderRadius.circular(16.r),
                      ),
                      child: Column(
                        children: [
                          SizedBox(height: 20.h),
                          Text(
                            '+',
                            style: TextStyle(fontSize: 24.sp),
                          ),
                          Text(
                            'File upload',
                            style: TextStyle(fontSize: 16.sp),
                          ),
                          SizedBox(height: 20.h),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(height: 60.h),
            ],
          ),
        );
      },
    );
  }

  BoxDecoration _Decoration(BuildContext context) {
    return BoxDecoration(
      color: Theme.of(context).colorScheme.onBackground,
      borderRadius: BorderRadius.circular(16.r),
    );
  }
}




 // ListView.builder(
              //   scrollDirection: Axis.vertical,
              //   shrinkWrap: true,
              //   physics: const NeverScrollableScrollPhysics(),
              //   itemCount: state.listofItems.length,
              //   itemBuilder: (context, index) {
              //     final item = state.listofItems[index];

              //     return Container(
              //       key: Key(state.listofItems.length.toString()),
              //       margin: EdgeInsets.only(right: 8.w, left: 8.w, bottom: 2.h),
              //       padding: EdgeInsets.all(10.w),
              //       decoration: _Decoration(context),
              //       child: Column(
              //         crossAxisAlignment: CrossAxisAlignment.start,
              //         children: [
              //           CardNumberAndRemove(index: index),
              //           ItemInquiryTitle(index: index, item: item),
              //           AmountSelection(item: item, index: index),
              //           UnitSelection(index: index, item: item),
              //         ],
              //       ),
              //     );
              //   },
              // ),