import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:safar/core/bloc_progress/bloc_progress.dart';
import 'package:safar/core/constants/something_went_wrong.dart';
import 'package:safar/core/dialogs/dialog_success_failure.dart';
import 'package:safar/core/routes/route_constants.dart';
import 'package:safar/ui/home_page/bloc/orders_bloc.dart';
import 'package:safar/ui/home_page/widgets/buttons/add_item_button.dart';
import 'package:safar/ui/manage_order_page/widgets/app_bar/inqury_appbar.dart';
import 'package:safar/ui/manage_order_page/widgets/inquiry_item.dart';
import 'texts_and_titles/submit_inquiry_button.dart';
import 'texts_and_titles/text_form_fields/additional_field.dart';
import 'widgets/amount_selection.dart';
import 'widgets/card_number_and_remove.dart';
import 'widgets/item_inquiry_title.dart';
import 'widgets/unit_selection.dart';

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
  var titleController = TextEditingController();
  var descriptionController = TextEditingController();

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
                    DeliveryTitleField(
                      thisController: titleController,
                      hintText: 'Title',
                      onChanged: (value) {
                        context.read<OrdersBloc>().updateData(offeredPrice: value);
                        print(value);
                      },
                    ),
                    SizedBox(height: 8.h),
                    DeliveryTitleField(
                      thisController: titleController,
                      hintText: 'Description',
                      height: 100,
                      onChanged: (value) {
                        context.read<OrdersBloc>().updateData(offeredPrice: value);
                        print(value);
                      },
                    ),
                  ],
                ),
              ),
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
              Container(
                margin: EdgeInsets.only(right: 8.w, left: 8.w, bottom: 2.h),
                padding: EdgeInsets.all(10.w),
                decoration: _Decoration(context),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CardNumberAndRemove(index: 1),
                    ItemInquiryTitle(index: 1, item: item),
                    AmountSelection(item: item, index: 1),
                    UnitSelection(index: 1, item: item),
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
