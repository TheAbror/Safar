import 'package:json_annotation/json_annotation.dart';

part 'terms_response.g.dart';

@JsonSerializable(includeIfNull: true, explicitToJson: true)
class TermsResponse {
  @JsonKey(defaultValue: false)
  final bool isAccept;
  @JsonKey(defaultValue: '')
  final String text;

  TermsResponse({
    required this.isAccept,
    required this.text,
  });

  factory TermsResponse.fromJson(Map<String, dynamic> jsonData) =>
      _$TermsResponseFromJson(jsonData);
  Map<String, dynamic> toJson() => _$TermsResponseToJson(this);
}
