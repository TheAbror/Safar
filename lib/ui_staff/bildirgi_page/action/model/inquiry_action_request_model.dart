import 'package:json_annotation/json_annotation.dart';

part 'inquiry_action_request_model.g.dart';

@JsonSerializable(includeIfNull: true)
class InquiryActionRequestModel {
  final int id;
  final String status;
  final String deadline;
  final String comment;
  final List<int>? involved_users;
  final List<int>? inspector;

  InquiryActionRequestModel({
    required this.id,
    required this.status,
    required this.deadline,
    required this.comment,
    required this.involved_users,
    required this.inspector,
  });

  factory InquiryActionRequestModel.fromJson(Map<String, dynamic> json) => _$InquiryActionRequestModelFromJson(json);

  Map<String, dynamic> toJson() => _$InquiryActionRequestModelToJson(this);
}
