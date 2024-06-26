part of 'orders_bloc.dart';

class OrdersState extends Equatable {
  // taxi post variables start
  final String pickup;
  final String destination;
  final int numberOfPassengers;
  final String date;
  final String offeredPrice;
  final String pickUpReference;
  final String destinationReference;
  final String commentsForDriver;
  final String taxiPhoneNumber;
  final bool isDriver;
  //taxi post variables end

  // delivery post variables start
  final String deliveryPickup;
  final String deliveryDestination;
  final String deliveryDate;
  final String deliveryOfferedPrice;
  final String deliveryPickUpReference;
  final String deliveryDestinationReference;
  final String deliveryCommentsForDriver;
  final String deliveryPhoneNumber;
  final bool deliveryIsDriver;
  final List<DeliveryItem> listofItems;

  //taxi delivery variables end

  final bool isInitialValuesLoaded;
  final List<String> statusesForFilter;
  final TaxiOrdersResponse orderByID;
  final DeliveryOrdersResponse deliveryOrderByID;
  final bool isButtonEnabled;
  final bool isDeliveryButtonEnabled;
  final bool isOrderDeleted;
  final bool isDeliveryOrderDeleted;
  final bool isDeliveryPostSuccessfull;
  final AllTaxiOrdersResponse taxiOrdersList;
  final AllDeliveryOrdersResponse deliveryOrdersList;
  final BlocProgress blocProgress;
  final String failureMessage;

  const OrdersState({
    required this.pickup,
    required this.destination,
    required this.numberOfPassengers,
    required this.date,
    required this.offeredPrice,
    required this.pickUpReference,
    required this.destinationReference,
    required this.commentsForDriver,
    required this.taxiPhoneNumber,
    required this.isDriver,
    required this.deliveryPickup,
    required this.deliveryDestination,
    required this.deliveryDate,
    required this.deliveryOfferedPrice,
    required this.deliveryPickUpReference,
    required this.deliveryDestinationReference,
    required this.deliveryCommentsForDriver,
    required this.deliveryPhoneNumber,
    required this.deliveryIsDriver,
    required this.listofItems,
    required this.isInitialValuesLoaded,
    required this.statusesForFilter,
    required this.orderByID,
    required this.deliveryOrderByID,
    required this.isButtonEnabled,
    required this.isDeliveryButtonEnabled,
    required this.isOrderDeleted,
    required this.isDeliveryOrderDeleted,
    required this.isDeliveryPostSuccessfull,
    required this.taxiOrdersList,
    required this.deliveryOrdersList,
    required this.blocProgress,
    required this.failureMessage,
  });

  factory OrdersState.initial() {
    return OrdersState(
      pickup: '',
      destination: '',
      numberOfPassengers: -1,
      date: '',
      offeredPrice: '',
      pickUpReference: '',
      destinationReference: '',
      commentsForDriver: '',
      taxiPhoneNumber: '',
      isDriver: false,
      deliveryPickup: '',
      deliveryDestination: '',
      deliveryDate: '',
      deliveryOfferedPrice: '',
      deliveryPickUpReference: '',
      deliveryDestinationReference: '',
      deliveryCommentsForDriver: '',
      deliveryPhoneNumber: '',
      deliveryIsDriver: false,
      listofItems: const [],
      isInitialValuesLoaded: false,
      statusesForFilter: const [],
      orderByID: TaxiOrdersResponse(
        id: 0,
        pickup: '',
        destination: '',
        numberOfPassengers: -1,
        desiredPickupTime: '',
        desiredCarModel: '',
        offeredPrice: '',
        pickupReference: '',
        destinationReference: '',
        commentForDriver: '',
        createdAt: '',
        driver: 0,
        user: 0,
        createdByThisUser: false,
        isDriver: false,
        status: OrderStatus(key: '', value: ''),
        updatedAt: '',
        username: '',
      ),
      deliveryOrderByID: DeliveryOrdersResponse(
        id: 0,
        pickup: '',
        destination: '',
        photo: '',
        desiredPickupTime: '',
        desiredCarModel: '',
        offeredPrice: '',
        pickupReference: '',
        destinationReference: '',
        commentForDriver: '',
        createdAt: '',
        driver: 0,
        user: 0,
        isDriver: false,
        status: OrderStatus(key: '', value: ''),
        updatedAt: '',
        username: '',
        createdByThisUser: false,
      ),
      isButtonEnabled: false,
      isDeliveryButtonEnabled: false,
      isOrderDeleted: false,
      isDeliveryOrderDeleted: false,
      isDeliveryPostSuccessfull: false,
      taxiOrdersList: AllTaxiOrdersResponse(count: 0, results: []),
      deliveryOrdersList: AllDeliveryOrdersResponse(count: 0, results: []),
      blocProgress: BlocProgress.NOT_STARTED,
      failureMessage: '',
    );
  }

