import 'package:json_annotation/json_annotation.dart';

part 'all_models.g.dart';

@JsonSerializable(includeIfNull: true, explicitToJson: true)
class SignInResponse {
  @JsonKey(defaultValue: '')
  String token;
  @JsonKey(name: 'user')
  UserInfoResponse userInfo;

  SignInResponse({required this.token, required this.userInfo});

  factory SignInResponse.fromJson(Map<String, dynamic> json) => _$SignInResponseFromJson(json);

  Map<String, dynamic> toJson() => _$SignInResponseToJson(this);
}

@JsonSerializable(includeIfNull: true, explicitToJson: true)
class UserInfoResponse {
  @JsonKey(defaultValue: 0)
  int id;
  @JsonKey(defaultValue: 'error occured', name: 'first_name')
  String firstname;
  @JsonKey(defaultValue: '', name: 'last_name')
  String lastname;
  @JsonKey(defaultValue: '')
  String email;
  @JsonKey(defaultValue: '', name: 'date_joined')
  String dateJoined;
  @JsonKey(defaultValue: '', name: 'last_login')
  String lastLogin;
  @JsonKey(defaultValue: false, name: 'is_superuser')
  bool isSuperUser;
  @JsonKey(defaultValue: false, name: 'is_staff')
  bool isStaff;
  @JsonKey(defaultValue: false, name: 'is_active')
  bool isActive;
  @JsonKey(defaultValue: '')
  String username;
  @JsonKey(defaultValue: '')
  String password;

  UserInfoResponse({
    required this.id,
    required this.firstname,
    required this.lastname,
    required this.dateJoined,
    required this.lastLogin,
    required this.isStaff,
    required this.email,
    required this.isActive,
    required this.isSuperUser,
    required this.username,
    required this.password,
  });

  factory UserInfoResponse.fromJson(Map<String, dynamic> json) => _$UserInfoResponseFromJson(json);

  Map<String, dynamic> toJson() => _$UserInfoResponseToJson(this);
}

// --- Account ---
// endpoint: /api/account/

@JsonSerializable(includeIfNull: true, explicitToJson: true)
class Account {
  @JsonKey(defaultValue: 0)
  int id;
  @JsonKey(defaultValue: '')
  String contacts;
  @JsonKey(defaultValue: '')
  String photo;
  @JsonKey(defaultValue: '', name: 'about_user')
  String aboutUser;

  Account({
    required this.id,
    required this.contacts,
    required this.photo,
    required this.aboutUser,
  });

  factory Account.fromJson(Map<String, dynamic> json) => _$AccountFromJson(json);

  Map<String, dynamic> toJson() => _$AccountToJson(this);
}

// --- Register driver ---
// endpoint: /api/register_driver/
// allowed requests: POST

@JsonSerializable(includeIfNull: true, explicitToJson: true)
class DriverRegistrationRequest {
  @JsonKey(defaultValue: '', name: 'car_model')
  String carModel;
  @JsonKey(defaultValue: '', name: 'car_color')
  String carColor;
  @JsonKey(defaultValue: 0, name: 'car_year')
  int carYear;
  @JsonKey(defaultValue: '', name: 'license_plate')
  String licencePlate;

  DriverRegistrationRequest({
    required this.carModel,
    required this.carColor,
    required this.carYear,
    required this.licencePlate,
  });

  factory DriverRegistrationRequest.fromJson(Map<String, dynamic> json) =>
      _$DriverRegistrationRequestFromJson(json);

  Map<String, dynamic> toJson() => _$DriverRegistrationRequestToJson(this);
}

// --- Driver profile ---
// endpoint: /api/driver_profile/
// allowed requests: GET, PATCH

@JsonSerializable(includeIfNull: true, explicitToJson: true)
class DriverProfie {
  @JsonKey(defaultValue: 0)
  int id;
  @JsonKey(defaultValue: 0)
  int user;
  @JsonKey(defaultValue: '', name: 'car_model')
  String carModel;
  @JsonKey(defaultValue: '', name: 'car_color')
  String carColor;
  @JsonKey(defaultValue: 0, name: 'car_year')
  int carYear;
  @JsonKey(defaultValue: '', name: 'license_plate')
  String licencePlate;
  @JsonKey(defaultValue: '', name: 'registered_at')
  String registeredAt;

  DriverProfie({
    required this.id,
    required this.user,
    required this.carModel,
    required this.carColor,
    required this.carYear,
    required this.licencePlate,
    required this.registeredAt,
  });

  factory DriverProfie.fromJson(Map<String, dynamic> json) => _$DriverProfieFromJson(json);

  Map<String, dynamic> toJson() => _$DriverProfieToJson(this);
}

