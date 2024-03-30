part of 'terms_bloc.dart';

class TermsState extends Equatable {
  final BlocProgress blocProgress;
  final String failureMessage;

  const TermsState({
    required this.blocProgress,
    required this.failureMessage,
  });

  factory TermsState.initial() {
    return TermsState(
      blocProgress: BlocProgress.NOT_STARTED,
      failureMessage: '',
    );
  }

  TermsState copyWith({
    BlocProgress? blocProgress,
    String? failureMessage,
  }) {
    return TermsState(
      blocProgress: blocProgress ?? this.blocProgress,
      failureMessage: failureMessage ?? this.failureMessage,
    );
  }

  @override
  List<Object?> get props => [
        blocProgress,
        failureMessage,
      ];
}
