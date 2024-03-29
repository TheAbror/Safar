import 'package:chopper/chopper.dart';
import 'package:safar/core/constants/app_strings.dart';
import 'package:safar/ui/manage_order_page/model/inquiry_model.dart';

part 'measurement_services.chopper.dart';

@ChopperApi(baseUrl: AppStrings.baseLive)
abstract class MeasurementService extends ChopperService {
  static MeasurementService create([ChopperClient? client]) =>
      _$MeasurementService(client ?? ChopperClient());

  @Get(path: 'types/measurement')
  Future<Response<List<MeasurementResponse>>> getMeasures();
}
