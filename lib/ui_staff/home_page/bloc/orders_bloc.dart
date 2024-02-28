import 'dart:convert';
import 'package:safar/core/api/api_provider.dart';
import 'package:safar/core/bloc_progress/bloc_progress.dart';
import 'package:safar/core/bloc_progress/error.dart';
import 'package:safar/core/bloc_progress/super_bloc_progress.dart';
import 'package:safar/core/constants/app_strings.dart';
import 'package:safar/ui_staff/signin_page/auth/models/user_info.dart';
import 'package:safar/ui_staff/home_page/model/inquiry_list_model.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'orders_state.dart';

class OrdersBloc extends Cubit<OrdersState> {
  OrdersBloc() : super(OrdersState.initial());

  void getInitiallyAssigned() async {
    emit(state.copyWith(blocProgress: BlocProgress.IS_LOADING));

    try {
      final response = await ApiProvider.ordersService.getInitiallyAssigned();

      if (response.isSuccessful) {
        final data = response.body;

        if (data != null) {
          emit(state.copyWith(
            orders: data,
            blocProgress: BlocProgress.IS_SUCCESS,
          ));
        }
      } else {
        final error = ErrorResponse.fromJson(json.decode(response.error.toString()));

        emit(
          state.copyWith(
            blocProgress: BlocProgress.FAILED,
            failureMessage: error.message,
          ),
        );
      }
    } catch (e) {
      debugPrint('Error getting inquiries: $e');
      emit(
        state.copyWith(
          blocProgress: BlocProgress.FAILED,
          failureMessage: AppStrings.internalErrorMessage,
        ),
      );
    }
  }

  void clearAll() {
    emit(OrdersState.initial());
  }
}
