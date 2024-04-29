import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:safar/core/bottomsheet/primary_bottom_sheet.dart';
import 'package:safar/core/box/current_user_box.dart';
import 'package:safar/core/db/shared_keys.dart';
import 'package:safar/ui/root_page/bloc/orders_bloc.dart';
import 'package:safar/ui/root_page/model/current_user.dart';
import '../../order_details_page/action/options/date_option.dart';
import '../text_form_fields/additional_field.dart';
import '../text_form_fields/new_inquiry_description.dart';
import '../text_form_fields/passenger_number_choice.dart';
import '../text_form_fields/taxi_fields_headline.dart';
import '../widgets/from_to_fields.dart';
import '../widgets/passenger_or_driver_fields.dart';

class ManageTaxiOrderFields extends StatefulWidget {
  final TextEditingController fromController;
  final TextEditingController toController;
  final TextEditingController exactLocationController;
  final TextEditingController exactDestinationController;
  final TextEditingController commentsController;
  final TextEditingController offeredPriceController;
  final TextEditingController dateController;
  final TextEditingController phoneNumberController;

  const ManageTaxiOrderFields({
    super.key,
    required this.fromController,
    required this.toController,
    required this.exactLocationController,
    required this.exactDestinationController,
    required this.commentsController,
    required this.offeredPriceController,
    required this.dateController,
    required this.phoneNumberController,
  });

  @override
  State<ManageTaxiOrderFields> createState() => _ManageTaxiOrderFieldsState();
}

class _ManageTaxiOrderFieldsState extends State<ManageTaxiOrderFields> {
  @override
  Widget build(BuildContext context) {
    CurrentUser? currentUser = boxCurrentUser.get(ShPrefKeys.currentUser);
    final number = currentUser?.number ?? 'Введите номер';

    return BlocBuilder<OrdersBloc, OrdersState>(
      builder: (context, state) {
        return Container(
          padding: EdgeInsets.all(10.w),
          margin: EdgeInsets.only(top: 8.h, right: 8.w, left: 8.w, bottom: 2.h),
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.onBackground,
            borderRadius: BorderRadius.circular(16.r),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
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
                    selectedValue: state.pickup,
                    initialList: ShPrefKeys.listOfStates,
                  );

                  if (result != null) {
                    if (!mounted) return;
                    widget.fromController.text = result;
                    context.read<OrdersBloc>().updateData(pickup: result);
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
                    selectedValue: state.destination,
                    initialList: ShPrefKeys.listOfStates,
                  );

                  if (result != null) {
                    if (!mounted) return;
                    widget.toController.text = result;
                    context.read<OrdersBloc>().updateData(destination: result);

                    print(result);
                  }
                },
              ),
              SizedBox(height: 4.h),
              AdditionalField(
                thisController: widget.exactLocationController,
                hintText: 'Место встречи : Необязательно',
                onChanged: (value) {
                  context.read<OrdersBloc>().updateData(pickUpReference: value);
                  print(value);
                },
              ),
              SizedBox(height: 4.h),
              AdditionalField(
                thisController: widget.exactDestinationController,
                hintText: 'Место назначения : Необязательно',
                onChanged: (value) {
                  context.read<OrdersBloc>().updateData(destinationReference: value);
                  print(value);
                },
              ),
              TaxiFieldsHeadline(text: 'Создать заказ как:'),
              PassengerOrDriverField(state: state),
              TaxiFieldsHeadline(text: 'Количество пассажиров'),
              SizedBox(
                height: 48.w,
                width: double.infinity,
                child: ListView.separated(
                  shrinkWrap: true,
                  itemCount: 5,
                  scrollDirection: Axis.horizontal,
                  separatorBuilder: (BuildContext context, int index) => SizedBox(width: 20.w),
                  itemBuilder: (context, index) {
                    return PassengerNumberChoice(
                      index: index,
                      state: state,
                      onTap: () {
                        context.read<OrdersBloc>().updateData(numberOfPassengers: index + 1);
                        print(index + 1);
                      },
                    );
                  },
                ),
              ),
              SizedBox(height: 4.h),
              OfferedPriceField(
                thisController: widget.offeredPriceController,
                hintText: 'Предложенная цена (ex: 200000 сум)',
                onChanged: (value) {
                  context.read<OrdersBloc>().updateData(offeredPrice: value);
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
                  context.read<OrdersBloc>().updateData(phoneNumber: value);
                  print(value);
                },
              ),
              SizedBox(height: 4.h),
              DateOption(
                isDelivery: false,
                dateController: widget.dateController,
              ),
              SizedBox(height: 4.h),
              CommentsForDrier(
                commentsController: widget.commentsController,
                onChanged: (value) {
                  context.read<OrdersBloc>().updateData(commentsForDriver: value);
                  print(value);
                },
              ),
              SizedBox(height: 10.h),
            ],
          ),
        );
      },
    );
  }
}