// --- Orders ---
// endpoint: /api/orders/
// allowed requests: GET, POST

@JsonSerializable(includeIfNull: true, explicitToJson: true)
class DeliveryOrdersResponse {
  @JsonKey(defaultValue: 0)
  int count;
  @JsonKey(defaultValue: [])
  List<OrdersResponse> results;

  DeliveryOrdersResponse({
    required this.count,
    required this.results,
  });

  factory DeliveryOrdersResponse.fromJson(Map<String, dynamic> json) =>
      _$DeliveryOrdersResponseFromJson(json);

  Map<String, dynamic> toJson() => _$DeliveryOrdersResponseToJson(this);
}

// POST:

@JsonSerializable(includeIfNull: true, explicitToJson: true)
class OrdersRequest {
  @JsonKey(defaultValue: '')
  String pickup;
  @JsonKey(defaultValue: '')
  String destination;
  @JsonKey(defaultValue: 0, name: 'number_passenger')
  int numberOfPassengers;
  @JsonKey(defaultValue: '', name: 'desired_pickup_time')
  String desiredPickupTime;
  @JsonKey(defaultValue: '', name: 'desired_car_model')
  String desiredCarModel;
  @JsonKey(defaultValue: '', name: 'offered_price')
  String offeredPrice;
  @JsonKey(defaultValue: '', name: 'pickup_reference')
  String pickupReference;
  @JsonKey(defaultValue: '', name: 'destination_reference')
  String destinationReference;
  @JsonKey(defaultValue: '', name: 'comments_for_driver')
  String commentForDriver;

  OrdersRequest({
    required this.pickup,
    required this.destination,
    required this.numberOfPassengers,
    required this.desiredPickupTime,
    required this.desiredCarModel,
    required this.offeredPrice,
    required this.pickupReference,
    required this.destinationReference,
    required this.commentForDriver,
  });

  factory OrdersRequest.fromJson(Map<String, dynamic> json) => _$OrdersRequestFromJson(json);

  Map<String, dynamic> toJson() => _$OrdersRequestToJson(this);
}

// GET:

@JsonSerializable(includeIfNull: true, explicitToJson: true)
class OrdersResponse {
  @JsonKey(defaultValue: 0)
  int id;
  @JsonKey(defaultValue: '')
  String pickup;
  @JsonKey(defaultValue: '')
  String destination;
  @JsonKey(defaultValue: 0, name: 'number_passenger')
  int numberOfPassengers;
  @JsonKey(defaultValue: '', name: 'desired_pickup_time')
  String desiredPickupTime;
  @JsonKey(defaultValue: '', name: 'desired_car_model')
  String desiredCarModel;
  @JsonKey(defaultValue: '', name: 'offered_price')
  String offeredPrice;
  @JsonKey(defaultValue: '', name: 'pickup_reference')
  String pickupReference;
  @JsonKey(defaultValue: '', name: 'destination_reference')
  String destinationReference;
  @JsonKey(defaultValue: '', name: 'comments_for_driver')
  String commentForDriver;
  @JsonKey(defaultValue: false)
  bool created;
  @JsonKey(defaultValue: '', name: 'created_at')
  String createdAt;
  @JsonKey(defaultValue: false)
  bool assigned;
  @JsonKey(defaultValue: '', name: 'assigned_at')
  String assignedAt;
  @JsonKey(defaultValue: false, name: 'in_process')
  bool inProcess;
  @JsonKey(defaultValue: '', name: 'in_process_at')
  String inProcessAt;
  @JsonKey(defaultValue: false, name: 'update_required')
  bool updateRequired;
  @JsonKey(defaultValue: false)
  bool delivered;
  @JsonKey(defaultValue: '', name: 'delivered_at')
  String deliveredAt;
  @JsonKey(defaultValue: 0)
  int user;
  @JsonKey(defaultValue: 0)
  int driver;

  OrdersResponse({
    required this.id,
    required this.pickup,
    required this.destination,
    required this.numberOfPassengers,
    required this.desiredPickupTime,
    required this.desiredCarModel,
    required this.offeredPrice,
    required this.pickupReference,
    required this.destinationReference,
    required this.commentForDriver,
    required this.assignedAt,
    required this.assigned,
    required this.created,
    required this.createdAt,
    required this.delivered,
    required this.deliveredAt,
    required this.driver,
    required this.inProcess,
    required this.inProcessAt,
    required this.updateRequired,
    required this.user,
  });

  factory OrdersResponse.fromJson(Map<String, dynamic> json) => _$OrdersResponseFromJson(json);

  Map<String, dynamic> toJson() => _$OrdersResponseToJson(this);
}
