import 'package:chopper/chopper.dart';
import 'package:safar/core/constants/app_strings.dart';
import 'package:safar/ui/signin_page/auth/models/all_models.dart';

part 'orders_service.chopper.dart';

@ChopperApi(baseUrl: AppStrings.baseLive)
abstract class OrdersService extends ChopperService {
  static OrdersService create([ChopperClient? client]) =>
      _$OrdersService(client ?? ChopperClient());

  @Get(path: AppStrings.orders)
  Future<Response<DeliveryOrdersResponse>> getTaxiOrders();

  @Post(path: AppStrings.orders)
  Future<Response<DeliveryOrdersResponse>> postTaxiOrders(@Body() OrdersRequest body);

  //static const orders = 'api/orders/';
  // endpoint: /api/orders_detail/<int:pk>
  @Get(path: '${AppStrings.orderDetails}/{id}')
  Future<Response<OrdersResponse>> getOrderById(@Path('id') int id);
}
