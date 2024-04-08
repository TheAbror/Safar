// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'delivery_item_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DeliveryItemRequest _$DeliveryItemRequestFromJson(Map<String, dynamic> json) =>
    DeliveryItemRequest(
      name: json['name'] as String,
      quantity: (json['quantity'] as num).toDouble(),
    );

Map<String, dynamic> _$DeliveryItemRequestToJson(
        DeliveryItemRequest instance) =>
    <String, dynamic>{
      'name': instance.name,
      'quantity': instance.quantity,
    };
