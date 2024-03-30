import 'dart:convert';
import 'package:safar/core/api/api_provider.dart';
import 'package:safar/core/bloc_progress/bloc_progress.dart';
import 'package:safar/core/bloc_progress/error.dart';
import 'package:safar/core/constants/app_strings.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:safar/core/utils/all_models/all_models.dart';

part 'orders_state.dart';

class OrdersBloc extends Cubit<OrdersState> {
  OrdersBloc() : super(OrdersState.initial());

  void getInquiryByIdForEdit(int id) async {
    emit(state.copyWith(blocProgress: BlocProgress.IS_LOADING));

    try {
      final response = await ApiProvider.ordersService.getInquiryByIdForEdit(id);

      if (response.isSuccessful) {
        final data = response.body;

        if (data != null) {
          emit(
            state.copyWith(
              pickup: data.pickup,
              destination: data.destination,
              numberOfPassengers: data.numberOfPassengers,
              date: data.createdAt,
              offeredPrice: data.offeredPrice,
              pickUpReference: data.pickupReference,
              destinationReference: data.destinationReference,
              commentsForDriver: data.commentForDriver,
              isInitialValuesLoaded: true,
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

  void initialValuesDisplayed() {
    emit(state.copyWith(isInitialValuesLoaded: false));
  }

  void isPassenger() {
    emit(state.copyWith(isDriver: false));
    print('Is driver: ${state.isDriver}');
  }

  void isDriver() {
    emit(state.copyWith(isDriver: true));
    print('Is driver: ${state.isDriver}');
  }

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

  void deleteOrderById(int id) async {
    emit(state.copyWith(blocProgress: BlocProgress.IS_LOADING));

    try {
      final response = await ApiProvider.ordersService.deleteOrderById(id);

      if (response.isSuccessful) {
        final data = response.body;

        if (data != null) {
          emit(
            state.copyWith(
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

  void postTaxiOrders(bool isEdit, int? id) async {
    emit(state.copyWith(blocProgress: BlocProgress.IS_LOADING));

    final request = isEdit
        ? OrdersRequest(
            id: id,
            pickup: state.pickup,
            destination: state.destination,
            numberOfPassengers: state.numberOfPassengers + 1,
            desiredPickupTime: state.date,
            desiredCarModel: '',
            offeredPrice: state.offeredPrice,
            pickupReference: state.pickUpReference,
            destinationReference: state.destinationReference,
            commentForDriver: state.commentsForDriver,
            status: 'created',
            isDriver: state.isDriver,
          )
        : OrdersRequest(
            pickup: state.pickup,
            destination: state.destination,
            numberOfPassengers: state.numberOfPassengers + 1,
            desiredPickupTime: state.date,
            desiredCarModel: '',
            offeredPrice: state.offeredPrice,
            pickupReference: state.pickUpReference,
            destinationReference: state.destinationReference,
            commentForDriver: state.commentsForDriver,
            status: 'created',
            isDriver: state.isDriver,
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
