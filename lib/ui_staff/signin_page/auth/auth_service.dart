import 'package:chopper/chopper.dart';
import 'package:safar/core/constants/app_strings.dart';

import 'models/auth.dart';
import 'models/user_info.dart';

part 'auth_service.chopper.dart';

@ChopperApi(baseUrl: AppStrings.baseLive)
abstract class AuthService extends ChopperService {
  static AuthService create([ChopperClient? client]) => _$AuthService(client ?? ChopperClient());

  @Post(path: AppStrings.signIn)
  Future<Response<SignInResponse>> signIn(@Body() SignInRequest body);
}
