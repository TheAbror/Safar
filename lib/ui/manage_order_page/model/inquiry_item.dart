import 'package:safar/ui/manage_order_page/model/inquiry_model.dart';

import 'inquiry_item_request.dart';

class InquiryItem {
  String name;
  double quantity;
  MeasurementResponse? measurement;

  InquiryItem({
    required this.name,
    required this.quantity,
    required this.measurement,
  });

  InquiryItemRequest toInquiryRequest(String name, double quantity, String? measurement) {
    return InquiryItemRequest(
      name: name,
      quantity: quantity,
      measurement: measurement,
    );
  }
}
