// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'staff_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

StaffResponse _$StaffResponseFromJson(Map<String, dynamic> json) =>
    StaffResponse(
      id: json['id'] as int? ?? 0,
      user_id: json['user_id'] as int? ?? 0,
      username: json['username'] as int? ?? 0,
      firstname: json['firstname'] as String? ?? '',
      lastname: json['lastname'] as String? ?? '',
      midname: json['midname'] as String? ?? '',
      gender: json['gender'] as String? ?? '',
      passport_id: json['passport_id'] as String? ?? '',
    );

Map<String, dynamic> _$StaffResponseToJson(StaffResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'user_id': instance.user_id,
      'username': instance.username,
      'firstname': instance.firstname,
      'lastname': instance.lastname,
      'midname': instance.midname,
      'gender': instance.gender,
      'passport_id': instance.passport_id,
    };
