import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:safar/core/api/api_provider.dart';
import 'package:safar/core/bloc_progress/bloc_progress.dart';
import 'package:safar/core/box/current_user_box.dart';
import 'package:safar/core/constants/app_strings.dart';
import 'package:safar/core/db/preferences_services.dart';
import 'package:safar/core/db/shared_keys.dart';
import 'package:safar/core/utils/account_type.dart';
import 'package:safar/core/utils/all_models/all_models.dart';
import 'package:safar/core/utils/all_models/auth.dart';
import 'package:safar/ui/home_page/model/current_user.dart';

part 'auth_state.dart';

class AuthBloc extends Cubit<AuthState> {
  AuthBloc() : super(AuthState.initial());

  void clearAll() {
    emit(AuthState.initial());
  }

  void signIn(String username, String password, String contacts) async {
    emit(state.copyWith(blocProgress: BlocProgress.IS_LOADING));

    final request = SignInRequest(
      username: username,
      password: password,
      contacts: contacts,
      term_is_accepted: state.isAgreedToTerms,
    );

    try {
      final response = await ApiProvider.authService.signIn(request);

      if (response.isSuccessful) {
        final data = response.body;

        if (data != null) {
          final token = data.token;

          ApiProvider.create(token: token);
          await PreferencesServices.saveToken(token);

          emit(
            state.copyWith(
              data: data,
              blocProgress: BlocProgress.IS_SUCCESS,
            ),
          );

          var user = data.username;
          boxCurrentUser.put(
            ShPrefKeys.currentUser,
            CurrentUser(
              fullName: user,
              token: token,
            ),
          );
        }
      } else {
        emit(state.copyWith(
          blocProgress: BlocProgress.FAILED,
          failureMessage: response.error.toString(),
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

  void isPasswordHidden() {
    final item = !state.isPasswordHidden;
    emit(state.copyWith(isPasswordHidden: item));
  }

  void isAgreedToTerms(bool value) {
    emit(state.copyWith(isAgreedToTerms: value));
  }
}
