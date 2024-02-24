import 'package:hive/hive.dart';

part 'current_user.g.dart';

@HiveType(typeId: 1)
class CurrentUser {
  CurrentUser({
    required this.fullName,
    required this.shortName,
    required this.token,
    required this.userID,
  });

  @HiveField(0)
  String fullName;

  @HiveField(1)
  String shortName;

  @HiveField(3)
  String token;

  @HiveField(4)
  String userID;
}
