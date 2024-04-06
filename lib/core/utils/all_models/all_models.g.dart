// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'all_models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SignInResponse _$SignInResponseFromJson(Map<String, dynamic> json) =>
    SignInResponse(
      token: json['token'] as String? ?? '',
      username: json['username'] as String? ?? '',
      detail: json['detail'] as String? ?? '',
    );

Map<String, dynamic> _$SignInResponseToJson(SignInResponse instance) =>
    <String, dynamic>{
      'token': instance.token,
      'username': instance.username,
      'detail': instance.detail,
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

AllTaxiOrdersResponse _$AllTaxiOrdersResponseFromJson(
        Map<String, dynamic> json) =>
    AllTaxiOrdersResponse(
      count: json['count'] as int? ?? 0,
      results: (json['results'] as List<dynamic>?)
              ?.map(
                  (e) => TaxiOrdersResponse.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
    );

Map<String, dynamic> _$AllTaxiOrdersResponseToJson(
        AllTaxiOrdersResponse instance) =>
    <String, dynamic>{
      'count': instance.count,
      'results': instance.results.map((e) => e.toJson()).toList(),
    };

TaxiOrdersRequest _$TaxiOrdersRequestFromJson(Map<String, dynamic> json) =>
    TaxiOrdersRequest(
      id: json['id'] as int? ?? 0,
      pickup: json['pickup'] as String? ?? '',
      destination: json['destination'] as String? ?? '',
      numberOfPassengers: json['number_passenger'] as int? ?? 0,
      desiredPickupTime: json['desired_pickup_time'] as String? ?? '',
      desiredCarModel: json['desired_car_model'] as String? ?? '',
      offeredPrice: json['offered_price'] as String? ?? '',
      pickupReference: json['pickup_reference'] as String? ?? '',
      destinationReference: json['destination_reference'] as String? ?? '',
      commentForDriver: json['comments_for_driver'] as String? ?? '',
      status: json['status'] as String? ?? '',
      isDriver: json['is_driver'] as bool? ?? false,
    );

Map<String, dynamic> _$TaxiOrdersRequestToJson(TaxiOrdersRequest instance) =>
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
      'status': instance.status,
      'is_driver': instance.isDriver,
    };

TaxiOrdersResponse _$TaxiOrdersResponseFromJson(Map<String, dynamic> json) =>
    TaxiOrdersResponse(
      id: json['id'] as int? ?? 0,
      pickup: json['pickup'] as String? ?? '',
      destination: json['destination'] as String? ?? '',
      numberOfPassengers: json['number_passenger'] as int? ?? 0,
      desiredPickupTime: json['desired_pickup_time'] as String? ?? '',
      desiredCarModel: json['desired_car_model'] as String? ?? '',
      offeredPrice: json['offered_price'] as String? ?? '',
      pickupReference: json['pickup_reference'] as String? ?? '',
      destinationReference: json['destination_reference'] as String? ?? '',
      commentForDriver: json['comments_for_driver'] as String? ?? '',
      createdAt: json['created_at'] as String? ?? '',
      driver: json['driver'] as int? ?? 0,
      user: json['user'] as int? ?? 0,
      createdByThisUser: json['created_by_this_user'] as bool? ?? false,
      isDriver: json['is_driver'] as bool? ?? false,
      status: OrderStatus.fromJson(json['status'] as Map<String, dynamic>),
      updatedAt: json['updated_at'] as String? ?? '',
    );

Map<String, dynamic> _$TaxiOrdersResponseToJson(TaxiOrdersResponse instance) =>
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
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
      'user': instance.user,
      'driver': instance.driver,
      'is_driver': instance.isDriver,
      'created_by_this_user': instance.createdByThisUser,
      'status': instance.status.toJson(),
    };

OrderStatus _$OrderStatusFromJson(Map<String, dynamic> json) => OrderStatus(
      key: json['key'] as String? ?? '',
      value: json['value'] as String? ?? '',
    );

Map<String, dynamic> _$OrderStatusToJson(OrderStatus instance) =>
    <String, dynamic>{
      'key': instance.key,
      'value': instance.value,
    };

DeleteOrderById _$DeleteOrderByIdFromJson(Map<String, dynamic> json) =>
    DeleteOrderById(
      deleted: json['deleted'] as bool,
    );

