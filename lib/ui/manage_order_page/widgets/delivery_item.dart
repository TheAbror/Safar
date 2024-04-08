import 'delivery_item_request.dart';

class DeliveryItem {
  String name;
  double quantity;

  DeliveryItem({
    required this.name,
    required this.quantity,
  });

  DeliveryItemRequest toInquiryRequest(String name, double quantity) {
    return DeliveryItemRequest(
      name: name,
      quantity: quantity,
    );
  }
}
