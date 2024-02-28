// ignore_for_file: non_constant_identifier_names

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:safar/core/bloc_progress/bloc_progress.dart';
import 'package:safar/ui/order_details_page/action/model/comments_model.dart';

part 'action_state.dart';

class ActionBloc extends Cubit<ActionState> {
  ActionBloc() : super(ActionState.initial());

  void clear() {
    emit(state.copyWith(
      blocProgress: BlocProgress.LOADED,
      failureMessage: '',
      isCommentSuccessfullyCreated: false,
    ));
  }

  // void getCommentsList() async {
  //   emit(state.copyWith(blocProgress: BlocProgress.IS_LOADING));

  //   try {
  //     final response = await ApiProvider.inquiryService.getCommentsList();

  //     if (response.isSuccessful) {
  //       final data = response.body;

  //       if (data != null) {
  //         emit(
  //           state.copyWith(
  //             commentsList: data,
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

  // void postComment(String comment_text) async {
  //   emit(state.copyWith(blocProgress: BlocProgress.IS_LOADING));

  //   final request = CommentsModelRequest(comment_text: comment_text);

  //   try {
  //     final response = await ApiProvider.inquiryService.postComment(request);

  //     if (response.isSuccessful) {
  //       final data = response.body;

  //       if (data != null) {
  //         emit(state.copyWith(
  //           isCommentSuccessfullyCreated: true,
  //           blocProgress: BlocProgress.LOADED,
  //         ));
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

  // void postInquiry(
  //   int id,
  //   String status,
  // ) async {
  //   emit(state.copyWith(blocProgress: BlocProgress.IS_LOADING));

  //   final request = InquiryActionRequestModel(
  //     id: id,
  //     status: status,
  //     deadline: state.meetingDate,
  //     comment: state.comment,
  //     involved_users: state.involvedUserIDs,
  //     inspector: state.involvedIncpectorIDs,
  //   );

  //   try {
  //     final response = await ApiProvider.inquiryService.postInquiry(request);

  //     if (response.isSuccessful) {
  //       final data = response.body;

  //       if (data != null) {
  //         emit(state.copyWith(blocProgress: BlocProgress.IS_SUCCESS));
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

  void comment(String comment) async {
    emit(state.copyWith(comment: comment));
    print(state.comment);
  }

  void setinvolvedUsers(List<int> involvedUserIDs) async {
    emit(state.copyWith(involvedUserIDs: involvedUserIDs));
    print(involvedUserIDs);
  }

  void setinvolvedInspectors(List<int> involvedInspectorIDs) async {
    emit(state.copyWith(involvedIncpectorIDs: involvedInspectorIDs));
    print(involvedInspectorIDs);
  }

  void meetingDate(String meetingDate) async {
    emit(state.copyWith(meetingDate: meetingDate));
    print(state.meetingDate);
  }
}
