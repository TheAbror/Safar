import 'dart:convert';
import 'package:safar/core/api/api_provider.dart';
import 'package:safar/core/bloc_progress/bloc_progress.dart';
import 'package:safar/core/bloc_progress/error.dart';
import 'package:safar/core/bloc_progress/super_bloc_progress.dart';
import 'package:safar/core/constants/app_strings.dart';
import 'package:safar/ui_staff/signin_page/auth/models/user_info.dart';
import 'package:safar/ui_staff/staff_home_page/model/inquiry_list_model.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'inquiry_state.dart';

class InquiryBloc extends Cubit<InquiryState> {
  InquiryBloc() : super(InquiryState.initial());

  void getInitiallyAssigned() async {
    emit(state.copyWith(blocProgress: BlocProgress.IS_LOADING));

    try {
      final response = await ApiProvider.inquiryService.getInitiallyAssigned();

      if (response.isSuccessful) {
        final data = response.body;

        if (data != null) {
          emit(state.copyWith(orders: data, blocProgress: BlocProgress.LOADED));
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

//   void changeStatusTaxi(String status) async {
//     if (status.isNotEmpty) {
//       Random random = Random();
//       int randomNumber = random.nextInt(100);

//       if (state.listOfSelectedStatusesCreated.contains(status)) {
//         final updatedList = List<String>.from(state.listOfSelectedStatusesCreated);
//         updatedList.remove(status);

//         emit(
//             state.copyWith(listOfSelectedStatusesCreated: updatedList, randomNumber: randomNumber));
//       } else {
//         final updatedList = List<String>.from(state.listOfSelectedStatusesCreated);
//         updatedList.add(status);

//         emit(
//             state.copyWith(listOfSelectedStatusesCreated: updatedList, randomNumber: randomNumber));
//       }
//       _reFilterContentListTaxi();
//     }
//   }

//   void _reFilterContentListTaxi() {
//     final allContent = state.created;
//     final selectedStatuses = state.listOfSelectedStatusesCreated.map((e) => e.toLowerCase());

//     if (selectedStatuses.isEmpty) {
//       emit(state.copyWith(createdFiltered: allContent.model.content));
//     } else {
//       final updatedFilteredContent = allContent.model.content.where(
//         (element) {
//           final itemStatus = element.status?.title.toLowerCase();
//           return selectedStatuses.contains(itemStatus);
//         },
//       ).toList();

//       emit(state.copyWith(createdFiltered: updatedFilteredContent));
//     }
//   }

//   void changeStatusDelivery(String status) async {
//     if (status.isNotEmpty) {
//       Random random = Random();
//       int randomNumber = random.nextInt(100);

//       if (state.listOfSelectedStatusesAssigned.contains(status)) {
//         final updatedList = List<String>.from(state.listOfSelectedStatusesAssigned);
//         updatedList.remove(status);

//         emit(state.copyWith(
//             listOfSelectedStatusesAssigned: updatedList, randomNumber: randomNumber));
//       } else {
//         final updatedList = List<String>.from(state.listOfSelectedStatusesAssigned);
//         updatedList.add(status);

//         emit(state.copyWith(
//             listOfSelectedStatusesAssigned: updatedList, randomNumber: randomNumber));
//       }
//       _reFilterContentListDelivery();
//     }
//   }

//   void _reFilterContentListDelivery() {
//     final allContent = state.assigned;
//     final selectedStatuses = state.listOfSelectedStatusesAssigned.map((e) => e.toLowerCase());

//     if (selectedStatuses.isEmpty) {
//       // No filters selected, include all content
//       emit(state.copyWith(assignedFiltered: allContent.model.content));
//     } else {
//       final updatedFilteredContent = allContent.model.content.where(
//         (element) {
//           final itemStatus = element.status?.title.toLowerCase();
//           return selectedStatuses.contains(itemStatus);
//         },
//       ).toList();

//       emit(state.copyWith(assignedFiltered: updatedFilteredContent));
//     }
//   }

//   void searchTaxi(String value) {
//     final filteredContent = state.created.model.content
//         .where(
//           (element) => (element.title).toLowerCase().contains(value.toLowerCase()),
//         )
//         .toList();

//     emit(state.copyWith(createdFiltered: filteredContent));
//   }

//   void searchDelivery(String value) {
//     final filtered = state.assigned.model.content
//         .where(
//           (element) => (element.title).toLowerCase().contains(value.toLowerCase()),
//         )
//         .toList();

//     emit(state.copyWith(assignedFiltered: filtered));
//   }

  void clearAll() {
    emit(InquiryState.initial());
  }
}
