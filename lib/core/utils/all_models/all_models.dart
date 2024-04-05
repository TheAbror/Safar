import 'package:json_annotation/json_annotation.dart';

part 'all_models.g.dart';

@JsonSerializable(includeIfNull: true, explicitToJson: true)
class SignInResponse {
  @JsonKey(defaultValue: '')
  String token;
  @JsonKey(defaultValue: '')
  String username;
  @JsonKey(defaultValue: '')
  String detail;

  SignInResponse({
    required this.token,
    required this.username,
    required this.detail,
  });

  factory SignInResponse.fromJson(Map<String, dynamic> json) => _$SignInResponseFromJson(json);

  Map<String, dynamic> toJson() => _$SignInResponseToJson(this);
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
class AllTaxiOrdersResponse {
  @JsonKey(defaultValue: 0)
  int count;
  @JsonKey(defaultValue: [])
  List<TaxiOrdersResponse> results;

  AllTaxiOrdersResponse({
    required this.count,
    required this.results,
  });

  factory AllTaxiOrdersResponse.fromJson(Map<String, dynamic> json) =>
      _$AllTaxiOrdersResponseFromJson(json);

  Map<String, dynamic> toJson() => _$AllTaxiOrdersResponseToJson(this);
}

@JsonSerializable(includeIfNull: true, explicitToJson: true)
class TaxiOrdersRequest {
  @JsonKey(defaultValue: 0)
  int? id;
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
  @JsonKey(defaultValue: '')
  String status;
  @JsonKey(defaultValue: false, name: 'is_driver')
  bool isDriver;

  TaxiOrdersRequest({
    this.id,
    required this.pickup,
    required this.destination,
    required this.numberOfPassengers,
    required this.desiredPickupTime,
    required this.desiredCarModel,
    required this.offeredPrice,
    required this.pickupReference,
    required this.destinationReference,
    required this.commentForDriver,
    required this.status,
    required this.isDriver,
  });

  factory TaxiOrdersRequest.fromJson(Map<String, dynamic> json) =>
      _$TaxiOrdersRequestFromJson(json);

  Map<String, dynamic> toJson() => _$TaxiOrdersRequestToJson(this);
}

// GET:

@JsonSerializable(includeIfNull: true, explicitToJson: true)
class TaxiOrdersResponse {
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
  @JsonKey(defaultValue: '', name: 'created_at')
  String createdAt;
  @JsonKey(defaultValue: '', name: 'updated_at')
  String updatedAt;
  @JsonKey(defaultValue: 0)
  int user;
  @JsonKey(defaultValue: 0)
  int driver;
  @JsonKey(defaultValue: false, name: 'is_driver')
  bool isDriver;
  @JsonKey(defaultValue: false, name: 'created_by_this_user')
  bool createdByThisUser;
  @JsonKey()
  OrderStatus status;

  TaxiOrdersResponse({
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
    required this.createdAt,
    required this.driver,
    required this.user,
    required this.createdByThisUser,
    required this.isDriver,
    required this.status,
    required this.updatedAt,
  });

  factory TaxiOrdersResponse.fromJson(Map<String, dynamic> json) =>
      _$TaxiOrdersResponseFromJson(json);

  Map<String, dynamic> toJson() => _$TaxiOrdersResponseToJson(this);
}

@JsonSerializable(includeIfNull: true, explicitToJson: true)
class OrderStatus {
  @JsonKey(defaultValue: '')
  final String key;
  @JsonKey(defaultValue: '')
  final String value;

  OrderStatus({
    required this.key,
    required this.value,
  });

  factory OrderStatus.fromJson(Map<String, dynamic> json) => _$OrderStatusFromJson(json);

  Map<String, dynamic> toJson() => _$OrderStatusToJson(this);
}

@JsonSerializable(includeIfNull: true)
class DeleteOrderById {
  final bool deleted;

  DeleteOrderById({required this.deleted});

  factory DeleteOrderById.fromJson(Map<String, dynamic> json) => _$DeleteOrderByIdFromJson(json);

  Map<String, dynamic> toJson() => _$DeleteOrderByIdToJson(this);
}

@JsonSerializable(includeIfNull: true, explicitToJson: true)
class FilterStatusesList {
  @JsonKey(defaultValue: [])
  final List<String> statuses;

  FilterStatusesList({
    required this.statuses,
  });

