// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'inquiry_list_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

InquiryListResponse _$InquiryListResponseFromJson(Map<String, dynamic> json) =>
    InquiryListResponse(
      last: json['last'] as bool? ?? false,
      totalElements: json['total_elements'] as int? ?? 0,
      totalPages: json['total_pages'] as int? ?? 0,
      pageable: Pageable.fromJson(json['pageable'] as Map<String, dynamic>),
      content: (json['content'] as List<dynamic>?)
              ?.map((e) =>
                  InquiryListItemResponse.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
    );

Map<String, dynamic> _$InquiryListResponseToJson(
        InquiryListResponse instance) =>
    <String, dynamic>{
      'content': instance.content.map((e) => e.toJson()).toList(),
      'last': instance.last,
      'total_elements': instance.totalElements,
      'total_pages': instance.totalPages,
      'pageable': instance.pageable.toJson(),
    };

InquiryListItemResponse _$InquiryListItemResponseFromJson(
        Map<String, dynamic> json) =>
    InquiryListItemResponse(
      id: json['id'] as int? ?? 0,
      title: json['title'] as String? ?? '',
      description: json['description'] as String? ?? '',
      items: (json['items'] as List<dynamic>?)
              ?.map((e) => Items.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
      status: json['status'] == null
          ? null
          : Status.fromJson(json['status'] as Map<String, dynamic>),
      created_date: json['created_date'] as int? ?? 0,
      updated_date: json['updated_date'] as int? ?? 0,
      created: json['created'] == null
          ? null
          : Created.fromJson(json['created'] as Map<String, dynamic>),
      editable: json['editable'] as bool? ?? false,
      history: (json['history'] as List<dynamic>?)
              ?.map((e) => History.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
      buttons: (json['buttons'] as List<dynamic>?)
              ?.map((e) =>
                  InquiryActionButtons.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
      authorDepartment: AuthorDepartment.fromJson(
          json['author_department'] as Map<String, dynamic>),
      authorPosition: AuthorPosition.fromJson(
          json['author_position'] as Map<String, dynamic>),
      recipient: Recipient.fromJson(json['recipient'] as Map<String, dynamic>),
      from: json['recipient_custom'] as String? ?? '',
      to: json['recipient_department'] as String? ?? '',
    );

Map<String, dynamic> _$InquiryListItemResponseToJson(
        InquiryListItemResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'description': instance.description,
      'items': instance.items.map((e) => e.toJson()).toList(),
      'status': instance.status?.toJson(),
      'created_date': instance.created_date,
      'updated_date': instance.updated_date,
      'created': instance.created?.toJson(),
      'editable': instance.editable,
      'history': instance.history.map((e) => e.toJson()).toList(),
      'buttons': instance.buttons.map((e) => e.toJson()).toList(),
      'author_department': instance.authorDepartment.toJson(),
      'author_position': instance.authorPosition.toJson(),
      'recipient': instance.recipient.toJson(),
      'recipient_custom': instance.from,
      'recipient_department': instance.to,
    };

Pageable _$PageableFromJson(Map<String, dynamic> json) => Pageable(
      offset: json['offset'] as int? ?? 0,
      pageNumber: json['page_number'] as int? ?? 0,
      pageSize: json['page_size'] as int? ?? 0,
      paged: json['paged'] as bool? ?? false,
      sort: Sort.fromJson(json['sort'] as Map<String, dynamic>),
      unpaged: json['unpaged'] as bool? ?? false,
    );

Map<String, dynamic> _$PageableToJson(Pageable instance) => <String, dynamic>{
      'offset': instance.offset,
      'page_number': instance.pageNumber,
      'page_size': instance.pageSize,
      'paged': instance.paged,
      'sort': instance.sort.toJson(),
      'unpaged': instance.unpaged,
    };

Sort _$SortFromJson(Map<String, dynamic> json) => Sort(
      unsorted: json['unsorted'] as bool? ?? false,
      sorted: json['sorted'] as bool? ?? false,
      empty: json['empty'] as bool? ?? false,
    );

Map<String, dynamic> _$SortToJson(Sort instance) => <String, dynamic>{
      'unsorted': instance.unsorted,
      'sorted': instance.sorted,
      'empty': instance.empty,
    };

Recipient _$RecipientFromJson(Map<String, dynamic> json) => Recipient(
      value: json['value'] as int? ?? 0,
      label: json['label'] as String? ?? '',
    );

Map<String, dynamic> _$RecipientToJson(Recipient instance) => <String, dynamic>{
      'value': instance.value,
      'label': instance.label,
    };

RecipientGroupType _$RecipientGroupTypeFromJson(Map<String, dynamic> json) =>
    RecipientGroupType(
      value: json['value'] as String? ?? '',
      label: json['label'] as String? ?? '',
    );

Map<String, dynamic> _$RecipientGroupTypeToJson(RecipientGroupType instance) =>
    <String, dynamic>{
      'value': instance.value,
      'label': instance.label,
    };

AuthorDepartment _$AuthorDepartmentFromJson(Map<String, dynamic> json) =>
    AuthorDepartment(
      value: json['value'] as int? ?? 0,
      label: json['label'] as String? ?? '',
    );

Map<String, dynamic> _$AuthorDepartmentToJson(AuthorDepartment instance) =>
    <String, dynamic>{
      'value': instance.value,
      'label': instance.label,
    };

AuthorPosition _$AuthorPositionFromJson(Map<String, dynamic> json) =>
    AuthorPosition(
      value: json['value'] as int? ?? 0,
      label: json['label'] as String? ?? '',
    );

Map<String, dynamic> _$AuthorPositionToJson(AuthorPosition instance) =>
    <String, dynamic>{
      'value': instance.value,
      'label': instance.label,
    };

Items _$ItemsFromJson(Map<String, dynamic> json) => Items(
      id: json['id'] as int? ?? 0,
      name: json['name'] as String? ?? '',
      quantity: (json['quantity'] as num?)?.toDouble() ?? 0,
    );

Map<String, dynamic> _$ItemsToJson(Items instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'quantity': instance.quantity,
    };

Status _$StatusFromJson(Map<String, dynamic> json) => Status(
      title: json['title'] as String? ?? '',
      color_scheme: json['color_scheme'] as String? ?? '',
      type: json['type'] as String? ?? '',
    );

Map<String, dynamic> _$StatusToJson(Status instance) => <String, dynamic>{
      'title': instance.title,
      'type': instance.type,
      'color_scheme': instance.color_scheme,
    };

Created _$CreatedFromJson(Map<String, dynamic> json) => Created(
      email: json['email'] as String? ?? '',
      firstname: json['firstname'] as String? ?? '',
      lastname: json['lastname'] as String? ?? '',
    );

Map<String, dynamic> _$CreatedToJson(Created instance) => <String, dynamic>{
      'email': instance.email,
      'firstname': instance.firstname,
      'lastname': instance.lastname,
    };

History _$HistoryFromJson(Map<String, dynamic> json) => History(
      id: json['id'] as int? ?? 0,
      involvedUsers: (json['involved_users'] as List<dynamic>?)
              ?.map((e) => InvolvedUsers.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
      comment: json['comment'] as String? ?? '',
      created_by: json['created_by'] == null
          ? null
          : CreatedBy.fromJson(json['created_by'] as Map<String, dynamic>),
      created_date: json['created_date'] as int? ?? 0,
      deadline: json['deadline'] as int? ?? 0,
      status: json['status'] == null
          ? null
          : Status.fromJson(json['status'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$HistoryToJson(History instance) => <String, dynamic>{
      'id': instance.id,
      'created_date': instance.created_date,
      'status': instance.status?.toJson(),
      'deadline': instance.deadline,
      'comment': instance.comment,
      'created_by': instance.created_by?.toJson(),
      'involved_users': instance.involvedUsers.map((e) => e.toJson()).toList(),
    };

InvolvedUsers _$InvolvedUsersFromJson(Map<String, dynamic> json) =>
    InvolvedUsers(
      email: json['email'] as String? ?? '',
      firstname: json['firstname'] as String? ?? '',
      lastname: json['lastname'] as String? ?? '',
    );

Map<String, dynamic> _$InvolvedUsersToJson(InvolvedUsers instance) =>
    <String, dynamic>{
      'email': instance.email,
      'firstname': instance.firstname,
      'lastname': instance.lastname,
    };

CreatedBy _$CreatedByFromJson(Map<String, dynamic> json) => CreatedBy(
      email: json['email'] as String? ?? '',
      firstname: json['firstname'] as String? ?? '',
      lastname: json['lastname'] as String? ?? '',
    );

Map<String, dynamic> _$CreatedByToJson(CreatedBy instance) => <String, dynamic>{
      'email': instance.email,
      'firstname': instance.firstname,
      'lastname': instance.lastname,
    };

InquiryActionButtons _$InquiryActionButtonsFromJson(
        Map<String, dynamic> json) =>
    InquiryActionButtons(
      title: json['title'] as String? ?? '',
      type: json['type'] as String? ?? '',
      color_scheme: json['color_scheme'] as String? ?? '',
    );

Map<String, dynamic> _$InquiryActionButtonsToJson(
        InquiryActionButtons instance) =>
    <String, dynamic>{
      'title': instance.title,
      'type': instance.type,
      'color_scheme': instance.color_scheme,
    };

InquiryButtons _$InquiryButtonsFromJson(Map<String, dynamic> json) =>
    InquiryButtons(
      label: json['label'] as String? ?? '',
      value: json['value'] as String? ?? '',
      reason: json['reason'] as bool? ?? false,
    );

Map<String, dynamic> _$InquiryButtonsToJson(InquiryButtons instance) =>
    <String, dynamic>{
      'label': instance.label,
      'value': instance.value,
      'reason': instance.reason,
    };
