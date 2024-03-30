import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:safar/core/bloc_progress/bloc_progress.dart';

part 'terms_state.dart';

class TermsBloc extends Cubit<TermsState> {
  TermsBloc() : super(TermsState.initial());

  void clearAll() {
    emit(TermsState.initial());
  }
}
