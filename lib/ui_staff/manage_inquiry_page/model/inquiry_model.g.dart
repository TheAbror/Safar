// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'inquiry_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MeasurementResponse _$MeasurementResponseFromJson(Map<String, dynamic> json) =>
    MeasurementResponse(
      label: json['label'] as String? ?? '',
      value: json['value'] as String? ?? '',
    );

Map<String, dynamic> _$MeasurementResponseToJson(
        MeasurementResponse instance) =>
    <String, dynamic>{
      'label': instance.label,
      'value': instance.value,
    };

CreateInquiryRequest _$CreateInquiryRequestFromJson(
        Map<String, dynamic> json) =>
    CreateInquiryRequest(
      id: json['id'] as int?,
      title: json['title'] as String,
      description: json['description'] as String,
      recipient: json['recipient'] as int,
      recipient_group_type: json['recipient_group_type'] as String,
      items: (json['items'] as List<dynamic>?)
              ?.map(
                  (e) => InquiryItemRequest.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
    );

Map<String, dynamic> _$CreateInquiryRequestToJson(
        CreateInquiryRequest instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'description': instance.description,
      'recipient': instance.recipient,
      'recipient_group_type': instance.recipient_group_type,
      'items': instance.items,
    };
