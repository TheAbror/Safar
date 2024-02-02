import 'package:chopper/chopper.dart';
import 'package:safar/core/constants/app_strings.dart';
import 'package:safar/ui_staff/bildirgi_page/action/model/staff_model.dart';

part 'staff_services.chopper.dart';

@ChopperApi(baseUrl: AppStrings.baseLive)
abstract class StaffListService extends ChopperService {
  static StaffListService create([ChopperClient? client]) =>
      _$StaffListService(client ?? ChopperClient());

  @Get(path: 'staff/all')
  Future<Response<List<StaffResponse>>> getStaffList();
}
