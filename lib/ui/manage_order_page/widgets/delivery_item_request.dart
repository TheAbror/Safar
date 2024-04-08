import 'package:json_annotation/json_annotation.dart';

part 'delivery_item_request.g.dart';

@JsonSerializable(includeIfNull: true)
class DeliveryItemRequest {
  final String name;
  final double quantity;

  DeliveryItemRequest({
    required this.name,
    required this.quantity,
  });

  factory DeliveryItemRequest.fromJson(Map<String, dynamic> json) =>
      _$DeliveryItemRequestFromJson(json);

  Map<String, dynamic> toJson() => _$DeliveryItemRequestToJson(this);
}
