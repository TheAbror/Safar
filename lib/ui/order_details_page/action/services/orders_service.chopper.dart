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
  Future<Response<AllTaxiOrdersResponse>> getTaxiOrders() {
    final Uri $url =
        Uri.parse('https://safarapi.pythonanywhere.com/api/orders/');
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
    );
    return client.send<AllTaxiOrdersResponse, AllTaxiOrdersResponse>($request);
  }

  @override
  Future<Response<AllDeliveryOrdersResponse>> getDeliveryOrders() {
    final Uri $url =
        Uri.parse('https://safarapi.pythonanywhere.com/api/delivery_orders/');
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
    );
    return client
        .send<AllDeliveryOrdersResponse, AllDeliveryOrdersResponse>($request);
  }

  @override
  Future<Response<FilterStatusesList>> getStatusesList() {
    final Uri $url = Uri.parse(
        'https://safarapi.pythonanywhere.com/api/taxi_status_filters/');
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
    );
    return client.send<FilterStatusesList, FilterStatusesList>($request);
  }

  @override
  Future<Response<AllTaxiOrdersResponse>> postTaxiOrders(
      TaxiOrdersRequest body) {
    final Uri $url =
        Uri.parse('https://safarapi.pythonanywhere.com/api/orders_detail/');
    final $body = body;
    final Request $request = Request(
      'POST',
      $url,
      client.baseUrl,
      body: $body,
    );
    return client.send<AllTaxiOrdersResponse, AllTaxiOrdersResponse>($request);
  }

  @override
  Future<Response<AllTaxiOrdersResponse>> editTaxiOrdersByID(
    TaxiOrdersRequest body,
    int id,
  ) {
    final Uri $url = Uri.parse(
        'https://safarapi.pythonanywhere.com/api/orders_detail/${id}/');
    final $body = body;
    final Request $request = Request(
      'PUT',
      $url,
      client.baseUrl,
      body: $body,
    );
    return client.send<AllTaxiOrdersResponse, AllTaxiOrdersResponse>($request);
  }

  @override
  Future<Response<TaxiOrdersResponse>> getOrderById(int id) {
    final Uri $url = Uri.parse(
        'https://safarapi.pythonanywhere.com/api/orders_detail/${id}/');
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
    );
    return client.send<TaxiOrdersResponse, TaxiOrdersResponse>($request);
  }

  @override
  Future<Response<TaxiOrdersResponse>> getInquiryByIdForEdit(int id) {
    final Uri $url = Uri.parse(
        'https://safarapi.pythonanywhere.com/api/orders_detail/${id}/');
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
    );
    return client.send<TaxiOrdersResponse, TaxiOrdersResponse>($request);
  }

  @override
  Future<Response<DeleteOrderById>> deleteOrderById(int id) {
    final Uri $url = Uri.parse(
        'https://safarapi.pythonanywhere.com/api/orders_detail/${id}/');
    final Request $request = Request(
      'DELETE',
      $url,
      client.baseUrl,
    );
    return client.send<DeleteOrderById, DeleteOrderById>($request);
  }

  @override
  Future<Response<DeliveryOrdersResponse>> getDeliveryOrderById(int id) {
    final Uri $url = Uri.parse(
        'https://safarapi.pythonanywhere.com/api/orders_detail/${id}/');
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
    );
    return client
        .send<DeliveryOrdersResponse, DeliveryOrdersResponse>($request);
  }
}
