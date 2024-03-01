import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:safar/ui/home_page/bloc/orders_bloc.dart';
import '../../../order_details_page/action/options/date_option.dart';
import 'text_form_fields/additional_field.dart';
import 'text_form_fields/manage_taxi_fields_headline.dart';
import 'text_form_fields/passenger_number_choice.dart';
import 'text_form_fields/taxi_to_field.dart';
import 'text_form_fields/taxi_from_field.dart';
import 'text_form_fields/new_inquiry_description.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ManageTaxiOrderFields extends StatefulWidget {
  final TextEditingController fromController;
  final TextEditingController toController;
  final TextEditingController exactLocationController;
  final TextEditingController exactDestinationController;
  final TextEditingController commentsController;
  final TextEditingController offeredPriceController;
  final TextEditingController dateController;

  const ManageTaxiOrderFields({
    super.key,
    required this.fromController,
    required this.toController,
    required this.exactLocationController,
    required this.exactDestinationController,
    required this.commentsController,
    required this.offeredPriceController,
    required this.dateController,
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
          margin: EdgeInsets.only(
            top: 8.h,
            right: 8.w,
            left: 8.w,
            bottom: 2.h,
          ),
          padding: EdgeInsets.all(10.w),
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.onBackground,
            borderRadius: BorderRadius.circular(16.r),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TaxiFromField(titleController: widget.fromController),
              SizedBox(height: 8.h),
              TaxiToField(titleController: widget.toController),
              ManageTaxiFieldsHeadline(),
              AdditionalField(
                thisController: widget.exactLocationController,
                hintText: 'Место встречи',
              ),
              ManageTaxiFieldsHeadline(),
              AdditionalField(
                thisController: widget.exactDestinationController,
                hintText: 'Место назначения',
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
                        context.read<OrdersBloc>().updateData(numberOfPassengers: index);
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
