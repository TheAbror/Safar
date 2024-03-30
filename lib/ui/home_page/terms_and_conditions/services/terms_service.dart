import 'package:chopper/chopper.dart';
import 'package:safar/core/constants/app_strings.dart';

part 'terms_service.chopper.dart';

@ChopperApi(baseUrl: AppStrings.baseLive)
abstract class TermsService extends ChopperService {
  static TermsService create([ChopperClient? client]) => _$TermsService(client ?? ChopperClient());

  @Get(path: 'types/measurement')
  Future<Response<List<String>>> getTerms();
}
