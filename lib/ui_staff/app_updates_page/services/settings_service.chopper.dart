// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'settings_service.dart';

// **************************************************************************
// ChopperGenerator
// **************************************************************************

// ignore_for_file: type=lint
final class _$SettingsService extends SettingsService {
  _$SettingsService([ChopperClient? client]) {
    if (client == null) return;
    this.client = client;
  }

  @override
  final definitionType = SettingsService;

  @override
  Future<Response<AppVersionResponse>> getAppVersions() {
    final Uri $url = Uri.parse(
        'https://api.edulab.app/edulab_udea/api/v1/mobile/settings/versions');
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
    );
    return client.send<AppVersionResponse, AppVersionResponse>($request);
  }
}
