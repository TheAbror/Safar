// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'staff_services.dart';

// **************************************************************************
// ChopperGenerator
// **************************************************************************

// ignore_for_file: type=lint
final class _$StaffListService extends StaffListService {
  _$StaffListService([ChopperClient? client]) {
    if (client == null) return;
    this.client = client;
  }

  @override
  final definitionType = StaffListService;

  @override
  Future<Response<List<StaffResponse>>> getStaffList() {
    final Uri $url =
        Uri.parse('https://api.edulab.app/edulab_udea/api/v1/staff/all');
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
    );
    return client.send<List<StaffResponse>, StaffResponse>($request);
  }
}
