import 'package:safar/ui_staff/manage_inquiry_page/model/inquiry_model.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'inquiry_list_model.g.dart';

@JsonSerializable(includeIfNull: true, explicitToJson: true)
class InquiryListResponse {
  @JsonKey(defaultValue: [])
  List<InquiryListItemResponse> content;
  @JsonKey(defaultValue: false)
  final bool last;
  @JsonKey(defaultValue: 0, name: 'total_elements')
  final int totalElements;
  @JsonKey(defaultValue: 0, name: 'total_pages')
  final int totalPages;
  @JsonKey()
  Pageable pageable;

  InquiryListResponse({
    required this.last,
    required this.totalElements,
    required this.totalPages,
    required this.pageable,
    required this.content,
  });

  factory InquiryListResponse.fromJson(Map<String, dynamic> jsonData) =>
      _$InquiryListResponseFromJson(jsonData);
  Map<String, dynamic> toJson() => _$InquiryListResponseToJson(this);
}

@JsonSerializable(includeIfNull: true, explicitToJson: true)
// ignore: must_be_immutable
class InquiryListItemResponse extends Equatable {
  @JsonKey(defaultValue: 0)
  final int id;
  @JsonKey(defaultValue: '')
  final String title;
  @JsonKey(defaultValue: '')
  final String description;
  @JsonKey(defaultValue: [])
  List<Items> items;
  @JsonKey()
  Status? status;
  @JsonKey(defaultValue: 0)
  final int created_date;
  @JsonKey(defaultValue: 0)
  final int updated_date;
  @JsonKey()
  Created? created;
  @JsonKey(defaultValue: false)
  final bool editable;
  @JsonKey(defaultValue: [])
  List<History> history;
  @JsonKey(defaultValue: [])
  List<InquiryActionButtons> buttons;
  @JsonKey(name: 'author_department')
  AuthorDepartment authorDepartment;
  @JsonKey(name: 'author_position')
  final AuthorPosition authorPosition;
  @JsonKey()
  final Recipient recipient;
  @JsonKey(name: 'recipient_group_type')
  final RecipientGroupType recipientGroup;
  @JsonKey(defaultValue: '', name: 'recipient_custom')
  final String recipientCustom;
  @JsonKey(defaultValue: '', name: 'recipient_position')
  final String recipientPostion;
  @JsonKey(defaultValue: '', name: 'recipient_department')
  final String recipientDepartment;

  InquiryListItemResponse({
    required this.id,
    required this.title,
    required this.description,
    required this.items,
    this.status,
    required this.created_date,
    required this.updated_date,
    this.created,
    required this.editable,
    required this.history,
    required this.buttons,
    required this.authorDepartment,
    required this.authorPosition,
    required this.recipient,
    required this.recipientGroup,
    required this.recipientCustom,
    required this.recipientPostion,
    required this.recipientDepartment,
  });

  factory InquiryListItemResponse.fromJson(Map<String, dynamic> json) =>
      _$InquiryListItemResponseFromJson(json);

  Map<String, dynamic> toJson() => _$InquiryListItemResponseToJson(this);

  @override
  List<Object?> get props => [
        id,
        title,
        description,
        items,
        status,
        created_date,
        updated_date,
        created,
        history,
        buttons,
      ];
}

@JsonSerializable(includeIfNull: true, explicitToJson: true)
class Pageable {
  @JsonKey(defaultValue: 0)
  final int offset;
  @JsonKey(defaultValue: 0, name: 'page_number')
  final int pageNumber;
  @JsonKey(defaultValue: 0, name: 'page_size')
  final int pageSize;
  @JsonKey(defaultValue: false)
  final bool paged;
  @JsonKey()
  final Sort sort;
  @JsonKey(defaultValue: false)
  final bool unpaged;

  Pageable({
    required this.offset,
    required this.pageNumber,
    required this.pageSize,
    required this.paged,
    required this.sort,
    required this.unpaged,
  });

  factory Pageable.fromJson(Map<String, dynamic> jsonData) => _$PageableFromJson(jsonData);
  Map<String, dynamic> toJson() => _$PageableToJson(this);
}

@JsonSerializable(includeIfNull: true, explicitToJson: true)
class Sort {
  @JsonKey(defaultValue: false)
  final bool unsorted;
  @JsonKey(defaultValue: false)
  final bool sorted;
  @JsonKey(defaultValue: false)
  final bool empty;

  Sort({
    required this.unsorted,
    required this.sorted,
    required this.empty,
  });

  factory Sort.fromJson(Map<String, dynamic> jsonData) => _$SortFromJson(jsonData);
  Map<String, dynamic> toJson() => _$SortToJson(this);
}

@JsonSerializable(includeIfNull: true, explicitToJson: true)
class Recipient {
  @JsonKey(defaultValue: 0)
  final int value;
  @JsonKey(defaultValue: '')
  final String label;

  Recipient({
    required this.value,
    required this.label,
  });

  factory Recipient.fromJson(Map<String, dynamic> json) => _$RecipientFromJson(json);

  Map<String, dynamic> toJson() => _$RecipientToJson(this);
}

@JsonSerializable(includeIfNull: true, explicitToJson: true)
class RecipientGroupType {
  @JsonKey(defaultValue: '')
  final String value;
  @JsonKey(defaultValue: '')
  final String label;

  RecipientGroupType({
    required this.value,
    required this.label,
  });

  factory RecipientGroupType.fromJson(Map<String, dynamic> json) =>
      _$RecipientGroupTypeFromJson(json);

  Map<String, dynamic> toJson() => _$RecipientGroupTypeToJson(this);
}

