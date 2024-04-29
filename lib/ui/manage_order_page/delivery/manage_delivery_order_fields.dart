import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:safar/core/bottomsheet/primary_bottom_sheet.dart';
import 'package:safar/core/box/current_user_box.dart';
import 'package:safar/core/db/shared_keys.dart';
import 'package:safar/ui/root_page/bloc/orders_bloc.dart';
import 'package:safar/ui/root_page/model/current_user.dart';
import 'package:safar/ui/order_details_page/action/options/date_option.dart';
import '../text_form_fields/additional_field.dart';
import '../text_form_fields/new_inquiry_description.dart';
import '../widgets/from_to_fields.dart';

class ManageDeliveryOrderFields extends StatefulWidget {
  final TextEditingController fromController;
  final TextEditingController toController;
  final TextEditingController exactLocationController;
  final TextEditingController exactDestinationController;
  final TextEditingController offeredPriceController;
  final TextEditingController phoneNumberController;
  final TextEditingController dateController;
  final TextEditingController commentsController;

  const ManageDeliveryOrderFields({
    super.key,
    required this.fromController,
    required this.toController,
    required this.exactLocationController,
    required this.exactDestinationController,
    required this.offeredPriceController,
    required this.phoneNumberController,
    required this.dateController,
    required this.commentsController,
  });

  @override
  State<ManageDeliveryOrderFields> createState() => _ManageDeliveryOrderFieldsState();
}

class _ManageDeliveryOrderFieldsState extends State<ManageDeliveryOrderFields> {
  @override
  Widget build(BuildContext context) {
    CurrentUser? currentUser = boxCurrentUser.get(ShPrefKeys.currentUser);
    final number = currentUser?.number ?? 'Введите номер';

    return Container(
      margin: EdgeInsets.only(top: 8.h, right: 8.w, left: 8.w, bottom: 2.h),
      padding: EdgeInsets.all(10.w),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.onBackground,
        borderRadius: BorderRadius.circular(16.r),
      ),
      child: BlocBuilder<OrdersBloc, OrdersState>(
        builder: (context, state) {
          return Column(
            children: [
              FromToFields(
                hintText: 'Из',
                suffixIcon: true,
                controller: widget.fromController,
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
                    widget.fromController.text = result;
                    if (!mounted) return;
                    context.read<OrdersBloc>().updateDeliveryData(pickup: result);
                    print(result);
                  }
                },
              ),
              SizedBox(height: 4.h),
              FromToFields(
                hintText: 'В',
                suffixIcon: true,
                controller: widget.toController,
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
                    widget.toController.text = result;
                    context.read<OrdersBloc>().updateDeliveryData(destination: result);
                    print(result);
                  }
                },
              ),
              SizedBox(height: 4.h),
              AdditionalField(
                thisController: widget.exactLocationController,
                hintText: 'Место встречи : Необязательно',
                onChanged: (value) {
                  context.read<OrdersBloc>().updateDeliveryData(pickUpReference: value);
                  print(value);
                },
              ),
              SizedBox(height: 4.h),
              AdditionalField(
                thisController: widget.exactDestinationController,
                hintText: 'Место назначения : Необязательно',
                onChanged: (value) {
                  context.read<OrdersBloc>().updateDeliveryData(destinationReference: value);
                  print(value);
                },
              ),
              SizedBox(height: 4.h),
              OfferedPriceField(
                thisController: widget.offeredPriceController,
                hintText: 'Предложенная цена (ex: 200000 сум)',
                onChanged: (value) {
                  context.read<OrdersBloc>().updateDeliveryData(offeredPrice: value);
                  print(value);
                },
              ),
              SizedBox(height: 4.h),
              PhoneNumberField(
                thisController: widget.phoneNumberController,
                hintText: number,
                onChanged: (value) {
                  // ignore: unnecessary_null_comparison
                  if (value == null || value.isEmpty) {
                    value = number;
                  }
                  context.read<OrdersBloc>().updateDeliveryData(phoneNumber: value);
                  print(value);
                },
              ),
              SizedBox(height: 4.h),
              DateOption(
                isDelivery: true,
                dateController: widget.dateController,
              ),
              SizedBox(height: 4.h),
              CommentsForDrier(
                commentsController: widget.commentsController,
                onChanged: (value) {
                  context.read<OrdersBloc>().updateDeliveryData(commentsForDriver: value);
                  print(value);
                },
              ),
            ],
          );
        },
      ),
    );
  }
}
