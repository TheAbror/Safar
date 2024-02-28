// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'inquiry_item_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

InquiryItemRequest _$InquiryItemRequestFromJson(Map<String, dynamic> json) =>
    InquiryItemRequest(
      name: json['name'] as String,
      quantity: (json['quantity'] as num).toDouble(),
      measurement: json['measurement'] as String?,
    );

Map<String, dynamic> _$InquiryItemRequestToJson(InquiryItemRequest instance) =>
    <String, dynamic>{
      'name': instance.name,
      'quantity': instance.quantity,
      'measurement': instance.measurement,
    };