  OrdersState copyWith({
    String? pickup,
    String? destination,
    int? numberOfPassengers,
    String? date,
    String? offeredPrice,
    String? pickUpReference,
    String? destinationReference,
    String? commentsForDriver,
    String? taxiPhoneNumber,
    bool? isDriver,
    String? deliveryPickup,
    String? deliveryDestination,
    String? deliveryDate,
    String? deliveryOfferedPrice,
    String? deliveryPickUpReference,
    String? deliveryDestinationReference,
    String? deliveryCommentsForDriver,
    String? deliveryPhoneNumber,
    bool? deliveryIsDriver,
    List<DeliveryItem>? listofItems,
    bool? isInitialValuesLoaded,
    List<String>? statusesForFilter,
    TaxiOrdersResponse? orderByID,
    DeliveryOrdersResponse? deliveryOrderByID,
    bool? isButtonEnabled,
    bool? isDeliveryButtonEnabled,
    bool? isOrderDeleted,
    bool? isDeliveryOrderDeleted,
    bool? isDeliveryPostSuccessfull,
    AllTaxiOrdersResponse? taxiOrdersList,
    AllDeliveryOrdersResponse? deliveryOrdersList,
    BlocProgress? blocProgress,
    String? failureMessage,
  }) {
    return OrdersState(
      pickup: pickup ?? this.pickup,
      destination: destination ?? this.destination,
      numberOfPassengers: numberOfPassengers ?? this.numberOfPassengers,
      date: date ?? this.date,
      offeredPrice: offeredPrice ?? this.offeredPrice,
      pickUpReference: pickUpReference ?? this.pickUpReference,
      destinationReference: destinationReference ?? this.destinationReference,
      commentsForDriver: commentsForDriver ?? this.commentsForDriver,
      taxiPhoneNumber: taxiPhoneNumber ?? this.taxiPhoneNumber,
      isDriver: isDriver ?? this.isDriver,
      deliveryPickup: deliveryPickup ?? this.deliveryPickup,
      deliveryDestination: deliveryDestination ?? this.deliveryDestination,
      deliveryDate: deliveryDate ?? this.deliveryDate,
      deliveryOfferedPrice: deliveryOfferedPrice ?? this.deliveryOfferedPrice,
      deliveryPickUpReference: deliveryPickUpReference ?? this.deliveryPickUpReference,
      deliveryDestinationReference:
          deliveryDestinationReference ?? this.deliveryDestinationReference,
      deliveryCommentsForDriver: deliveryCommentsForDriver ?? this.deliveryCommentsForDriver,
      deliveryPhoneNumber: deliveryPhoneNumber ?? this.deliveryPhoneNumber,
      deliveryIsDriver: deliveryIsDriver ?? this.deliveryIsDriver,
      listofItems: listofItems ?? this.listofItems,
      isInitialValuesLoaded: isInitialValuesLoaded ?? this.isInitialValuesLoaded,
      statusesForFilter: statusesForFilter ?? this.statusesForFilter,
      orderByID: orderByID ?? this.orderByID,
      deliveryOrderByID: deliveryOrderByID ?? this.deliveryOrderByID,
      isButtonEnabled: isButtonEnabled ?? this.isButtonEnabled,
      isDeliveryButtonEnabled: isDeliveryButtonEnabled ?? this.isDeliveryButtonEnabled,
      isOrderDeleted: isOrderDeleted ?? this.isOrderDeleted,
      isDeliveryOrderDeleted: isDeliveryOrderDeleted ?? this.isDeliveryOrderDeleted,
      isDeliveryPostSuccessfull: isDeliveryPostSuccessfull ?? this.isDeliveryPostSuccessfull,
      taxiOrdersList: taxiOrdersList ?? this.taxiOrdersList,
      deliveryOrdersList: deliveryOrdersList ?? this.deliveryOrdersList,
      blocProgress: blocProgress ?? this.blocProgress,
      failureMessage: failureMessage ?? this.failureMessage,
    );
  }

  @override
  List<Object?> get props => [
        pickup,
        destination,
        numberOfPassengers,
        date,
        offeredPrice,
        pickUpReference,
        destinationReference,
        commentsForDriver,
        taxiPhoneNumber,
        isDriver,
        deliveryPickup,
        deliveryDestination,
        deliveryDate,
        deliveryOfferedPrice,
        deliveryPickUpReference,
        deliveryDestinationReference,
        deliveryCommentsForDriver,
        deliveryPhoneNumber,
        deliveryIsDriver,
        listofItems,
        isInitialValuesLoaded,
        statusesForFilter,
        orderByID,
        deliveryOrderByID,
        isButtonEnabled,
        isDeliveryButtonEnabled,
        isOrderDeleted,
        isDeliveryOrderDeleted,
        isDeliveryPostSuccessfull,
        taxiOrdersList,
        deliveryOrdersList,
        blocProgress,
        failureMessage,
      ];
}
