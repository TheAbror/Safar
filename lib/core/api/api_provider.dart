import 'dart:io';
import 'package:chopper/chopper.dart';
import 'package:http/io_client.dart' as http;
import 'package:safar/core/api/custom_converter.dart';
import 'package:safar/core/utils/terms_and_conditions/services/terms_service.dart';
import 'package:safar/ui/signin_page/auth/services/auth_service.dart';
import 'package:safar/ui/order_details_page/action/services/orders_service.dart';
import '../../ui/app_updates_page/services/settings_service.dart';

class ApiProvider {
  static late ChopperClient _client;
  static late SettingsService settingsService;
  static late OrdersService ordersService;
  static late AuthService authService;
  static late TermsService termsService;

  ///Services
  static create({String? token}) {
    _client = ChopperClient(
      client: http.IOClient(
        HttpClient()..connectionTimeout = const Duration(seconds: 40),
      ),
      services: [
        SettingsService.create(),
        OrdersService.create(),
        AuthService.create(),
        TermsService.create(),
      ],
      interceptors: getInterceptors(token),
      converter: CustomDataConverter(),
    );

    settingsService = _client.getService<SettingsService>();
    ordersService = _client.getService<OrdersService>();
    authService = _client.getService<AuthService>();
    termsService = _client.getService<TermsService>();
  }

  static List getInterceptors(token) {
    List interceptors = [];

    interceptors.add(HttpLoggingInterceptor());

    interceptors.add(HeadersInterceptor({
      HttpHeaders.acceptHeader: 'application/json',
      HttpHeaders.contentTypeHeader: 'application/json',
      HttpHeaders.authorizationHeader: token != null ? 'Token $token' : '',
    }));

    return interceptors;
  }

  static dispose() {
    _client.dispose();
  }
}
