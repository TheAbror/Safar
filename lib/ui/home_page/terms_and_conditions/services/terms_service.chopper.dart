// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'terms_service.dart';

// **************************************************************************
// ChopperGenerator
// **************************************************************************

// ignore_for_file: type=lint
final class _$TermsService extends TermsService {
  _$TermsService([ChopperClient? client]) {
    if (client == null) return;
    this.client = client;
  }

  @override
  final definitionType = TermsService;

  @override
  Future<Response<List<MeasurementResponse>>> getTerms() {
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
