import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:safar/core/bottomsheet/primary_bottom_sheet.dart';
import 'package:safar/core/colors/app_colors.dart';
import 'package:safar/core/db/shared_keys.dart';
import 'package:safar/ui/home_page/bloc/orders_bloc.dart';
import '../order_details_page/action/options/date_option.dart';
import 'texts_and_titles/text_form_fields/additional_field.dart';
import 'texts_and_titles/text_form_fields/manage_taxi_fields_headline.dart';
import 'texts_and_titles/text_form_fields/new_inquiry_description.dart';
import 'texts_and_titles/text_form_fields/passenger_number_choice.dart';
import 'widgets/from_to_fields.dart';

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
                controller: widget.fromController,
                hintText: 'Из',
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
                    widget.fromController.text = result;
                    context.read<OrdersBloc>().updateData(pickup: result);
                    print(result);
                  }
                },
              ),
              SizedBox(height: 8.h),
              FromToFields(
                controller: widget.toController,
                hintText: 'В',
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
                    widget.toController.text = result;
                    context.read<OrdersBloc>().updateData(destination: result);

                    print(result);
                  }
                },
              ),
              SizedBox(height: 8.h),
              PickUpReferenceField(
                thisController: widget.exactLocationController,
                hintText: 'Место встречи : Необязательно',
              ),
              SizedBox(height: 8.h),
              AdditionalField(
                thisController: widget.exactDestinationController,
                hintText: 'Место назначения : Необязательно',
              ),
              ManageTaxiFieldsHeadline(text: 'Создать заказ как:'),
              Row(
                children: [
                  Text(
                    'Пассажир',
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
                  Text(
                    'Водитель',
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
                ],
              ),
              ManageTaxiFieldsHeadline(text: 'Количество пассажиров'),
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
              SizedBox(height: 8.h),
              OfferedPriceField(
                thisController: widget.offeredPriceController,
                hintText: 'Предложенная цена (ex: 200.000 сум)',
              ),
              SizedBox(height: 8.h),
              PhoneNumberField(
                thisController: widget.phoneNumberController,
                hintText: '+998914309090',
              ),
              SizedBox(height: 8.h),
              DateOption(
                dateController: widget.dateController,
                status: '',
              ),
              SizedBox(height: 8.h),
              CommentsForDrier(commentsController: widget.commentsController),
              SizedBox(height: 10.h),
            ],
          ),
        );
      },
    );
  }
}
