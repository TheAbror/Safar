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

  //  Delivery requests

  void editDeliveryOrdersByID(int? id) async {
    emit(state.copyWith(blocProgress: BlocProgress.IS_LOADING));

    final request = DeliveryOrdersRequest(
      id: id,
      pickup: state.deliveryPickup,
      destination: state.deliveryDestination,
      desiredPickupTime: state.deliveryDate,
      offeredPrice: state.deliveryOfferedPrice,
      pickupReference: state.deliveryPickUpReference,
      destinationReference: state.deliveryDestinationReference,
      commentForDriver: state.deliveryCommentsForDriver,
      status: 'created',
      isDriver: state.isDriver,
    );

    try {
      final response = await ApiProvider.ordersService.editDeliveryOrdersByID(request, id ?? 0);

      if (response.isSuccessful) {
        final data = response.body;

        if (data != null) {
          emit(state.copyWith(
            deliveryOrdersList: data,
            isDeliveryPostSuccessfull: true,
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

  void getDeliveryOrderByIdForEdit(int id) async {
    emit(state.copyWith(blocProgress: BlocProgress.IS_LOADING));

    try {
      final response = await ApiProvider.ordersService.getDeliveryOrderByIdForEdit(id);

      if (response.isSuccessful) {
        final data = response.body;

        if (data != null) {
          emit(
            state.copyWith(
              deliveryPickup: data.pickup,
              deliveryDestination: data.destination,
              deliveryDate: data.createdAt,
              deliveryOfferedPrice: data.offeredPrice,
              deliveryPickUpReference: data.pickupReference,
              deliveryDestinationReference: data.destinationReference,
              deliveryCommentsForDriver: data.commentForDriver,
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

  void updateDeliveryData({
    String? pickup,
    String? destination,
    String? date,
    String? offeredPrice,
    String? phoneNumber,
    String? pickUpReference,
    String? destinationReference,
    String? commentsForDriver,
  }) {
    if (pickup != null) {
      emit(state.copyWith(deliveryPickup: pickup));
    } else if (destination != null) {
      emit(state.copyWith(deliveryDestination: destination));
    } else if (date != null) {
      emit(state.copyWith(deliveryDate: date));
    } else if (offeredPrice != null) {
      emit(state.copyWith(deliveryOfferedPrice: offeredPrice));
    } else if (offeredPrice != null) {
      emit(state.copyWith(deliveryPhoneNumber: phoneNumber));
    } else if (pickUpReference != null) {
      emit(state.copyWith(deliveryPickUpReference: pickUpReference));
    } else if (destinationReference != null) {
      emit(state.copyWith(deliveryDestinationReference: destinationReference));
    } else if (commentsForDriver != null) {
      emit(state.copyWith(deliveryCommentsForDriver: commentsForDriver));
    }

    final isPickUpValid = state.deliveryPickup.isNotEmpty;
    final isDestinationValid = state.deliveryDestination.isNotEmpty;
    final isDateValid = state.deliveryDate.isNotEmpty;
    final isOfferedPriceValid = state.deliveryOfferedPrice.isNotEmpty;

    var isFormValid = false;
    isFormValid = isPickUpValid && isDestinationValid && isOfferedPriceValid && isDateValid;

    emit(state.copyWith(isDeliveryButtonEnabled: isFormValid));
  }

  void getDeliveryOrderById(int id) async {
    emit(state.copyWith(blocProgress: BlocProgress.IS_LOADING));

    try {
      final response = await ApiProvider.ordersService.getDeliveryOrderById(id);

      if (response.isSuccessful) {
        final data = response.body;

        if (data != null) {
          emit(
            state.copyWith(
              deliveryOrderByID: data,
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

  void deleteDeliveryOrderById(int id) async {
    emit(state.copyWith(blocProgress: BlocProgress.IS_LOADING));

    try {
      final response = await ApiProvider.ordersService.deleteDeliveryOrderById(id);

      if (response.isSuccessful) {
        final data = response.body;

        if (data != null) {
          emit(state.copyWith(
            blocProgress: BlocProgress.IS_SUCCESS,
            isDeliveryOrderDeleted: true,
          ));
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

  void postDeliveryOrders() async {
    emit(state.copyWith(blocProgress: BlocProgress.IS_LOADING));

    final request = DeliveryOrdersRequest(
      pickup: state.deliveryPickup,
      destination: state.deliveryDestination,
      desiredPickupTime: state.deliveryDate, // '2024-04-01T08:00:00',
      offeredPrice: state.deliveryOfferedPrice,
      pickupReference: state.deliveryPickUpReference,
      destinationReference: state.deliveryDestinationReference,
      commentForDriver: state.deliveryCommentsForDriver,
      status: 'created',
      isDriver: false,
    );

    try {
      final response = await ApiProvider.ordersService.postDeliveryOrders(request);

      if (response.isSuccessful) {
        final data = response.body;

        if (data != null) {
          emit(state.copyWith(
            deliveryOrdersList: data,
            isDeliveryPostSuccessfull: true,
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

  //

  void getStatusesList() async {
    emit(state.copyWith(blocProgress: BlocProgress.IS_LOADING));

    try {
      final response = await ApiProvider.ordersService.getStatusesList();

      if (response.isSuccessful) {
        final data = response.body;

        if (data != null) {
          emit(state.copyWith(
            statusesForFilter: data.statuses,
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

  void getTaxiOrderByIdForEdit(int id) async {
    emit(state.copyWith(blocProgress: BlocProgress.IS_LOADING));

    try {
      final response = await ApiProvider.ordersService.getTaxiOrderByIdForEdit(id);

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
          emit(state.copyWith(
            blocProgress: BlocProgress.IS_SUCCESS,
            isOrderDeleted: true,
          ));
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
    String? phoneNumber,
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
    } else if (phoneNumber != null) {
      emit(state.copyWith(taxiPhoneNumber: phoneNumber));
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

  void getTaxiOrders() async {
    emit(state.copyWith(blocProgress: BlocProgress.IS_LOADING));

    try {
      final response = await ApiProvider.ordersService.getTaxiOrders();

      if (response.isSuccessful) {
        final data = response.body;

        if (data != null) {
          emit(state.copyWith(
            taxiOrdersList: data,
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

  void getDeliveryOrders() async {
    emit(state.copyWith(blocProgress: BlocProgress.IS_LOADING));

    try {
      final response = await ApiProvider.ordersService.getDeliveryOrders();

      if (response.isSuccessful) {
        final data = response.body;

        if (data != null) {
          emit(state.copyWith(
            deliveryOrdersList: data,
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

    final request = TaxiOrdersRequest(
      pickup: state.pickup,
      destination: state.destination,
      numberOfPassengers: state.numberOfPassengers,
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
            taxiOrdersList: data,
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

  void editTaxiOrdersByID(int? id) async {
    emit(state.copyWith(blocProgress: BlocProgress.IS_LOADING));

    final request = TaxiOrdersRequest(
      id: id,
      pickup: state.pickup,
      destination: state.destination,
      numberOfPassengers: state.numberOfPassengers,
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
      final response = await ApiProvider.ordersService.editTaxiOrdersByID(request, id ?? 0);

      if (response.isSuccessful) {
        final data = response.body;

        if (data != null) {
          emit(state.copyWith(
            taxiOrdersList: data,
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

  void makeDeletedFalse() {
    emit(state.copyWith(
      isOrderDeleted: false,
      isDeliveryOrderDeleted: false,
    ));
  }

  void makeBlocProgressFalse() {
    emit(state.copyWith(
      isDeliveryPostSuccessfull: false,
    ));
  }
}
