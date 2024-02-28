import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:safar/core/bloc_progress/bloc_progress.dart';
import 'package:safar/ui/manage_inquiry_page/model/inquiry_item.dart';
import 'package:safar/ui/manage_inquiry_page/model/inquiry_model.dart';
import 'package:safar/ui/home_page/model/inquiry_list_model.dart';

part 'manage_order_state.dart';

class ManageOrderBloc extends Cubit<ManageOrderState> {
  ManageOrderBloc() : super(ManageOrderState.initial());

  // void getInquiryByIdForEdit(int id) async {
  //   emit(state.copyWith(blocProgress: BlocProgress.IS_LOADING));

  //   try {
  //     final response = await ApiProvider.inquiryService.getInquiryByIdForEdit(id);

  //     if (response.isSuccessful) {
  //       final data = response.body;

  //       if (data != null) {
  //         List<InquiryItem> items = data.items
  //             .map((item) => InquiryItem(
  //                   name: item.name,
  //                   quantity: item.quantity,
  //                   measurement: item.measurement,
  //                 ))
  //             .toList();
  //         emit(
  //           state.copyWith(
  //             data: data,
  //             title: data.title,
  //             description: data.description,
  //             listofItems: items,
  //             isInitialValuesLoaded: true,
  //             blocProgress: BlocProgress.LOADED,
  //           ),
  //         );
  //       }
  //     } else {
  //       final error = ErrorResponse.fromJson(json.decode(response.error.toString()));

  //       emit(state.copyWith(
  //         blocProgress: BlocProgress.FAILED,
  //         failureMessage: error.message,
  //       ));
  //     }
  //   } catch (e) {
  //     debugPrint('Error getting inquiries: $e');

  //     emit(state.copyWith(
  //       blocProgress: BlocProgress.FAILED,
  //       failureMessage: AppStrings.internalErrorMessage,
  //     ));
  //   }
  // }

  void initialValuesDisplayed() {
    emit(state.copyWith(isInitialValuesLoaded: false));
  }

  void recipientIdForEdit(int id) {
    emit(state.copyWith(recipientID: id));
  }

  void isButtonEnabled() {
    emit(state.copyWith(isButtonEnabled: true));
  }

  void updateInquiryItem({
    required int index,
    required InquiryItem data,
  }) {
    final list = List<InquiryItem>.from(state.listofItems).toList();
    list[index] = data;

    emit(state.copyWith(listofItems: list));
  }

// //
//   void postNewInquiry(
//     String title,
//     String description,
//     int recipient,
//   ) async {
//     emit(state.copyWith(blocProgress: BlocProgress.IS_LOADING));

//     final itemsRequest = state.listofItems
//         .map((item) => item.toInquiryRequest(
//               item.name,
//               item.quantity,
//               item.measurement?.value,
//             ))
//         .toList();

//     final request = CreateInquiryRequest(
//       title: title,
//       description: description,
//       recipient: recipient,
//       recipient_group_type: state.recipientGroup,
//       items: itemsRequest,
//     );

//     try {
//       final response = await ApiProvider.inquiryService.postNewInquiry(request);

//       if (response.isSuccessful) {
//         final data = response.body;

//         if (data != null) {
//           final items = data.items.map((itemRequest) {
//             return InquiryItem(
//               name: itemRequest.name,
//               quantity: itemRequest.quantity,
//               measurement: itemRequest.measurement,
//             );
//           }).toList();

//           emit(
//             state.copyWith(
//               data: data,
//               listofItems: items,
//               blocProgress: BlocProgress.IS_SUCCESS,
//             ),
//           );
//         }
//       } else {
//         final error = ErrorResponse.fromJson(json.decode(response.error.toString()));

//         emit(state.copyWith(
//           blocProgress: BlocProgress.FAILED,
//           failureMessage: error.message,
//         ));
//       }
//     } catch (e) {
//       showMessage('$e');
//       debugPrint('Error getting inquiries: $e');
//       emit(state.copyWith(
//         blocProgress: BlocProgress.FAILED,
//         failureMessage: AppStrings.internalErrorMessage,
//       ));
//     }
//   }

  // //for edit only
  // void editInquiryByID(
  //   int id,
  //   String title,
  //   String description,
  //   int recipient,
  // ) async {
  //   emit(state.copyWith(blocProgress: BlocProgress.IS_LOADING));

  //   final itemsRequest = state.listofItems
  //       .map((item) => item.toInquiryRequest(
  //             item.name,
  //             item.quantity,
  //             item.measurement?.value,
  //           ))
  //       .toList();

  //   final request = CreateInquiryRequest(
  //     id: id,
  //     title: state.title,
  //     description: state.description,
  //     recipient: recipient,
  //     recipient_group_type: recipient == 0 ? state.recipientGroup : 'STAFF',
  //     items: itemsRequest,
  //   );

  //   try {
  //     final response = await ApiProvider.inquiryService.editInquiryByID(request);

  //     if (response.isSuccessful) {
  //       final data = response.body;

  //       if (data != null) {
  //         List<InquiryItem> items = data.items
  //             .map((item) => InquiryItem(
  //                   name: item.name,
  //                   quantity: item.quantity,
  //                   measurement: item.measurement,
  //                 ))
  //             .toList();
  //         emit(
  //           state.copyWith(
  //             data: data,
  //             listofItems: items,
  //             blocProgress: BlocProgress.IS_SUCCESS,
  //           ),
  //         );
  //       }
  //     } else {
  //       final error = ErrorResponse.fromJson(json.decode(response.error.toString()));

