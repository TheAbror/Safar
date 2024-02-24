import 'package:json_annotation/json_annotation.dart';

part 'user_info.g.dart';

@JsonSerializable(includeIfNull: true, explicitToJson: true)
class SignInResponse {
  @JsonKey()
  String token;
  @JsonKey(name: 'user')
  UserInfoResponse userInfo;

  SignInResponse({required this.token, required this.userInfo});

  factory SignInResponse.fromJson(Map<String, dynamic> json) => _$SignInResponseFromJson(json);

  Map<String, dynamic> toJson() => _$SignInResponseToJson(this);
}

@JsonSerializable(includeIfNull: true, explicitToJson: true)
class UserInfoResponse {
  @JsonKey(defaultValue: 0)
  int id;
  @JsonKey(defaultValue: 'error occured')
  String firstname;
  @JsonKey(defaultValue: '')
  String lastname;
  //udea§
  @JsonKey(defaultValue: 0)
  int username;
  @JsonKey(name: 'account_type', defaultValue: '')
  String accountType;
  @JsonKey(defaultValue: '')
  String status;
  @JsonKey(defaultValue: '')
  String email;
  @JsonKey(defaultValue: [''])
  List<String> roles;

  UserInfoResponse({
    required this.id,
    required this.firstname,
    required this.lastname,
    required this.accountType,
    required this.status,
    required this.username,
    required this.email,
    required this.roles,
  });

  factory UserInfoResponse.fromJson(Map<String, dynamic> json) => _$UserInfoResponseFromJson(json);

  Map<String, dynamic> toJson() => _$UserInfoResponseToJson(this);
}
