import 'dart:io';
import 'package:chopper/chopper.dart';
import 'package:http/io_client.dart' as http;
import 'package:safar/core/api/custom_converter.dart';
import 'package:safar/ui_staff/bildirgi_page/action/services/inquiry_service.dart';
import 'package:safar/ui_staff/manage_inquiry_page/services/inquiry_services.dart';

class ApiProvider {
  static late ChopperClient _client;
  static late InquiryService inquiryService;
  static late MeasurementService measurementService;

  ///Services
  static create({String? token}) {
    _client = ChopperClient(
      client: http.IOClient(
        HttpClient()..connectionTimeout = const Duration(seconds: 40),
      ),
      services: [
        InquiryService.create(),
        MeasurementService.create(),
      ],
      interceptors: getInterceptors(token),
      converter: CustomDataConverter(),
    );

    inquiryService = _client.getService<InquiryService>();
    measurementService = _client.getService<MeasurementService>();
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
