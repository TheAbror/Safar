import 'dart:convert';
import 'package:safar/core/api/api_provider.dart';
import 'package:safar/core/bloc_progress/bloc_progress.dart';
import 'package:safar/core/bloc_progress/error.dart';
import 'package:safar/core/bloc_progress/super_bloc_progress.dart';
import 'package:safar/core/constants/app_strings.dart';
import 'package:safar/ui/signin_page/auth/models/all_models.dart';
import 'package:safar/ui/home_page/model/inquiry_list_model.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'orders_state.dart';

class OrdersBloc extends Cubit<OrdersState> {
  OrdersBloc() : super(OrdersState.initial());

  void meetingDate(String date) async {
    emit(state.copyWith(date: date));
    print(state.date);
  }

  void passengerCount(int index) {
    emit(state.copyWith(numberOfPassengers: index));
  }

  void getTaxiOrders() async {
    emit(state.copyWith(blocProgress: BlocProgress.IS_LOADING));

    try {
      final response = await ApiProvider.ordersService.getTaxiOrders();

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

  void postTaxiOrders() async {
    emit(state.copyWith(blocProgress: BlocProgress.IS_LOADING));

    final request = OrdersRequest(
      pickup: 'Xorazm, Urgench',
      destination: 'Yunusobod, Tashkent',
      numberOfPassengers: 3,
      desiredPickupTime: '2024-02-27T08:00:00',
      desiredCarModel: 'Malibu',
      offeredPrice: '150.00',
      pickupReference: '',
      destinationReference: '',
      commentForDriver: 'Hello there, I need a ride',
    );

    try {
      final response = await ApiProvider.ordersService.postTaxiOrders(request);

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

// OrdersRequest

  void clearAll() {
    emit(OrdersState.initial());
  }
}
