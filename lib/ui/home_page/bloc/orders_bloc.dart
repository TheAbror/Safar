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

  void getOrderById(int id) async {
    emit(state.copyWith(blocProgress: BlocProgress.IS_LOADING));

    try {
      final response = await ApiProvider.ordersService.getOrderById(id);

      if (response.isSuccessful) {
        final data = response.body;

        if (data != null) {
          emit(
            state.copyWith(
              orderByID: data,
              blocProgress: BlocProgress.LOADED,
            ),
          );
        }
      } else {
        final error = ErrorResponse.fromJson(json.decode(response.error.toString()));

        emit(state.copyWith(
          blocProgress: BlocProgress.FAILED,
          failureMessage: error.message,
        ));
      }
    } catch (e) {
      debugPrint('Error getting inquiries: $e');

      emit(state.copyWith(
        blocProgress: BlocProgress.FAILED,
        failureMessage: AppStrings.internalErrorMessage,
      ));
    }
  }

  void updateData({
    String? pickup,
    String? destination,
    int? numberOfPassengers,
    String? date,
    String? offeredPrice,
    String? pickUpReference,
    String? destinationReference,
    String? commentsForDriver,
  }) {
    if (pickup != null) {
      emit(state.copyWith(pickup: pickup));
    } else if (destination != null) {
      emit(state.copyWith(destination: destination));
    } else if (numberOfPassengers != null) {
      emit(state.copyWith(numberOfPassengers: numberOfPassengers));
    } else if (date != null) {
      emit(state.copyWith(date: date));
    } else if (offeredPrice != null) {
      emit(state.copyWith(offeredPrice: offeredPrice));
    } else if (pickUpReference != null) {
      emit(state.copyWith(pickUpReference: pickUpReference));
    } else if (destinationReference != null) {
      emit(state.copyWith(destinationReference: destinationReference));
    } else if (commentsForDriver != null) {
      emit(state.copyWith(commentsForDriver: commentsForDriver));
    }

    final isPickUpValid = state.pickup.isNotEmpty;
    final isDestinationValid = state.destination.isNotEmpty;
    final isNumberOfPassengersValid = state.numberOfPassengers != -1;
    final isDateValid = state.date.isNotEmpty;
    final isOfferedPriceValid = state.offeredPrice.isNotEmpty;

    var isFormValid = false;
    isFormValid = isPickUpValid &&
        isDestinationValid &&
        isNumberOfPassengersValid &&
        isOfferedPriceValid &&
        isDateValid;

    emit(state.copyWith(isButtonEnabled: isFormValid));
  }

  void meetingDate(String date) async {
    emit(state.copyWith(date: date));
    print(state.date);
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
      pickup: state.pickup,
      destination: state.destination,
      numberOfPassengers: state.numberOfPassengers + 1,
      desiredPickupTime: state.date,
      desiredCarModel: '',
      offeredPrice: state.offeredPrice,
      pickupReference: state.pickUpReference,
      destinationReference: state.destinationReference,
      commentForDriver: state.commentsForDriver,
      status: [OrderStatus(key: 'created', value: 'Created')],
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

  void clearAll() {
    emit(OrdersState.initial());
  }
}
