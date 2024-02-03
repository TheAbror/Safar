import 'package:json_annotation/json_annotation.dart';

part 'auth.g.dart';

@JsonSerializable(includeIfNull: true)
class SignInRequest {
  final String username;
  final String password;
  final String type;

  SignInRequest({
    required this.username,
    required this.password,
    required this.type,
  });

  factory SignInRequest.fromJson(Map<String, dynamic> json) => _$SignInRequestFromJson(json);

  Map<String, dynamic> toJson() => _$SignInRequestToJson(this);
}
