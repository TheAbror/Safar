// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'terms_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TermsResponse _$TermsResponseFromJson(Map<String, dynamic> json) =>
    TermsResponse(
      isAccept: json['isAccept'] as bool? ?? false,
      text: json['text'] as String? ?? '',
    );

Map<String, dynamic> _$TermsResponseToJson(TermsResponse instance) =>
    <String, dynamic>{
      'isAccept': instance.isAccept,
      'text': instance.text,
    };
