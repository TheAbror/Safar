// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'inquiry_service.dart';

// **************************************************************************
// ChopperGenerator
// **************************************************************************

// ignore_for_file: type=lint
final class _$OrdersService extends OrdersService {
  _$OrdersService([ChopperClient? client]) {
    if (client == null) return;
    this.client = client;
  }

  @override
  final definitionType = OrdersService;

  @override
  Future<Response<DeliveryOrdersResponse>> getInitiallyAssigned() {
    final Uri $url =
        Uri.parse('https://safarapi.pythonanywhere.com/api/orders/');
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
    );
    return client
        .send<DeliveryOrdersResponse, DeliveryOrdersResponse>($request);
  }
}
