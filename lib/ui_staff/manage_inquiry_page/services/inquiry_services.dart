import 'package:chopper/chopper.dart';
import 'package:safar/core/constants/app_strings.dart';
import 'package:safar/ui_staff/manage_inquiry_page/model/inquiry_model.dart';

part 'inquiry_services.chopper.dart';

@ChopperApi(baseUrl: AppStrings.baseLive)
abstract class MeasurementService extends ChopperService {
  static MeasurementService create([ChopperClient? client]) =>
      _$MeasurementService(client ?? ChopperClient());

  @Get(path: 'types/measurement')
  Future<Response<List<MeasurementResponse>>> getMeasures();
}
