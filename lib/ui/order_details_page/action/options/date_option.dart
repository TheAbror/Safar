// ignore_for_file: unused_element, unnecessary_this, use_build_context_synchronously
import 'package:calendar_date_picker2/calendar_date_picker2.dart';
import 'package:safar/core/colors/app_colors.dart';
import 'package:safar/gen/assets.gen.dart';
import 'package:safar/ui/root_page/bloc/orders_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

class DateOption extends StatefulWidget {
  final TextEditingController dateController;
  final bool isDelivery;

  const DateOption({
    super.key,
    required this.dateController,
    required this.isDelivery,
  });

  @override
  State<DateOption> createState() => _DateOptionState();
}

class _DateOptionState extends State<DateOption> {
  FocusNode focus = FocusNode();

  DateTime dateTime = DateTime(2023, 08, 22, 5, 30);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 55.h,
      child: TextFormField(
        focusNode: focus,
        readOnly: true,
        onTap: () async {
          FocusScope.of(context).requestFocus(focus);

          List<DateTime?>? date = await pickDate();
          if (date == null || date.isEmpty) return;

          TimeOfDay? time = await pickTime();
          if (time == null) return;

          final newDateTime = DateTime(
            date.first?.year ?? 0,
            date.first?.month ?? 0,
            date.first?.day ?? 0,
            time.hour,
            time.minute,
          );

          setState() => this.dateTime = newDateTime;

          final formattedDateTime = DateFormat('yyyy-MM-ddTHH:mm:ss').format(newDateTime);
          widget.isDelivery
              ? context.read<OrdersBloc>().updateDeliveryData(date: formattedDateTime)
              : context.read<OrdersBloc>().updateData(date: formattedDateTime);

          widget.dateController.text = DateFormat('dd-MM-yyyy, HH:mm').format(newDateTime);
        },
        // onChanged: widget.onChanged,
        controller: widget.dateController,
        textInputAction: TextInputAction.next,
        decoration: InputDecoration(
          filled: true,
          contentPadding: EdgeInsets.symmetric(vertical: 1.h, horizontal: 12.w),

          border: InputBorder.none, // Remove border color
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: AppColors.stroke, width: 0.5.w),
            borderRadius: BorderRadius.circular(12.r),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: AppColors.primary, width: 0.5.w),
            borderRadius: BorderRadius.circular(12.r),
          ),
          errorBorder: OutlineInputBorder(
            borderSide: BorderSide(color: AppColors.stroke, width: 0.5.w),
            borderRadius: BorderRadius.circular(12),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderSide: BorderSide(color: AppColors.stroke, width: 0.5.w),
            borderRadius: BorderRadius.circular(12),
          ),
          hintText: 'Дата',
          fillColor: Theme.of(context).colorScheme.surfaceTint,
          hintStyle: const TextStyle(color: AppColors.textSecondary),
          suffixIcon: Padding(
            padding: EdgeInsets.symmetric(vertical: 10.h),
            child: Assets.icons.staffIcons.calendar.svg(
              colorFilter: ColorFilter.mode(
                focus.hasFocus ? AppColors.primary : Colors.grey,
                BlendMode.srcIn,
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future<TimeOfDay?> pickTime() => showTimePicker(
        context: context,
        initialTime: TimeOfDay(hour: dateTime.hour, minute: dateTime.minute),
        builder: (context, child) {
          return MediaQuery(
            data: MediaQuery.of(context).copyWith(alwaysUse24HourFormat: true),
            child: Theme(
              data: ThemeData.light().copyWith(
                colorScheme: ColorScheme.dark(
                  primary: Theme.of(context).colorScheme.primary,
                  onPrimary: Colors.white,
                  surface: Theme.of(context).colorScheme.onBackground,
                  onSurface: Theme.of(context).colorScheme.tertiary,
                ),
                dialogTheme: DialogTheme(
                  // backgroundColor: AppColors.error,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.r),
                  ),
                ),
              ),
              child: child!,
            ),
          );
        },
      );

  Future<List<DateTime?>?> pickDate() => showCalendarDatePicker2Dialog(
        context: context,
        config: CalendarDatePicker2WithActionButtonsConfig(
          firstDate: DateTime(2023),
          lastDate: DateTime(2040),
          selectedDayHighlightColor: AppColors.primary,
          weekdayLabels: ['Sun', 'Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat'],
          weekdayLabelTextStyle: TextStyle(
            color: Theme.of(context).colorScheme.tertiary,
            fontWeight: FontWeight.bold,
          ),
          controlsTextStyle: TextStyle(
            color: Theme.of(context).colorScheme.tertiary,
          ),
          selectedRangeDayTextStyle: TextStyle(
            color: Theme.of(context).colorScheme.tertiary,
          ),
          selectedRangeHighlightColor: Theme.of(context).colorScheme.tertiary,
          firstDayOfWeek: 1,
          controlsHeight: 50,
          yearTextStyle: TextStyle(
            color: Theme.of(context).colorScheme.tertiary,
          ),
          selectedDayTextStyle: TextStyle(
            color: Theme.of(context).colorScheme.tertiary,
          ),
          centerAlignModePicker: true,
          lastMonthIcon: Icon(
            Icons.arrow_left_sharp,
            color: Theme.of(context).colorScheme.tertiary,
          ),
          nextMonthIcon: Icon(
            Icons.arrow_right_sharp,
            color: Theme.of(context).colorScheme.tertiary,
          ),
          dayTextStyle: const TextStyle(
            fontWeight: FontWeight.bold,
          ),
          disabledDayTextStyle: const TextStyle(
            color: Colors.grey,
          ),
          selectedYearTextStyle: TextStyle(
            color: Theme.of(context).colorScheme.tertiary,
          ),
          selectableDayPredicate: (day) => !day
              .difference(
                DateTime.now().subtract(
                  const Duration(days: 1),
                ),
              )
              .isNegative,
        ),
        dialogSize: const Size(325, 400),
        borderRadius: BorderRadius.circular(15.r),
        dialogBackgroundColor: Theme.of(context).colorScheme.onBackground,
      );
}