  //       emit(state.copyWith(
  //         blocProgress: BlocProgress.FAILED,
  //         failureMessage: error.message,
  //       ));
  //     }
  //   } catch (e) {
  //     debugPrint('Error getting inquiries: $e');

  //     emit(state.copyWith(
  //       blocProgress: BlocProgress.FAILED,
  //       failureMessage: AppStrings.internalErrorMessage,
  //     ));
  //   }
  // }

  void addInquiryItem() {
    final list = List<InquiryItem>.from(state.listofItems);

    list.add(
      InquiryItem(
        name: '',
        quantity: 0,
        measurement: state.measurementsList.isNotEmpty
            ? state.measurementsList.first
            : MeasurementResponse(label: '', value: ''),
      ),
    );

    emit(state.copyWith(listofItems: list));
  }

  void removeInquiry(int index) {
    print('Before removal: ${state.listofItems}');

    // Ensure the index is valid
    if (index >= 0 && index < state.listofItems.length) {
      final list = List<InquiryItem>.from(state.listofItems);

      list.removeAt(index);

      print('After removal: $list');

      emit(state.copyWith(listofItems: list));
    } else {
      print('Invalid index: $index');
    }
  }

  void updateData({
    String? title,
    String? description,
    int? recipientID,
    String? recipientName,
    String? recipientGroup,
  }) {
    if (title != null) {
      emit(state.copyWith(title: title));
    } else if (description != null) {
      emit(state.copyWith(description: description));
    } else if (recipientID != null) {
      emit(state.copyWith(recipientID: recipientID));
    } else if (recipientName != null) {
      emit(state.copyWith(recipientName: recipientName));
    } else if (recipientGroup != null) {
      emit(state.copyWith(recipientGroup: recipientGroup));
    }

    final isTitleValid = state.title.isNotEmpty;
    final isDescriptionValid = state.description.isNotEmpty;
    final isRecipientIDValid = state.recipientID != 0;
    final isrecipientGroupValid = state.recipientGroup.isNotEmpty;

    var isFormValid = false;
    isFormValid = state.recipientGroup == 'STAFF'
        ? isTitleValid && isDescriptionValid && isRecipientIDValid
        : isTitleValid && isDescriptionValid && isrecipientGroupValid;

    emit(state.copyWith(isButtonEnabled: isFormValid));
  }

  // void getInquiryById(int id) async {
  //   emit(state.copyWith(blocProgress: BlocProgress.IS_LOADING));

  //   try {
  //     final response = await ApiProvider.inquiryService.getInquiryById(id);

  //     if (response.isSuccessful) {
  //       final data = response.body;

  //       if (data != null) {
  //         emit(
  //           state.copyWith(
  //             item: data,
  //             blocProgress: BlocProgress.LOADED,
  //           ),
  //         );
  //       }
  //     } else {
  //       final error = ErrorResponse.fromJson(json.decode(response.error.toString()));

  //       emit(state.copyWith(
  //         blocProgress: BlocProgress.FAILED,
  //         failureMessage: error.message,
  //       ));
  //     }
  //   } catch (e) {
  //     debugPrint('Error getting inquiries: $e');

  //     emit(state.copyWith(
  //       blocProgress: BlocProgress.FAILED,
  //       failureMessage: AppStrings.internalErrorMessage,
  //     ));
  //   }
  // }

  // void deleteInquiryById(int id) async {
  //   emit(state.copyWith(blocProgress: BlocProgress.IS_LOADING));

  //   try {
  //     final response = await ApiProvider.inquiryService.deleteInquiryById(id);

  //     if (response.isSuccessful) {
  //       final data = response.body;

  //       if (data != null) {
  //         emit(
  //           state.copyWith(
  //             blocProgress: BlocProgress.IS_SUCCESS,
  //           ),
  //         );
  //       }
  //     } else {
  //       final error = ErrorResponse.fromJson(json.decode(response.error.toString()));

  //       emit(state.copyWith(
  //         blocProgress: BlocProgress.FAILED,
  //         failureMessage: error.message,
  //       ));
  //     }
  //   } catch (e) {
  //     debugPrint('Error getting inquiries: $e');

  //     emit(state.copyWith(
  //       blocProgress: BlocProgress.FAILED,
  //       failureMessage: AppStrings.internalErrorMessage,
  //     ));
  //   }
  // }

  // void getMeausures() async {
  //   emit(state.copyWith(blocProgress: BlocProgress.IS_LOADING));

  //   try {
  //     final response = await ApiProvider.measurementService.getMeasures();

  //     if (response.isSuccessful) {
  //       final data = response.body;

  //       if (data != null) {
  //         emit(
  //           state.copyWith(
  //             measurementsList: data,
  //             blocProgress: BlocProgress.LOADED,
  //           ),
  //         );
  //       }
  //     } else {
  //       final error = ErrorResponse.fromJson(json.decode(response.error.toString()));

  //       emit(state.copyWith(
  //         blocProgress: BlocProgress.FAILED,
  //         failureMessage: error.message,
  //       ));
  //     }
  //   } catch (e) {
  //     debugPrint('Error getting inquiries: $e');
  //     emit(state.copyWith(
  //       blocProgress: BlocProgress.FAILED,
  //       failureMessage: AppStrings.internalErrorMessage,
  //     ));
  //   }
  // }
}
