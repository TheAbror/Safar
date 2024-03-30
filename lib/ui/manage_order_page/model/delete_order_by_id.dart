import 'package:json_annotation/json_annotation.dart';

part 'delete_order_by_id.g.dart';

@JsonSerializable(includeIfNull: true)
class DeleteOrderByIdModel {
  final bool deleted;

  DeleteOrderByIdModel({required this.deleted});

  factory DeleteOrderByIdModel.fromJson(Map<String, dynamic> json) =>
      _$DeleteOrderByIdModelFromJson(json);

  Map<String, dynamic> toJson() => _$DeleteOrderByIdModelToJson(this);
}
