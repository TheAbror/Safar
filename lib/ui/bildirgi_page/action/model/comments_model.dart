import 'package:json_annotation/json_annotation.dart';

part 'comments_model.g.dart';

@JsonSerializable(includeIfNull: true, explicitToJson: true)
class CommentsResponse {
  @JsonKey(defaultValue: '')
  final String label;
  @JsonKey(defaultValue: 0)
  final int value;

  CommentsResponse({
    required this.value,
    required this.label,
  });

  factory CommentsResponse.fromJson(Map<String, dynamic> jsonData) => _$CommentsResponseFromJson(jsonData);
  Map<String, dynamic> toJson() => _$CommentsResponseToJson(this);
}

@JsonSerializable(includeIfNull: true)
class CommentsModelRequest {
  final String comment_text;

  CommentsModelRequest({
    required this.comment_text,
  });

  factory CommentsModelRequest.fromJson(Map<String, dynamic> json) => _$CommentsModelRequestFromJson(json);

  Map<String, dynamic> toJson() => _$CommentsModelRequestToJson(this);
}
