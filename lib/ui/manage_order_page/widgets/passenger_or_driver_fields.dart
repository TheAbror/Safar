import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:safar/core/colors/app_colors.dart';
import 'package:safar/ui/root_page/bloc/orders_bloc.dart';

class PassengerOrDriverField extends StatelessWidget {
  final OrdersState state;

  const PassengerOrDriverField({
    super.key,
    required this.state,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          'Пассажир',
          style: TextStyle(fontSize: 14.sp),
        ),
        DriverCheckBox(
          value: !state.isDriver,
          onChanged: (value) {
            context.read<OrdersBloc>().isPassenger();
          },
        ),
        Text(
          'Водитель',
          style: TextStyle(fontSize: 14.sp),
        ),
        DriverCheckBox(
          value: state.isDriver,
          onChanged: (value) {
            context.read<OrdersBloc>().isDriver();
          },
        ),
      ],
    );
  }
}

class DriverCheckBox extends StatelessWidget {
  final bool value;
  final Function(bool?)? onChanged;

  const DriverCheckBox({
    super.key,
    required this.value,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Checkbox(
      checkColor: AppColors.float,
      fillColor: MaterialStateProperty.resolveWith<Color>(
        (Set<MaterialState> states) {
          if (states.contains(MaterialState.selected)) {
            return AppColors.primary;
          }
          return Colors.transparent;
        },
      ),
      value: value,
      onChanged: onChanged,
    );
  }
}
