import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:safar/core/colors/app_colors.dart';
import 'package:safar/ui/home_page/bloc/orders_bloc.dart';

class PassengerNumberChoice extends StatelessWidget {
  final int index;
  final VoidCallback onTap;
  final OrdersState state;

  const PassengerNumberChoice({
    super.key,
    required this.index,
    required this.onTap,
    required this.state,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 48.w,
        width: 48.w,
        decoration: BoxDecoration(
          color: state.numberOfPassengers == (index + 1) ? AppColors.primary : AppColors.background,
          borderRadius: BorderRadius.circular(50.r),
          border: Border.all(color: AppColors.outline, width: 0.5.w),
        ),
        child: Center(
          child: Text(
            '${index + 1} ',
            style: TextStyle(
              fontSize: 22.sp,
              color: state.numberOfPassengers == (index + 1) ? AppColors.float : AppColors.textMain,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
