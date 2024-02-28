// ignore_for_file: type_literal_in_constant_pattern

import 'package:chopper/chopper.dart';
import 'package:safar/ui_staff/bildirgi_page/action/model/comments_model.dart';
import 'package:safar/ui_staff/bildirgi_page/action/model/inquiry_action_request_model.dart';
import 'package:safar/ui_staff/bildirgi_page/action/model/staff_model.dart';
import 'package:safar/ui_staff/manage_inquiry_page/model/delete_inquiry_by_id.dart';
import 'package:safar/ui_staff/manage_inquiry_page/model/inquiry_item_request.dart';
import 'package:safar/ui_staff/manage_inquiry_page/model/inquiry_model.dart';
import 'package:safar/ui_staff/signin_page/auth/models/auth.dart';
import 'package:safar/ui_staff/signin_page/auth/models/user_info.dart';
import 'package:safar/ui_staff/home_page/model/inquiry_list_model.dart';

class CustomDataConverter extends JsonConverter {
  @override
  Future<Response<BodyType>> convertResponse<BodyType, InnerType>(Response response) async {
    final Response<dynamic> dynamicResponse = await super.convertResponse(response);

    var body = dynamicResponse.body;

    final BodyType customBody = convertToCustomObject<BodyType, InnerType>(body);

    return dynamicResponse.copyWith<BodyType>(
      body: customBody,
    );
  }
}

BodyType convertToCustomObject<BodyType, SingleItemType>(dynamic element) {
  if (element is List) {
    return deserializeListOf<BodyType, SingleItemType>(element);
  } else {
    return deserialize<SingleItemType>(element);
  }
}

dynamic deserializeListOf<BodyType, SingleItemType>(
  List dynamicList,
) {
  List<SingleItemType> list =
      dynamicList.map<SingleItemType>((element) => deserialize<SingleItemType>(element)).toList();
  return list;
}

dynamic deserialize<SingleItemType>(Map<String, dynamic> json) {
  switch (SingleItemType) {
    case int:
      return int;

    case InquiryListResponse:
      return InquiryListResponse.fromJson(json);

    case OrdersResponse:
      return OrdersResponse.fromJson(json);

    case SignInResponse:
      return SignInResponse.fromJson(json);

    case SignInRequest:
      return SignInRequest.fromJson(json);

    case InquiryListItemResponse:
      return InquiryListItemResponse.fromJson(json);

    case Created:
      return Created.fromJson(json);

    case MeasurementResponse:
      return MeasurementResponse.fromJson(json);

    case StaffResponse:
      return StaffResponse.fromJson(json);

    case CommentsResponse:
      return CommentsResponse.fromJson(json);

    case CommentsModelRequest:
      return CommentsModelRequest.fromJson(json);

    case InquiryActionRequestModel:
      return InquiryActionRequestModel.fromJson(json);

    case CreateInquiryRequest:
      return CreateInquiryRequest.fromJson(json);

    case InquiryItemRequest:
      return InquiryItemRequest.fromJson(json);

    case DeleteInquiryByIdModel:
      return DeleteInquiryByIdModel.fromJson(json);

    case InquiryButtons:
      return InquiryButtons.fromJson(json);

    case DeliveryOrdersResponse:
      return DeliveryOrdersResponse.fromJson(json);

    default:
      return null;
  }
}
