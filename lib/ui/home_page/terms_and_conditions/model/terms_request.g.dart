// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'terms_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TermsRequest _$TermsRequestFromJson(Map<String, dynamic> json) => TermsRequest(
      isAccept: json['isAccept'] as bool? ?? false,
      text: json['text'] as String? ?? '',
    );

Map<String, dynamic> _$TermsRequestToJson(TermsRequest instance) =>
    <String, dynamic>{
      'isAccept': instance.isAccept,
      'text': instance.text,
    };
