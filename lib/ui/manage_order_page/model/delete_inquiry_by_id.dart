import 'package:json_annotation/json_annotation.dart';

part 'delete_inquiry_by_id.g.dart';

@JsonSerializable(includeIfNull: true)
class DeleteInquiryByIdModel {
  final bool deleted;

  DeleteInquiryByIdModel({required this.deleted});

  factory DeleteInquiryByIdModel.fromJson(Map<String, dynamic> json) => _$DeleteInquiryByIdModelFromJson(json);

  Map<String, dynamic> toJson() => _$DeleteInquiryByIdModelToJson(this);
}
