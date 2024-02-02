import 'dart:convert';
import 'dart:math';
import 'package:safar/core/api/api_provider.dart';
import 'package:safar/core/bloc_progress/bloc_progress.dart';
import 'package:safar/core/bloc_progress/error.dart';
import 'package:safar/core/bloc_progress/super_bloc_progress.dart';
import 'package:safar/core/constants/app_strings.dart';
import 'package:safar/ui_staff/staff_home_page/model/inquiry_list_model.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'inquiry_state.dart';

class InquiryBloc extends Cubit<InquiryState> {
  InquiryBloc() : super(InquiryState.initial());

  void getAssignedWithPageable() async {
    if (state.assigned.blocProgress == BlocProgress.IS_LOADING ||
        state.listOfSelectedStatusesAssigned.isNotEmpty) {
      return;
    }

    if (state.assignedTotalElements > state.assigned.model.content.length) {
      int thisCounter = state.assignedCounter;
      thisCounter++;

      try {
        emit(
          state.copyWith(
            assignedCounter: thisCounter,
            assigned: state.assigned.copyWith(
              blocProgress: BlocProgress.IS_LOADING,
            ),
          ),
        );

        final response = await ApiProvider.inquiryService.getAssignedWithPageable(thisCounter);

        if (response.isSuccessful) {
          final data = response.body;

          if (data != null) {
            final assigned = state.assigned;
            assigned.model.content.addAll(data.content);

            emit(
              state.copyWith(
                assigned: state.assigned.copyWith(
                  model: assigned.model,
                  blocProgress: BlocProgress.LOADED,
                ),
                assignedFiltered: assigned.model.content,
              ),
            );
          } else {
            emit(
              state.copyWith(assigned: state.assigned.copyWith(blocProgress: BlocProgress.LOADED)),
            );
          }
        } else {
          final error = ErrorResponse.fromJson(json.decode(response.error.toString()));

          emit(
            state.copyWith(
              assigned: state.assigned.copyWith(
                blocProgress: BlocProgress.FAILED,
                failureMessage: error.message,
              ),
            ),
          );
        }
      } catch (e) {
        debugPrint('Error getting inquiries: $e');
        emit(
          state.copyWith(
            assigned: state.assigned.copyWith(
              blocProgress: BlocProgress.FAILED,
              failureMessage: AppStrings.internalErrorMessage,
            ),
          ),
        );
      }
    }
  }

  void getInitiallyAssigned() async {
    emit(state.copyWith(assigned: state.assigned.copyWith(blocProgress: BlocProgress.IS_LOADING)));

    try {
      final response = await ApiProvider.inquiryService.getInitiallyAssigned();

      if (response.isSuccessful) {
        final data = response.body;

        if (data != null) {
          emit(
            state.copyWith(
              assigned: state.assigned.copyWith(model: data, blocProgress: BlocProgress.LOADED),
              assignedFiltered: data.content,
              assignedTotalElements: data.totalElements,
            ),
          );
        }
      } else {
        final error = ErrorResponse.fromJson(json.decode(response.error.toString()));

        emit(
          state.copyWith(
            assigned: state.assigned.copyWith(
              blocProgress: BlocProgress.FAILED,
              failureMessage: error.message,
            ),
          ),
        );
      }
    } catch (e) {
      debugPrint('Error getting inquiries: $e');
      emit(
        state.copyWith(
          assigned: state.assigned.copyWith(
            blocProgress: BlocProgress.FAILED,
            failureMessage: AppStrings.internalErrorMessage,
          ),
        ),
      );
    }
  }

  void getInitiallyCreated() async {
    emit(state.copyWith(created: state.created.copyWith(blocProgress: BlocProgress.IS_LOADING)));

    try {
      final response = await ApiProvider.inquiryService.getInitiallyCreated();

      if (response.isSuccessful) {
        final data = response.body;

        if (data != null) {
          emit(
            state.copyWith(
              created: state.created.copyWith(model: data, blocProgress: BlocProgress.LOADED),
              createdFiltered: data.content,
              createdTotalElements: data.totalElements,
            ),
          );
        }
      } else {
        final error = ErrorResponse.fromJson(json.decode(response.error.toString()));

        emit(
          state.copyWith(
            created: state.created.copyWith(
              blocProgress: BlocProgress.FAILED,
              failureMessage: error.message,
            ),
          ),
        );
      }
    } catch (e) {
      debugPrint('Error getting inquiries: $e');
      emit(
        state.copyWith(
          created: state.created.copyWith(
            blocProgress: BlocProgress.FAILED,
            failureMessage: AppStrings.internalErrorMessage,
          ),
        ),
      );
    }
  }

