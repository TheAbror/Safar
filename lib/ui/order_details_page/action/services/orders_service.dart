import 'package:chopper/chopper.dart';
import 'package:safar/core/constants/app_strings.dart';
import 'package:safar/core/utils/all_models/all_models.dart';

part 'orders_service.chopper.dart';

@ChopperApi(baseUrl: AppStrings.baseLive)
abstract class OrdersService extends ChopperService {
  static OrdersService create([ChopperClient? client]) =>
      _$OrdersService(client ?? ChopperClient());

  @Get(path: AppStrings.ordersList)
  Future<Response<AllTaxiOrdersResponse>> getTaxiOrders();

  @Get(path: AppStrings.deliveryList)
  Future<Response<AllDeliveryOrdersResponse>> getDeliveryOrders();

  @Get(path: AppStrings.filterStatusesList)
  Future<Response<FilterStatusesList>> getStatusesList(); //TODO

  @Post(path: AppStrings.orderDetails)
  Future<Response<AllTaxiOrdersResponse>> postTaxiOrders(@Body() TaxiOrdersRequest body);

  @Put(path: '${AppStrings.orderDetails}{id}/')
  Future<Response<AllTaxiOrdersResponse>> editTaxiOrdersByID(
      @Body() TaxiOrdersRequest body, @Path('id') int id);

  @Get(path: '${AppStrings.orderDetails}{id}/')
  Future<Response<TaxiOrdersResponse>> getOrderById(@Path('id') int id);

  @Get(path: '${AppStrings.orderDetails}{id}/')
  Future<Response<TaxiOrdersResponse>> getInquiryByIdForEdit(@Path('id') int id);

  @Delete(path: '${AppStrings.orderDetails}{id}/')
  Future<Response<DeleteOrderById>> deleteOrderById(@Path('id') int id);

  // Delivery

  @Get(path: '${AppStrings.deliveryOrderDetails}{id}/')
  Future<Response<DeliveryOrdersResponse>> getDeliveryOrderById(@Path('id') int id);

  @Delete(path: '${AppStrings.deliveryOrderDetails}{id}/')
  Future<Response<DeleteOrderById>> deleteDeliveryOrderById(@Path('id') int id);

  @Post(path: AppStrings.deliveryOrderDetails)
  Future<Response<AllDeliveryOrdersResponse>> postDeliveryOrders(
      @Body() DeliveryOrdersRequest body);
}
