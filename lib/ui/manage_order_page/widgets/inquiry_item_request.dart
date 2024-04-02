import 'package:json_annotation/json_annotation.dart';

part 'inquiry_item_request.g.dart';

@JsonSerializable(includeIfNull: true)
class InquiryItemRequest {
  final String name;
  final double quantity;

  InquiryItemRequest({
    required this.name,
    required this.quantity,
  });

  factory InquiryItemRequest.fromJson(Map<String, dynamic> json) =>
      _$InquiryItemRequestFromJson(json);

  Map<String, dynamic> toJson() => _$InquiryItemRequestToJson(this);
}
