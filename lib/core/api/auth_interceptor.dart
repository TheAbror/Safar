import 'dart:async';
import 'package:chopper/chopper.dart';
import 'package:safar/core/box/current_user_box.dart';
import 'package:safar/core/db/shared_keys.dart';
import 'package:safar/ui/root_page/model/current_user.dart';

class NotAuthorizedInterceptor implements ResponseInterceptor {
  final StreamController<bool> controller = StreamController<bool>.broadcast();

  @override
  FutureOr<Response> onResponse(Response response) {
    CurrentUser? currentUser = boxCurrentUser.get(ShPrefKeys.currentUser);
    final token = currentUser?.token;

    if (token != null && token.isNotEmpty) {
      if (response.statusCode == 401) {
        controller.add(true);
      }
    }

    return response;
  }
}
