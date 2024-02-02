// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'inquiry_action_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

InquiryActionRequestModel _$InquiryActionRequestModelFromJson(
        Map<String, dynamic> json) =>
    InquiryActionRequestModel(
      id: json['id'] as int,
      status: json['status'] as String,
      deadline: json['deadline'] as String,
      comment: json['comment'] as String,
      involved_users: (json['involved_users'] as List<dynamic>?)
          ?.map((e) => e as int)
          .toList(),
      inspector:
          (json['inspector'] as List<dynamic>?)?.map((e) => e as int).toList(),
    );

Map<String, dynamic> _$InquiryActionRequestModelToJson(
        InquiryActionRequestModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'status': instance.status,
      'deadline': instance.deadline,
      'comment': instance.comment,
      'involved_users': instance.involved_users,
      'inspector': instance.inspector,
    };
