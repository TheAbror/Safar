// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'measurement_services.dart';

// **************************************************************************
// ChopperGenerator
// **************************************************************************

// ignore_for_file: type=lint
final class _$MeasurementService extends MeasurementService {
  _$MeasurementService([ChopperClient? client]) {
    if (client == null) return;
    this.client = client;
  }

  @override
  final definitionType = MeasurementService;

  @override
  Future<Response<List<MeasurementResponse>>> getMeasures() {
    final Uri $url =
        Uri.parse('https://safarapi.pythonanywhere.com/types/measurement');
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
    );
    return client
        .send<List<MeasurementResponse>, MeasurementResponse>($request);
  }
}
