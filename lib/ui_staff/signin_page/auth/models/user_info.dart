import 'package:json_annotation/json_annotation.dart';

part 'user_info.g.dart';

@JsonSerializable(includeIfNull: true, explicitToJson: true)
class SignInResponse {
  @JsonKey(defaultValue: '')
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
  @JsonKey(defaultValue: 'error occured', name: 'first_name')
  String firstname;
  @JsonKey(defaultValue: '', name: 'last_name')
  String lastname;
  @JsonKey(defaultValue: '')
  String email;
  @JsonKey(defaultValue: '', name: 'date_joined')
  String dateJoined;
  @JsonKey(defaultValue: '', name: 'last_login')
  String lastLogin;
  @JsonKey(defaultValue: false, name: 'is_superuser')
  bool isSuperUser;
  @JsonKey(defaultValue: false, name: 'is_staff')
  bool isStaff;
  @JsonKey(defaultValue: false, name: 'is_active')
  bool isActive;
  @JsonKey(defaultValue: '')
  String username;
  @JsonKey(defaultValue: '')
  String password;

  UserInfoResponse({
    required this.id,
    required this.firstname,
    required this.lastname,
    required this.dateJoined,
    required this.lastLogin,
    required this.isStaff,
    required this.email,
    required this.isActive,
    required this.isSuperUser,
    required this.username,
    required this.password,
  });

  factory UserInfoResponse.fromJson(Map<String, dynamic> json) => _$UserInfoResponseFromJson(json);

  Map<String, dynamic> toJson() => _$UserInfoResponseToJson(this);
}

// --- Account ---
// endpoint: /api/account/

@JsonSerializable(includeIfNull: true, explicitToJson: true)
class Account {
  @JsonKey(defaultValue: 0)
  int id;
  @JsonKey(defaultValue: '')
  String contacts;
  @JsonKey(defaultValue: '')
  String photo;
  @JsonKey(defaultValue: '', name: 'about_user')
  String aboutUser;

  Account({
    required this.id,
    required this.contacts,
    required this.photo,
    required this.aboutUser,
  });

  factory Account.fromJson(Map<String, dynamic> json) => _$AccountFromJson(json);

  Map<String, dynamic> toJson() => _$AccountToJson(this);
}

// --- Register driver ---
// endpoint: /api/register_driver/
// allowed requests: POST

@JsonSerializable(includeIfNull: true, explicitToJson: true)
class DriverRegistration {
  @JsonKey(defaultValue: '', name: 'car_model')
  String carModel;
  @JsonKey(defaultValue: '', name: 'car_color')
  String carColor;
  @JsonKey(defaultValue: 0, name: 'car_year')
  int carYear;
  @JsonKey(defaultValue: '', name: 'license_plate')
  String licencePlate;

  DriverRegistration({
    required this.carModel,
    required this.carColor,
    required this.carYear,
    required this.licencePlate,
  });

  factory DriverRegistration.fromJson(Map<String, dynamic> json) =>
      _$DriverRegistrationFromJson(json);

  Map<String, dynamic> toJson() => _$DriverRegistrationToJson(this);
}

// --- Driver profile ---
// endpoint: /api/driver_profile/
// allowed requests: GET, PATCH

@JsonSerializable(includeIfNull: true, explicitToJson: true)
class DriverProfie {
  @JsonKey(defaultValue: 0)
  int id;
  @JsonKey(defaultValue: 0)
  int user;
  @JsonKey(defaultValue: '', name: 'car_model')
  String carModel;
  @JsonKey(defaultValue: '', name: 'car_color')
  String carColor;
  @JsonKey(defaultValue: 0, name: 'car_year')
  int carYear;
  @JsonKey(defaultValue: '', name: 'license_plate')
  String licencePlate;
  @JsonKey(defaultValue: '', name: 'registered_at')
  String registeredAt;

  DriverProfie({
    required this.id,
    required this.user,
    required this.carModel,
    required this.carColor,
    required this.carYear,
    required this.licencePlate,
    required this.registeredAt,
  });

  factory DriverProfie.fromJson(Map<String, dynamic> json) => _$DriverProfieFromJson(json);

  Map<String, dynamic> toJson() => _$DriverProfieToJson(this);
}
