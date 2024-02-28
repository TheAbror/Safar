import 'package:chopper/chopper.dart';
import 'package:safar/core/constants/app_strings.dart';
import 'package:safar/ui/signin_page/auth/models/user_info.dart';

part 'inquiry_service.chopper.dart';

@ChopperApi(baseUrl: AppStrings.baseLive)
abstract class OrdersService extends ChopperService {
  static OrdersService create([ChopperClient? client]) =>
      _$OrdersService(client ?? ChopperClient());

  @Get(path: AppStrings.orders)
  Future<Response<DeliveryOrdersResponse>> getInitiallyAssigned();
}
