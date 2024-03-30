import 'package:json_annotation/json_annotation.dart';

part 'app_version_response.g.dart';

@JsonSerializable(includeIfNull: true, explicitToJson: true)
class AppVersionResponse {
  @JsonKey(name: 'show_maintanance', defaultValue: false)
  final bool showMaintanance;
  @JsonKey(name: 'ios_min_version', defaultValue: 1)
  final int iosMinVersion;
  @JsonKey(name: 'ios_latest_version', defaultValue: 1)
  final int iosLatestVersion;
  @JsonKey(name: 'android_min_version', defaultValue: 1)
  final int androidMinVersion;
  @JsonKey(name: 'android_latest_version', defaultValue: 1)
  final int androidLatestVersion;
  @JsonKey(name: 'ios_store_url', defaultValue: '')
  final String iosStoreUrl;
  @JsonKey(name: 'android_store_url', defaultValue: '')
  final String androidStoreUrl;
  @JsonKey(defaultValue: '')
  final String title;
  @JsonKey(defaultValue: '')
  final String description;
  @JsonKey(defaultValue: '')
  final String terms;
  @JsonKey(defaultValue: '')
  final String created_at;

  AppVersionResponse({
    required this.showMaintanance,
    required this.iosMinVersion,
    required this.iosLatestVersion,
    required this.androidMinVersion,
    required this.androidLatestVersion,
    required this.iosStoreUrl,
    required this.androidStoreUrl,
    required this.title,
    required this.description,
    required this.terms,
    required this.created_at,
  });

  factory AppVersionResponse.fromJson(Map<String, dynamic> json) =>
      _$AppVersionResponseFromJson(json);

  Map<String, dynamic> toJson() => _$AppVersionResponseToJson(this);
}
