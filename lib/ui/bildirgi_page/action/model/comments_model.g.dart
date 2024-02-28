// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'comments_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CommentsResponse _$CommentsResponseFromJson(Map<String, dynamic> json) =>
    CommentsResponse(
      value: json['value'] as int? ?? 0,
      label: json['label'] as String? ?? '',
    );

Map<String, dynamic> _$CommentsResponseToJson(CommentsResponse instance) =>
    <String, dynamic>{
      'label': instance.label,
      'value': instance.value,
    };

CommentsModelRequest _$CommentsModelRequestFromJson(
        Map<String, dynamic> json) =>
    CommentsModelRequest(
      comment_text: json['comment_text'] as String,
    );

Map<String, dynamic> _$CommentsModelRequestToJson(
        CommentsModelRequest instance) =>
    <String, dynamic>{
      'comment_text': instance.comment_text,
    };
