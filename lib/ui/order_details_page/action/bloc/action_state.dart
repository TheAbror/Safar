part of 'action_bloc.dart';

class ActionState extends Equatable {
  final bool color;
  final bool isCommentSuccessfullyCreated;
  final String failureMessage;
  final BlocProgress blocProgress;

  const ActionState({
    required this.color,
    required this.isCommentSuccessfullyCreated,
    required this.failureMessage,
    required this.blocProgress,
  });

  factory ActionState.initial() {
    return const ActionState(
      color: true,
      isCommentSuccessfullyCreated: false,
      blocProgress: BlocProgress.IS_LOADING,
      failureMessage: '',
    );
  }

  ActionState copyWith({
    String? comment,
    bool? color,
    bool? isCommentSuccessfullyCreated,
    BlocProgress? blocProgress,
    String? failureMessage,
  }) {
    return ActionState(
      color: color ?? this.color,
      isCommentSuccessfullyCreated:
          isCommentSuccessfullyCreated ?? this.isCommentSuccessfullyCreated,
      failureMessage: failureMessage ?? this.failureMessage,
      blocProgress: blocProgress ?? this.blocProgress,
    );
  }

  @override
  List<Object?> get props => [
        color,
        isCommentSuccessfullyCreated,
        blocProgress,
        failureMessage,
      ];
}
