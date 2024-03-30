// ignore_for_file: type_literal_in_constant_pattern

import 'package:chopper/chopper.dart';
import 'package:safar/core/utils/models/all_models.dart';
import 'package:safar/core/utils/models/auth.dart';
import 'package:safar/core/utils/terms_and_conditions/model/terms_request.dart';
import 'package:safar/core/utils/terms_and_conditions/model/terms_response.dart';
import 'package:safar/ui/order_details_page/action/model/inquiry_action_request_model.dart';
import 'package:safar/ui/manage_order_page/model/delete_inquiry_by_id.dart';
import 'package:safar/ui/manage_order_page/model/inquiry_item_request.dart';

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

    case OrdersResponse:
      return OrdersResponse.fromJson(json);

    case SignInResponse:
      return SignInResponse.fromJson(json);

    case SignInRequest:
      return SignInRequest.fromJson(json);

    //delete unused elements
    case InquiryActionRequestModel:
      return InquiryActionRequestModel.fromJson(json);

    case InquiryItemRequest:
      return InquiryItemRequest.fromJson(json);

    case DeleteInquiryByIdModel:
      return DeleteInquiryByIdModel.fromJson(json);

    case DeliveryOrdersResponse:
      return DeliveryOrdersResponse.fromJson(json);

    case TermsResponse:
      return TermsResponse.fromJson(json);

    case TermsRequest:
      return TermsRequest.fromJson(json);

    default:
      return null;
  }
}
