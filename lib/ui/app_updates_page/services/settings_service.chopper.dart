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
    final Uri $url = Uri.parse('http://10.12.1.157:8000/api/version');
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
    );
    return client.send<AppVersionResponse, AppVersionResponse>($request);
  }
}
