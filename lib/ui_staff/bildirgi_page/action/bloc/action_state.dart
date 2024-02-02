part of 'action_bloc.dart';

class ActionState extends Equatable {
  final String comment;
  final List<int>? involvedUserIDs;
  final List<int>? involvedIncpectorIDs;
  final String meetingDate;
  final bool color;
  final List<CommentsResponse> commentsList;
  final bool isCommentSuccessfullyCreated;
  final String failureMessage;
  final BlocProgress blocProgress;

  const ActionState({
    required this.comment,
    this.involvedUserIDs,
    this.involvedIncpectorIDs,
    required this.meetingDate,
    required this.color,
    required this.commentsList,
    required this.isCommentSuccessfullyCreated,
    required this.failureMessage,
    required this.blocProgress,
  });

  factory ActionState.initial() {
    return const ActionState(
      comment: '',
      meetingDate: '',
      color: true,
      involvedUserIDs: [],
      involvedIncpectorIDs: [],
      commentsList: [],
      isCommentSuccessfullyCreated: false,
      blocProgress: BlocProgress.IS_LOADING,
      failureMessage: '',
    );
  }

  ActionState copyWith({
    String? comment,
    List<int>? involvedUserIDs,
    List<int>? involvedIncpectorIDs,
    String? meetingDate,
    bool? color,
    List<CommentsResponse>? commentsList,
    bool? isCommentSuccessfullyCreated,
    BlocProgress? blocProgress,
    String? failureMessage,
  }) {
    return ActionState(
      comment: comment ?? this.comment,
      involvedUserIDs: involvedUserIDs ?? this.involvedUserIDs,
      involvedIncpectorIDs: involvedIncpectorIDs ?? this.involvedIncpectorIDs,
      meetingDate: meetingDate ?? this.meetingDate,
      color: color ?? this.color,
      commentsList: commentsList ?? this.commentsList,
      isCommentSuccessfullyCreated: isCommentSuccessfullyCreated ?? this.isCommentSuccessfullyCreated,
      failureMessage: failureMessage ?? this.failureMessage,
      blocProgress: blocProgress ?? this.blocProgress,
    );
  }

  @override
  List<Object?> get props => [
        comment,
        involvedUserIDs,
        involvedIncpectorIDs,
        meetingDate,
        color,
        commentsList,
        isCommentSuccessfullyCreated,
        blocProgress,
        failureMessage,
      ];
}
