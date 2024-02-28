import 'package:safar/ui/manage_order_page/model/inquiry_item_request.dart';
import 'package:json_annotation/json_annotation.dart';

part 'inquiry_model.g.dart';

@JsonSerializable(includeIfNull: true, explicitToJson: true)
class MeasurementResponse {
  @JsonKey(defaultValue: '')
  final String label;
  @JsonKey(defaultValue: '')
  final String value;

  MeasurementResponse({
    required this.label,
    required this.value,
  });

  factory MeasurementResponse.fromJson(Map<String, dynamic> jsonData) =>
      _$MeasurementResponseFromJson(jsonData);
  Map<String, dynamic> toJson() => _$MeasurementResponseToJson(this);
}

@JsonSerializable(includeIfNull: true)
class CreateInquiryRequest {
  final int? id;
  final String title;
  final String description;
  final int recipient;
  final String recipient_group_type;
  @JsonKey(defaultValue: [])
  final List<InquiryItemRequest> items;

  CreateInquiryRequest({
    this.id,
    required this.title,
    required this.description,
    required this.recipient,
    required this.recipient_group_type,
    required this.items,
  });

  factory CreateInquiryRequest.fromJson(Map<String, dynamic> json) =>
      _$CreateInquiryRequestFromJson(json);

  Map<String, dynamic> toJson() => _$CreateInquiryRequestToJson(this);
}

// @JsonSerializable(includeIfNull: true)
// class InquiryRecipientGroupType {
//   final int? id;
//   final String title;
//   final String description;
//   final int recipient;
//   @JsonKey(defaultValue: [])
//   final List<InquiryItemRequest> items;

//   InquiryRecipientGroupType({
//     this.id,
//     required this.title,
//     required this.description,
//     required this.recipient,
//     required this.items,
//   });

//   factory InquiryRecipientGroupType.fromJson(Map<String, dynamic> json) => _$InquiryRecipientGroupTypeFromJson(json);

//   Map<String, dynamic> toJson() => _$InquiryRecipientGroupTypeToJson(this);
// }