Map<String, dynamic> _$DeleteOrderByIdToJson(DeleteOrderById instance) =>
    <String, dynamic>{
      'deleted': instance.deleted,
    };

FilterStatusesList _$FilterStatusesListFromJson(Map<String, dynamic> json) =>
    FilterStatusesList(
      statuses: (json['statuses'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          [],
    );

Map<String, dynamic> _$FilterStatusesListToJson(FilterStatusesList instance) =>
    <String, dynamic>{
      'statuses': instance.statuses,
    };

AllDeliveryOrdersResponse _$AllDeliveryOrdersResponseFromJson(
        Map<String, dynamic> json) =>
    AllDeliveryOrdersResponse(
      count: json['count'] as int? ?? 0,
      results: (json['results'] as List<dynamic>?)
              ?.map((e) =>
                  DeliveryOrdersResponse.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
    );

Map<String, dynamic> _$AllDeliveryOrdersResponseToJson(
        AllDeliveryOrdersResponse instance) =>
    <String, dynamic>{
      'count': instance.count,
      'results': instance.results.map((e) => e.toJson()).toList(),
    };

DeliveryOrdersResponse _$DeliveryOrdersResponseFromJson(
        Map<String, dynamic> json) =>
    DeliveryOrdersResponse(
      id: json['id'] as int? ?? 0,
      pickup: json['pickup'] as String? ?? '',
      destination: json['destination'] as String? ?? '',
      photo: json['packaged_photo_url'] as String? ?? '',
      desiredPickupTime: json['desired_pickup_time'] as String? ?? '',
      desiredCarModel: json['desired_car_model'] as String? ?? '',
      offeredPrice: json['offered_price'] as String? ?? '',
      pickupReference: json['pickup_reference'] as String? ?? '',
      destinationReference: json['destination_reference'] as String? ?? '',
      commentForDriver: json['comments_for_driver'] as String? ?? '',
      createdAt: json['created_at'] as String? ?? '',
      driver: json['driver'] as int? ?? 0,
      user: json['user'] as int? ?? 0,
      createdByThisUser: json['created_by_this_user'] as bool? ?? false,
      isDriver: json['is_driver'] as bool? ?? false,
      status: OrderStatus.fromJson(json['status'] as Map<String, dynamic>),
      updatedAt: json['updated_at'] as String? ?? '',
    );

Map<String, dynamic> _$DeliveryOrdersResponseToJson(
        DeliveryOrdersResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'packaged_photo_url': instance.photo,
      'pickup': instance.pickup,
      'destination': instance.destination,
      'desired_pickup_time': instance.desiredPickupTime,
      'desired_car_model': instance.desiredCarModel,
      'offered_price': instance.offeredPrice,
      'pickup_reference': instance.pickupReference,
      'destination_reference': instance.destinationReference,
      'comments_for_driver': instance.commentForDriver,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
      'user': instance.user,
      'driver': instance.driver,
      'is_driver': instance.isDriver,
      'created_by_this_user': instance.createdByThisUser,
      'status': instance.status.toJson(),
    };

DeliveryOrdersRequest _$DeliveryOrdersRequestFromJson(
        Map<String, dynamic> json) =>
    DeliveryOrdersRequest(
      id: json['id'] as int? ?? 0,
      pickup: json['pickup'] as String? ?? '',
      destination: json['destination'] as String? ?? '',
      desiredPickupTime: json['desired_pickup_time'] as String? ?? '',
      offeredPrice: json['offered_price'] as String? ?? '',
      pickupReference: json['pickup_reference'] as String? ?? '',
      destinationReference: json['destination_reference'] as String? ?? '',
      commentForDriver: json['comments_for_driver'] as String? ?? '',
      status: json['status'] as String? ?? '',
      isDriver: json['is_driver'] as bool? ?? false,
    );

Map<String, dynamic> _$DeliveryOrdersRequestToJson(
        DeliveryOrdersRequest instance) =>
    <String, dynamic>{
      'id': instance.id,
      'pickup': instance.pickup,
      'destination': instance.destination,
      'desired_pickup_time': instance.desiredPickupTime,
      'offered_price': instance.offeredPrice,
      'pickup_reference': instance.pickupReference,
      'destination_reference': instance.destinationReference,
      'comments_for_driver': instance.commentForDriver,
      'status': instance.status,
      'is_driver': instance.isDriver,
    };
