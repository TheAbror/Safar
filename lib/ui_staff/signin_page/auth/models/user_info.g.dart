// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SignInResponse _$SignInResponseFromJson(Map<String, dynamic> json) =>
    SignInResponse(
      token: json['token'] as String? ?? '',
      userInfo: UserInfoResponse.fromJson(json['user'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$SignInResponseToJson(SignInResponse instance) =>
    <String, dynamic>{
      'token': instance.token,
      'user': instance.userInfo.toJson(),
    };

UserInfoResponse _$UserInfoResponseFromJson(Map<String, dynamic> json) =>
    UserInfoResponse(
      id: json['id'] as int? ?? 0,
      firstname: json['first_name'] as String? ?? 'error occured',
      lastname: json['last_name'] as String? ?? '',
      dateJoined: json['date_joined'] as String? ?? '',
      lastLogin: json['last_login'] as String? ?? '',
      isStaff: json['is_staff'] as bool? ?? false,
      email: json['email'] as String? ?? '',
      isActive: json['is_active'] as bool? ?? false,
      isSuperUser: json['is_superuser'] as bool? ?? false,
      username: json['username'] as String? ?? '',
      password: json['password'] as String? ?? '',
    );

Map<String, dynamic> _$UserInfoResponseToJson(UserInfoResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'first_name': instance.firstname,
      'last_name': instance.lastname,
      'email': instance.email,
      'date_joined': instance.dateJoined,
      'last_login': instance.lastLogin,
      'is_superuser': instance.isSuperUser,
      'is_staff': instance.isStaff,
      'is_active': instance.isActive,
      'username': instance.username,
      'password': instance.password,
    };

Account _$AccountFromJson(Map<String, dynamic> json) => Account(
      id: json['id'] as int? ?? 0,
      contacts: json['contacts'] as String? ?? '',
      photo: json['photo'] as String? ?? '',
      aboutUser: json['about_user'] as String? ?? '',
    );

Map<String, dynamic> _$AccountToJson(Account instance) => <String, dynamic>{
      'id': instance.id,
      'contacts': instance.contacts,
      'photo': instance.photo,
      'about_user': instance.aboutUser,
    };

DriverRegistrationRequest _$DriverRegistrationRequestFromJson(
        Map<String, dynamic> json) =>
    DriverRegistrationRequest(
      carModel: json['car_model'] as String? ?? '',
      carColor: json['car_color'] as String? ?? '',
      carYear: json['car_year'] as int? ?? 0,
      licencePlate: json['license_plate'] as String? ?? '',
    );

Map<String, dynamic> _$DriverRegistrationRequestToJson(
        DriverRegistrationRequest instance) =>
    <String, dynamic>{
      'car_model': instance.carModel,
      'car_color': instance.carColor,
      'car_year': instance.carYear,
      'license_plate': instance.licencePlate,
    };

DriverProfie _$DriverProfieFromJson(Map<String, dynamic> json) => DriverProfie(
      id: json['id'] as int? ?? 0,
      user: json['user'] as int? ?? 0,
      carModel: json['car_model'] as String? ?? '',
      carColor: json['car_color'] as String? ?? '',
      carYear: json['car_year'] as int? ?? 0,
      licencePlate: json['license_plate'] as String? ?? '',
      registeredAt: json['registered_at'] as String? ?? '',
    );

Map<String, dynamic> _$DriverProfieToJson(DriverProfie instance) =>
    <String, dynamic>{
      'id': instance.id,
      'user': instance.user,
      'car_model': instance.carModel,
      'car_color': instance.carColor,
      'car_year': instance.carYear,
      'license_plate': instance.licencePlate,
      'registered_at': instance.registeredAt,
    };

OrdersRequest _$OrdersRequestFromJson(Map<String, dynamic> json) =>
    OrdersRequest(
      pickup: json['pickup'] as String? ?? '',
      destination: json['destination'] as String? ?? '',
      numberOfPassengers: json['number_passenger'] as int? ?? 0,
      desiredPickupTime: json['desired_pickup_time'] as String? ?? '',
      desiredCarModel: json['desired_car_model'] as String? ?? '',
      offeredPrice: json['offered_price'] as int? ?? 0,
      pickupReference: json['pickup_reference'] as String? ?? '',
      destinationReference: json['destination_reference'] as String? ?? '',
      commentForDriver: json['comments_for_driver'] as String? ?? '',
    );

Map<String, dynamic> _$OrdersRequestToJson(OrdersRequest instance) =>
    <String, dynamic>{
      'pickup': instance.pickup,
      'destination': instance.destination,
      'number_passenger': instance.numberOfPassengers,
      'desired_pickup_time': instance.desiredPickupTime,
      'desired_car_model': instance.desiredCarModel,
      'offered_price': instance.offeredPrice,
      'pickup_reference': instance.pickupReference,
      'destination_reference': instance.destinationReference,
      'comments_for_driver': instance.commentForDriver,
    };

OrdersResponse _$OrdersResponseFromJson(Map<String, dynamic> json) =>
    OrdersResponse(
      id: json['id'] as int? ?? 0,
      pickup: json['pickup'] as String? ?? '',
      destination: json['destination'] as String? ?? '',
      numberOfPassengers: json['number_passenger'] as int? ?? 0,
      desiredPickupTime: json['desired_pickup_time'] as String? ?? '',
      desiredCarModel: json['desired_car_model'] as String? ?? '',
      offeredPrice: json['offered_price'] as int? ?? 0,
      pickupReference: json['pickup_reference'] as String? ?? '',
      destinationReference: json['destination_reference'] as String? ?? '',
      commentForDriver: json['comments_for_driver'] as String? ?? '',
      assignedAt: json['assigned_at'] as String? ?? '',
      assigned: json['assigned'] as bool? ?? false,
      created: json['created'] as bool? ?? false,
      createdAt: json['created_at'] as String? ?? '',
      delivered: json['delivered'] as bool? ?? false,
      deliveredAt: json['delivered_at'] as String? ?? '',
      driver: json['driver'] as int? ?? 0,
      inProcess: json['in_process'] as bool? ?? false,
      inProcessAt: json['in_process_at'] as String? ?? '',
      updateRequired: json['update_required'] as bool? ?? false,
      user: json['user'] as int? ?? 0,
    );

Map<String, dynamic> _$OrdersResponseToJson(OrdersResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'pickup': instance.pickup,
      'destination': instance.destination,
      'number_passenger': instance.numberOfPassengers,
      'desired_pickup_time': instance.desiredPickupTime,
      'desired_car_model': instance.desiredCarModel,
      'offered_price': instance.offeredPrice,
      'pickup_reference': instance.pickupReference,
      'destination_reference': instance.destinationReference,
      'comments_for_driver': instance.commentForDriver,
      'created': instance.created,
      'created_at': instance.createdAt,
      'assigned': instance.assigned,
      'assigned_at': instance.assignedAt,
      'in_process': instance.inProcess,
      'in_process_at': instance.inProcessAt,
      'update_required': instance.updateRequired,
      'delivered': instance.delivered,
      'delivered_at': instance.deliveredAt,
      'user': instance.user,
      'driver': instance.driver,
    };
