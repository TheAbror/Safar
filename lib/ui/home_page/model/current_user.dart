import 'package:hive/hive.dart';

part 'current_user.g.dart';

@HiveType(typeId: 1)
class CurrentUser {
  CurrentUser({
    required this.fullName,
    required this.token,
  });

  @HiveField(0)
  String fullName;

  @HiveField(1)
  String token;
}
