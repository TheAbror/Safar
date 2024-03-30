import 'package:chopper/chopper.dart';
import 'package:safar/core/constants/app_strings.dart';
import 'package:safar/core/utils/models/all_models.dart';

part 'orders_service.chopper.dart';

@ChopperApi(baseUrl: AppStrings.baseLive)
abstract class OrdersService extends ChopperService {
  static OrdersService create([ChopperClient? client]) =>
      _$OrdersService(client ?? ChopperClient());

  @Get(path: AppStrings.orders)
  Future<Response<DeliveryOrdersResponse>> getTaxiOrders();

  @Post(path: AppStrings.orders)
  Future<Response<DeliveryOrdersResponse>> postTaxiOrders(@Body() OrdersRequest body);

  @Get(path: '${AppStrings.orderDetails}/{id}')
  Future<Response<OrdersResponse>> getOrderById(@Path('id') int id);

  @Get(path: '${AppStrings.orderDetails}/{id}')
  Future<Response<OrdersResponse>> getInquiryByIdForEdit(@Path('id') int id);

  @Delete(path: '${AppStrings.orderDetails}/{id}')
  Future<Response<DeleteOrderById>> deleteOrderById(@Path('id') int id);
}
