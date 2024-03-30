// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SignInRequest _$SignInRequestFromJson(Map<String, dynamic> json) =>
    SignInRequest(
      username: json['username'] as String,
      password: json['password'] as String,
      contacts: json['contacts'] as String,
      term_is_accepted: json['term_is_accepted'] as bool,
    );

Map<String, dynamic> _$SignInRequestToJson(SignInRequest instance) =>
    <String, dynamic>{
      'username': instance.username,
      'password': instance.password,
      'contacts': instance.contacts,
      'term_is_accepted': instance.term_is_accepted,
    };