  factory FilterStatusesList.fromJson(Map<String, dynamic> json) =>
      _$FilterStatusesListFromJson(json);

  Map<String, dynamic> toJson() => _$FilterStatusesListToJson(this);
}

@JsonSerializable(includeIfNull: true, explicitToJson: true)
class AllDeliveryOrdersResponse {
  @JsonKey(defaultValue: 0)
  int count;
  @JsonKey(defaultValue: [])
  List<DeliveryOrdersResponse> results;

  AllDeliveryOrdersResponse({
    required this.count,
    required this.results,
  });

  factory AllDeliveryOrdersResponse.fromJson(Map<String, dynamic> json) =>
      _$AllDeliveryOrdersResponseFromJson(json);

  Map<String, dynamic> toJson() => _$AllDeliveryOrdersResponseToJson(this);
}

// delivery detail

//  "'desired_pickup_time': '2024-02-10T08:00:00', 'desired_car_model': 'Car "
//  "model', 'offered_price': '50.00', 'comments_for_driver': 'Any comments for "
//  "driver', 'rating': '0.0', 'status': 'created', 'created_at': "
//  "'2024-04-05T05:32:57.113660', 'updated_at': '2024-04-05T05:32:59.337209', "
//  "'is_driver': False, 'user': 2, 'driver': None}, 'status': {'key': 'created', "
//  "'value': 'Создан'}}")

@JsonSerializable(includeIfNull: true, explicitToJson: true)
class DeliveryOrdersResponse {
  @JsonKey(defaultValue: 0)
  int id;
  @JsonKey(defaultValue: '', name: 'packaged_photo_url')
  String photo;
  @JsonKey(defaultValue: '')
  String pickup;
  @JsonKey(defaultValue: '')
  String destination;
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
  @JsonKey(defaultValue: '', name: 'created_at')
  String createdAt;
  @JsonKey(defaultValue: '', name: 'updated_at')
  String updatedAt;
  @JsonKey(defaultValue: 0)
  int user;
  @JsonKey(defaultValue: 0)
  int driver;
  @JsonKey(defaultValue: false, name: 'is_driver')
  bool isDriver;
  @JsonKey()
  OrderStatus status;

  DeliveryOrdersResponse({
    required this.id,
    required this.pickup,
    required this.destination,
    required this.photo,
    // required this.numberOfPassengers,
    required this.desiredPickupTime,
    required this.desiredCarModel,
    required this.offeredPrice,
    required this.pickupReference,
    required this.destinationReference,
    required this.commentForDriver,
    required this.createdAt,
    required this.driver,
    required this.user,
    // required this.createdByThisUser,
    required this.isDriver,
    required this.status,
    required this.updatedAt,
  });

  factory DeliveryOrdersResponse.fromJson(Map<String, dynamic> json) =>
      _$DeliveryOrdersResponseFromJson(json);

  Map<String, dynamic> toJson() => _$DeliveryOrdersResponseToJson(this);
}

@JsonSerializable(includeIfNull: true, explicitToJson: true)
class DeliveryOrdersRequest {
  // @JsonKey(defaultValue: 0)
  // int? id;
  @JsonKey(defaultValue: '')
  String pickup;
  @JsonKey(defaultValue: '')
  String destination;
  @JsonKey(defaultValue: '', name: 'desired_pickup_time')
  String desiredPickupTime;

  @JsonKey(defaultValue: '', name: 'offered_price')
  String offeredPrice;
  @JsonKey(defaultValue: '', name: 'pickup_reference')
  String pickupReference;
  @JsonKey(defaultValue: '', name: 'destination_reference')
  String destinationReference;
  @JsonKey(defaultValue: '', name: 'comments_for_driver')
  String commentForDriver;
  @JsonKey(defaultValue: '')
  String status;
  @JsonKey(defaultValue: false, name: 'is_driver')
  bool isDriver;

  DeliveryOrdersRequest({
    // this.id,
    required this.pickup,
    required this.destination,
    required this.desiredPickupTime,
    required this.offeredPrice,
    required this.pickupReference,
    required this.destinationReference,
    required this.commentForDriver,
    required this.status,
    required this.isDriver,
  });

  factory DeliveryOrdersRequest.fromJson(Map<String, dynamic> json) =>
      _$DeliveryOrdersRequestFromJson(json);

  Map<String, dynamic> toJson() => _$DeliveryOrdersRequestToJson(this);
}
