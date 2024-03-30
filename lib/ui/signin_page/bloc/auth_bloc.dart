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
import 'package:safar/core/utils/models/all_models.dart';
import 'package:safar/core/utils/models/auth.dart';
import 'package:safar/ui/home_page/model/current_user.dart';

part 'auth_state.dart';

class AuthBloc extends Cubit<AuthState> {
  AuthBloc() : super(AuthState.initial());

  void clearAll() {
    emit(AuthState.initial());
  }

  void signIn(String username, String password, String contacts) async {
    emit(state.copyWith(blocProgress: BlocProgress.IS_LOADING, isWaiting: true));

    final request = SignInRequest(username: username, password: password, contacts: contacts);

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
              isWaiting: false,
            ),
          );

          var user = data.userInfo;
          boxCurrentUser.put(
            ShPrefKeys.currentUser,
            CurrentUser(
              fullName: '${user.firstname} ${user.lastname}',
              shortName: '${user.firstname[0].toUpperCase()} ${user.lastname[0].toUpperCase()}',
              token: token,
              userID: username,
            ),
          );
        }
      } else {
        emit(state.copyWith(
          blocProgress: BlocProgress.FAILED,
          isWaiting: false,
          failureMessage: response.error.toString(),
        ));
      }
    } catch (e) {
      debugPrint('Error getting inquiries: $e');
      emit(state.copyWith(
        blocProgress: BlocProgress.FAILED,
        isWaiting: false,
        failureMessage: AppStrings.internalErrorMessage,
      ));
    }
  }

  void isPasswordHidden() {
    final item = !state.isPasswordHidden;
    emit(state.copyWith(isPasswordHidden: item));
  }
}
