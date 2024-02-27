import 'package:chopper/chopper.dart';
import 'package:safar/core/constants/app_strings.dart';
import 'package:safar/ui_staff/signin_page/auth/models/user_info.dart';

part 'inquiry_service.chopper.dart';

@ChopperApi(baseUrl: AppStrings.baseLive)
abstract class InquiryService extends ChopperService {
  static InquiryService create([ChopperClient? client]) =>
      _$InquiryService(client ?? ChopperClient());

  @Get(path: AppStrings.orders)
  Future<Response<DeliveryOrdersResponse>> getInitiallyAssigned();
}