@JsonSerializable(includeIfNull: true, explicitToJson: true)
class AuthorDepartment {
  @JsonKey(defaultValue: 0)
  final int value;
  @JsonKey(defaultValue: '')
  final String label;

  AuthorDepartment({
    required this.value,
    required this.label,
  });

  factory AuthorDepartment.fromJson(Map<String, dynamic> json) => _$AuthorDepartmentFromJson(json);

  Map<String, dynamic> toJson() => _$AuthorDepartmentToJson(this);
}

@JsonSerializable(includeIfNull: true, explicitToJson: true)
class AuthorPosition {
  @JsonKey(defaultValue: 0)
  final int value;
  @JsonKey(defaultValue: '')
  final String label;

  AuthorPosition({
    required this.value,
    required this.label,
  });

  factory AuthorPosition.fromJson(Map<String, dynamic> json) => _$AuthorPositionFromJson(json);

  Map<String, dynamic> toJson() => _$AuthorPositionToJson(this);
}

@JsonSerializable(includeIfNull: true, explicitToJson: true)
class Items {
  @JsonKey(defaultValue: 0)
  final int id;
  @JsonKey(defaultValue: '')
  final String name;
  @JsonKey(defaultValue: 0)
  final double quantity;
  MeasurementResponse? measurement;

  Items({
    required this.id,
    required this.name,
    required this.quantity,
  });

  factory Items.fromJson(Map<String, dynamic> json) => _$ItemsFromJson(json);

  Map<String, dynamic> toJson() => _$ItemsToJson(this);
}

@JsonSerializable(includeIfNull: true, explicitToJson: true)
class Status {
  @JsonKey(defaultValue: '')
  final String title;
  @JsonKey(defaultValue: '')
  final String type;
  @JsonKey(defaultValue: '')
  final String color_scheme;

  Status({
    required this.title,
    required this.color_scheme,
    required this.type,
  });

  factory Status.fromJson(Map<String, dynamic> json) => _$StatusFromJson(json);

  Map<String, dynamic> toJson() => _$StatusToJson(this);
}

@JsonSerializable(includeIfNull: true, explicitToJson: true)
class Created {
  @JsonKey(defaultValue: '')
  final String email;
  @JsonKey(defaultValue: '')
  final String firstname;
  @JsonKey(defaultValue: '')
  final String lastname;

  Created({
    required this.email,
    required this.firstname,
    required this.lastname,
  });

  factory Created.fromJson(Map<String, dynamic> json) => _$CreatedFromJson(json);

  Map<String, dynamic> toJson() => _$CreatedToJson(this);
}

@JsonSerializable(includeIfNull: true, explicitToJson: true)
class History {
  @JsonKey(defaultValue: 0)
  final int id;
  @JsonKey(defaultValue: 0)
  final int created_date;
  @JsonKey()
  Status? status;
  @JsonKey(defaultValue: 0)
  final int deadline;
  @JsonKey(defaultValue: '')
  final String comment;
  @JsonKey()
  CreatedBy? created_by;
  @JsonKey(defaultValue: [], name: 'involved_users')
  List<InvolvedUsers> involvedUsers;

  History({
    required this.id,
    required this.involvedUsers,
    required this.comment,
    required this.created_by,
    required this.created_date,
    required this.deadline,
    required this.status,
  });

  factory History.fromJson(Map<String, dynamic> json) => _$HistoryFromJson(json);

  Map<String, dynamic> toJson() => _$HistoryToJson(this);
}

@JsonSerializable(includeIfNull: true, explicitToJson: true)
class InvolvedUsers {
  @JsonKey(defaultValue: '')
  final String email;
  @JsonKey(defaultValue: '')
  final String firstname;
  @JsonKey(defaultValue: '')
  final String lastname;

  InvolvedUsers({
    required this.email,
    required this.firstname,
    required this.lastname,
  });

  factory InvolvedUsers.fromJson(Map<String, dynamic> json) => _$InvolvedUsersFromJson(json);

  Map<String, dynamic> toJson() => _$InvolvedUsersToJson(this);
}

@JsonSerializable(includeIfNull: true, explicitToJson: true)
class CreatedBy {
  @JsonKey(defaultValue: '')
  final String email;
  @JsonKey(defaultValue: '')
  final String firstname;
  @JsonKey(defaultValue: '')
  final String lastname;

  CreatedBy({
    required this.email,
    required this.firstname,
    required this.lastname,
  });

  factory CreatedBy.fromJson(Map<String, dynamic> json) => _$CreatedByFromJson(json);

  Map<String, dynamic> toJson() => _$CreatedByToJson(this);
}

@JsonSerializable(includeIfNull: true, explicitToJson: true)
class InquiryActionButtons {
  @JsonKey(defaultValue: '')
  final String title;
  @JsonKey(defaultValue: '')
  final String type;
  @JsonKey(defaultValue: '')
  final String color_scheme;

  InquiryActionButtons({
    required this.title,
    required this.type,
    required this.color_scheme,
  });

  factory InquiryActionButtons.fromJson(Map<String, dynamic> json) =>
      _$InquiryActionButtonsFromJson(json);

  Map<String, dynamic> toJson() => _$InquiryActionButtonsToJson(this);
}

@JsonSerializable(includeIfNull: true, explicitToJson: true)
class InquiryButtons {
  @JsonKey(defaultValue: '')
  final String label;
  @JsonKey(defaultValue: '')
  final String value;
  @JsonKey(defaultValue: false)
  final bool reason;

  InquiryButtons({
    required this.label,
    required this.value,
    required this.reason,
  });

  factory InquiryButtons.fromJson(Map<String, dynamic> json) => _$InquiryButtonsFromJson(json);

  Map<String, dynamic> toJson() => _$InquiryButtonsToJson(this);
}
