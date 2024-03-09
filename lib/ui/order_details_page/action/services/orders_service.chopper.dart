// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'orders_service.dart';

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
  Future<Response<DeliveryOrdersResponse>> getTaxiOrders() {
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

  @override
  Future<Response<DeliveryOrdersResponse>> postTaxiOrders(OrdersRequest body) {
    final Uri $url =
        Uri.parse('https://safarapi.pythonanywhere.com/api/orders/');
    final $body = body;
    final Request $request = Request(
      'POST',
      $url,
      client.baseUrl,
      body: $body,
    );
    return client
        .send<DeliveryOrdersResponse, DeliveryOrdersResponse>($request);
  }

  @override
  Future<Response<OrdersResponse>> getOrderById(int id) {
    final Uri $url = Uri.parse(
        'https://safarapi.pythonanywhere.com/api/orders_detail/${id}');
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
    );
    return client.send<OrdersResponse, OrdersResponse>($request);
  }

  @override
  Future<Response<OrdersResponse>> deleteOrderById(int id) {
    final Uri $url = Uri.parse(
        'https://safarapi.pythonanywhere.com/api/orders_detail/${id}');
    final Request $request = Request(
      'DELETE',
      $url,
      client.baseUrl,
    );
    return client.send<OrdersResponse, OrdersResponse>($request);
  }
}
