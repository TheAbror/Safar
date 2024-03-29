import 'package:equatable/equatable.dart';
import 'package:safar/core/bloc_progress/bloc_progress.dart';

class SuperBlocProgress<T> extends Equatable {
  final T model;
  final BlocProgress blocProgress;
  final String failureMessage;

  const SuperBlocProgress({
    required this.model,
    this.blocProgress = BlocProgress.NOT_STARTED,
    this.failureMessage = '',
  });

  SuperBlocProgress<T> copyWith({
    T? model,
    BlocProgress? blocProgress,
    String? failureMessage,
  }) {
    return SuperBlocProgress<T>(
      model: model ?? this.model,
      blocProgress: blocProgress ?? this.blocProgress,
      failureMessage: failureMessage ?? this.failureMessage,
    );
  }

  @override
  List<dynamic> get props => [
        model,
        blocProgress,
        failureMessage,
      ];
}
