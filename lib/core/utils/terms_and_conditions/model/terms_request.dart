import 'package:json_annotation/json_annotation.dart';

part 'terms_request.g.dart';

@JsonSerializable(includeIfNull: true, explicitToJson: true)
class TermsRequest {
  @JsonKey(defaultValue: false)
  final bool isAccept;
  @JsonKey(defaultValue: '')
  final String text;

  TermsRequest({
    required this.isAccept,
    required this.text,
  });

  factory TermsRequest.fromJson(Map<String, dynamic> jsonData) => _$TermsRequestFromJson(jsonData);
  Map<String, dynamic> toJson() => _$TermsRequestToJson(this);
}
