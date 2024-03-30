import 'package:chopper/chopper.dart';
import 'package:safar/core/constants/app_strings.dart';
import 'package:safar/ui/manage_order_page/model/inquiry_model.dart';

part 'terms_service.chopper.dart';

@ChopperApi(baseUrl: AppStrings.baseLive)
abstract class TermsService extends ChopperService {
  static TermsService create([ChopperClient? client]) => _$TermsService(client ?? ChopperClient());

  @Get(path: 'types/measurement')
  Future<Response<List<MeasurementResponse>>> getTerms();
}
