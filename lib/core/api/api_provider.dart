import 'dart:io';

import 'package:chopper/chopper.dart';
import 'package:http/io_client.dart' as http;
import 'package:safar/core/api/custom_converter.dart';
import 'package:safar/ui_staff/signin_page/auth/services/auth_service.dart';
import 'package:safar/ui_staff/bildirgi_page/action/services/inquiry_service.dart';

class ApiProvider {
  static late ChopperClient _client;
  static late InquiryService inquiryService;
  static late AuthService authService;

//   CurrentUser? currentUser = boxCurrentUser.get(ShPrefKeys.currentUser);
// currentUser

  ///Services
  static create({String? token}) {
    _client = ChopperClient(
      client: http.IOClient(
        HttpClient()..connectionTimeout = const Duration(seconds: 40),
      ),
      services: [
        InquiryService.create(),
        AuthService.create(),
      ],
      interceptors: getInterceptors(token),
      converter: CustomDataConverter(),
    );

    inquiryService = _client.getService<InquiryService>();
    authService = _client.getService<AuthService>();
  }

  static List getInterceptors(token) {
    List interceptors = [];

    interceptors.add(HttpLoggingInterceptor());

    interceptors.add(HeadersInterceptor({
      HttpHeaders.acceptHeader: 'application/json',
      HttpHeaders.contentTypeHeader: 'application/json',
      HttpHeaders.authorizationHeader: token != null ? 'Bearer $token' : '',
    }));

    return interceptors;
  }

  static dispose() {
    _client.dispose();
  }
}