  void getCreatedWithPageable() async {
    if (state.created.blocProgress == BlocProgress.IS_LOADING ||
        state.listOfSelectedStatusesCreated.isNotEmpty) {
      return;
    }

    if (state.createdTotalElements > state.created.model.content.length) {
      int thisCounter = state.counterCreated;
      thisCounter++;

      try {
        emit(
          state.copyWith(
            counterCreated: thisCounter,
            created: state.created.copyWith(blocProgress: BlocProgress.IS_LOADING),
          ),
        );

        final response = await ApiProvider.inquiryService.getCreatedWithPageable(thisCounter);

        if (response.isSuccessful) {
          final data = response.body;

          if (data != null) {
            final created = state.created;
            created.model.content.addAll(data.content);

            emit(
              state.copyWith(
                created: state.created.copyWith(
                  model: created.model,
                  blocProgress: BlocProgress.LOADED,
                ),
                createdFiltered: created.model.content,
              ),
            );
          } else {
            emit(
              state.copyWith(created: state.created.copyWith(blocProgress: BlocProgress.LOADED)),
            );
          }
        } else {
          final error = ErrorResponse.fromJson(json.decode(response.error.toString()));

          emit(
            state.copyWith(
              created: state.created.copyWith(
                blocProgress: BlocProgress.FAILED,
                failureMessage: error.message,
              ),
            ),
          );
        }
      } catch (e) {
        debugPrint('Error getting inquiries: $e');
        emit(
          state.copyWith(
            created: state.created.copyWith(
              blocProgress: BlocProgress.FAILED,
              failureMessage: AppStrings.internalErrorMessage,
            ),
          ),
        );
      }
    }
  }

  void changeStatusCreated(String status) async {
    if (status.isNotEmpty) {
      Random random = Random();
      int randomNumber = random.nextInt(100);

      if (state.listOfSelectedStatusesCreated.contains(status)) {
        final updatedList = List<String>.from(state.listOfSelectedStatusesCreated);
        updatedList.remove(status);

        emit(
            state.copyWith(listOfSelectedStatusesCreated: updatedList, randomNumber: randomNumber));
      } else {
        final updatedList = List<String>.from(state.listOfSelectedStatusesCreated);
        updatedList.add(status);

        emit(
            state.copyWith(listOfSelectedStatusesCreated: updatedList, randomNumber: randomNumber));
      }
      _reFilterContentListCreated();
    }
  }

  void _reFilterContentListCreated() {
    final allContent = state.created;
    final selectedStatuses = state.listOfSelectedStatusesCreated.map((e) => e.toLowerCase());

    if (selectedStatuses.isEmpty) {
      emit(state.copyWith(createdFiltered: allContent.model.content));
    } else {
      final updatedFilteredContent = allContent.model.content.where(
        (element) {
          final itemStatus = element.status?.title.toLowerCase();
          return selectedStatuses.contains(itemStatus);
        },
      ).toList();

      emit(state.copyWith(createdFiltered: updatedFilteredContent));
    }
  }

  void changeStatusAssigned(String status) async {
    if (status.isNotEmpty) {
      Random random = Random();
      int randomNumber = random.nextInt(100);

      if (state.listOfSelectedStatusesAssigned.contains(status)) {
        final updatedList = List<String>.from(state.listOfSelectedStatusesAssigned);
        updatedList.remove(status);

        emit(state.copyWith(
            listOfSelectedStatusesAssigned: updatedList, randomNumber: randomNumber));
      } else {
        final updatedList = List<String>.from(state.listOfSelectedStatusesAssigned);
        updatedList.add(status);

        emit(state.copyWith(
            listOfSelectedStatusesAssigned: updatedList, randomNumber: randomNumber));
      }
      _reFilterContentListAssigned();
    }
  }

  void _reFilterContentListAssigned() {
    final allContent = state.assigned;
    final selectedStatuses = state.listOfSelectedStatusesAssigned.map((e) => e.toLowerCase());

    if (selectedStatuses.isEmpty) {
      // No filters selected, include all content
      emit(state.copyWith(assignedFiltered: allContent.model.content));
    } else {
      final updatedFilteredContent = allContent.model.content.where(
        (element) {
          final itemStatus = element.status?.title.toLowerCase();
          return selectedStatuses.contains(itemStatus);
        },
      ).toList();

      emit(state.copyWith(assignedFiltered: updatedFilteredContent));
    }
  }

  void searchCreated(String value) {
    final filteredContent = state.created.model.content
        .where(
          (element) => (element.title).toLowerCase().contains(value.toLowerCase()),
        )
        .toList();

    emit(state.copyWith(createdFiltered: filteredContent));
  }

  void searchAssigned(String value) {
    final filtered = state.assigned.model.content
        .where(
          (element) => (element.title).toLowerCase().contains(value.toLowerCase()),
        )
        .toList();

    emit(state.copyWith(assignedFiltered: filtered));
  }

  void getButons() async {
    emit(state.copyWith(buttons: state.buttons.copyWith(blocProgress: BlocProgress.IS_LOADING)));

    try {
      final response = await ApiProvider.inquiryService.getButtons();

      if (response.isSuccessful) {
        final data = response.body;

        if (data != null) {
          emit(state.copyWith(
            buttons: state.buttons.copyWith(
              blocProgress: BlocProgress.LOADED,
              model: data,
            ),
          ));
        }
      } else {
        final error = ErrorResponse.fromJson(json.decode(response.error.toString()));

        emit(
          state.copyWith(
            buttons: state.buttons.copyWith(
              blocProgress: BlocProgress.FAILED,
              failureMessage: error.message,
            ),
          ),
        );
      }
    } catch (e) {
      debugPrint('Error getting inquiries: $e');
      emit(
        state.copyWith(
          buttons: state.buttons.copyWith(
            blocProgress: BlocProgress.FAILED,
            failureMessage: AppStrings.internalErrorMessage,
          ),
        ),
      );
    }
  }

  void clearAll() {
    emit(InquiryState.initial());
  }
}
