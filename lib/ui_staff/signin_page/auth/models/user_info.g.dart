// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SignInResponse _$SignInResponseFromJson(Map<String, dynamic> json) =>
    SignInResponse(
      token: json['token'] as String? ?? '',
      userInfo: UserInfoResponse.fromJson(json['user'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$SignInResponseToJson(SignInResponse instance) =>
    <String, dynamic>{
      'token': instance.token,
      'user': instance.userInfo.toJson(),
    };

UserInfoResponse _$UserInfoResponseFromJson(Map<String, dynamic> json) =>
    UserInfoResponse(
      id: json['id'] as int? ?? 0,
      firstname: json['first_name'] as String? ?? 'error occured',
      lastname: json['last_name'] as String? ?? '',
      dateJoined: json['date_joined'] as String? ?? '',
      lastLogin: json['last_login'] as String? ?? '',
      isStaff: json['is_staff'] as bool? ?? false,
      email: json['email'] as String? ?? '',
      isActive: json['is_active'] as bool? ?? false,
      isSuperUser: json['is_superuser'] as bool? ?? false,
      username: json['username'] as String? ?? '',
      password: json['password'] as String? ?? '',
    );

Map<String, dynamic> _$UserInfoResponseToJson(UserInfoResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'first_name': instance.firstname,
      'last_name': instance.lastname,
      'email': instance.email,
      'date_joined': instance.dateJoined,
      'last_login': instance.lastLogin,
      'is_superuser': instance.isSuperUser,
      'is_staff': instance.isStaff,
      'is_active': instance.isActive,
      'username': instance.username,
      'password': instance.password,
    };

Account _$AccountFromJson(Map<String, dynamic> json) => Account(
      id: json['id'] as int? ?? 0,
      contacts: json['contacts'] as String? ?? '',
      photo: json['photo'] as String? ?? '',
      aboutUser: json['about_user'] as String? ?? '',
    );

Map<String, dynamic> _$AccountToJson(Account instance) => <String, dynamic>{
      'id': instance.id,
      'contacts': instance.contacts,
      'photo': instance.photo,
      'about_user': instance.aboutUser,
    };
