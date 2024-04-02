import 'inquiry_item_request.dart';

class InquiryItem {
  String name;
  double quantity;

  InquiryItem({
    required this.name,
    required this.quantity,
  });

  InquiryItemRequest toInquiryRequest(String name, double quantity) {
    return InquiryItemRequest(
      name: name,
      quantity: quantity,
    );
  }
}
