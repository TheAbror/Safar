import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'staff_model.g.dart';

@JsonSerializable(includeIfNull: true, explicitToJson: true)
class StaffResponse extends Equatable {
  @JsonKey(defaultValue: 0)
  final int id;
  @JsonKey(defaultValue: 0)
  final int user_id;
  @JsonKey(defaultValue: 0)
  final int username;
  @JsonKey(defaultValue: '')
  final String firstname;
  @JsonKey(defaultValue: '')
  final String lastname;
  @JsonKey(defaultValue: '')
  final String midname;
  @JsonKey(defaultValue: '')
  final String gender;
  @JsonKey(defaultValue: '')
  final String passport_id;

  const StaffResponse({
    required this.id,
    required this.user_id,
    required this.username,
    required this.firstname,
    required this.lastname,
    required this.midname,
    required this.gender,
    required this.passport_id,
  });

  factory StaffResponse.fromJson(Map<String, dynamic> jsonData) => _$StaffResponseFromJson(jsonData);
  Map<String, dynamic> toJson() => _$StaffResponseToJson(this);

  @override
  List<Object?> get props => [id, user_id, username, firstname, lastname, midname, gender, passport_id];
}
