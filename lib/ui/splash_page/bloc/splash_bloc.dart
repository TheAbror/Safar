import 'dart:convert';
import 'dart:io';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:safar/core/bloc_progress/bloc_progress.dart';
import 'package:safar/core/bloc_progress/error.dart';
import 'package:safar/core/constants/app_strings.dart';
import 'package:safar/core/db/preferences_services.dart';
import 'package:safar/core/utils/account_type.dart';
import '../../../core/api/api_provider.dart';
import '../../app_updates_page/models/app_version_response.dart';
import '../auth_status/splash_auth_status.dart';

part 'splash_state.dart';

class SplashBloc extends Cubit<SplashState> {
  SplashBloc() : super(SplashState.initial());

  void clearAll() {
    emit(SplashState.initial());
  }

  Future setupInitialSettings() async {
    await PreferencesServices.init();
    final token = PreferencesServices.getToken();

    ApiProvider.create(token: token ?? '');

    if (token == null) {
      emit(
        state.copyWith(
          authStatus: SplashAuthStatus.notAuthorized,
        ),
      );
    } else {
      emit(
        state.copyWith(
          authStatus: SplashAuthStatus.authorized,
        ),
      );
    }
  }

  void getMinimumAppVersion() async {
    bool showMaintanance = false;
    int minVersion = await PreferencesServices.getMinimumAppVersion() ?? 0;
    int latestAppVersion = await PreferencesServices.getLatestAppVersion() ?? 0;

    emit(state.copyWith(blocProgress: BlocProgress.IS_LOADING));

    await Future.delayed(const Duration(seconds: 2));

    try {
      final response = await ApiProvider.settingsService.getAppVersions();

      if (response.isSuccessful) {
        print(response);
        final data = response.body;

        if (data != null) {
          showMaintanance = data.showMaintanance;
          minVersion = Platform.isAndroid ? data.androidMinVersion : data.iosMinVersion;
          latestAppVersion = Platform.isAndroid ? data.androidLatestVersion : data.iosLatestVersion;

          PreferencesServices.saveShowMaintenance(showMaintanance);
          PreferencesServices.saveMinimumAppVersion(minVersion);
          PreferencesServices.saveLatestAppVersion(latestAppVersion);
          PreferencesServices.saveAppVersionTitle(data.title);
          PreferencesServices.saveAppVersionDescription(data.description);
          PreferencesServices.saveAndroidStoreUrl(data.androidStoreUrl);
          PreferencesServices.saveIOSstoreUrl(data.iosStoreUrl);

          emit(state.copyWith(
            appVersionData: data,
            terms: data.terms,
            blocProgress: BlocProgress.LOADED,
          ));
        }
      } else {
        final error = ErrorResponse.fromJson(json.decode(response.error.toString()));

        emit(state.copyWith(
          blocProgress: BlocProgress.FAILED,
          failureMessage: error.message,
        ));
      }
    } catch (e) {
      emit(state.copyWith(
        blocProgress: BlocProgress.FAILED,
        failureMessage: AppStrings.internalErrorMessage,
      ));
    }

    emit(state.copyWith(blocProgress: BlocProgress.LOADED));

    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    int buildNumber = int.parse(packageInfo.buildNumber);

    if (showMaintanance || buildNumber < minVersion || buildNumber < latestAppVersion) {
      emit(state.copyWith(showAppUpdatesPage: true));
    } else {
      setupInitialSettings();
    }
  }
}
