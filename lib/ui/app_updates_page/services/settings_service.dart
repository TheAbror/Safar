import 'package:chopper/chopper.dart';
import 'package:safar/core/constants/app_strings.dart';

import '../models/app_version_response.dart';

part 'settings_service.chopper.dart';

@ChopperApi(baseUrl: AppStrings.baseLive)
abstract class SettingsService extends ChopperService {
  static SettingsService create([ChopperClient? client]) =>
      _$SettingsService(client ?? ChopperClient());

  @Get(path: AppStrings.appVersions)
  Future<Response<AppVersionResponse>> getAppVersions();
}
