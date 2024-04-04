part of 'orders_bloc.dart';

class OrdersState extends Equatable {
  //post variables start
  final String pickup;
  final String destination;
  final int numberOfPassengers;
  final String date;
  final String offeredPrice;
  final String pickUpReference;
  final String destinationReference;
  final String commentsForDriver;
  // final String phoneNumber;
  final bool isDriver;
  final bool isInitialValuesLoaded;
  final List<String> statusesForFilter;
  //post variables end
  final TaxiOrdersResponse orderByID;
  final DeliveryOrdersResponse deliveryOrderByID;
  final bool isButtonEnabled;
  final bool isOrderDeleted;
  final int randomNumber;
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
    required this.isDriver,
    required this.isInitialValuesLoaded,
    required this.statusesForFilter,
    required this.orderByID,
    required this.deliveryOrderByID,
    required this.isButtonEnabled,
    required this.isOrderDeleted,
    required this.randomNumber,
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
      isDriver: false,
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
        updatedAt: '',
      ),
      isButtonEnabled: false,
      isOrderDeleted: false,
      randomNumber: 0,
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
    bool? isDriver,
    bool? isInitialValuesLoaded,
    List<String>? statusesForFilter,
    TaxiOrdersResponse? orderByID,
    DeliveryOrdersResponse? deliveryOrderByID,
    bool? isButtonEnabled,
    bool? isOrderDeleted,
    int? randomNumber,
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
      randomNumber: randomNumber ?? this.randomNumber,
      pickUpReference: pickUpReference ?? this.pickUpReference,
      destinationReference: destinationReference ?? this.destinationReference,
      commentsForDriver: commentsForDriver ?? this.commentsForDriver,
      isDriver: isDriver ?? this.isDriver,
      isInitialValuesLoaded: isInitialValuesLoaded ?? this.isInitialValuesLoaded,
      statusesForFilter: statusesForFilter ?? this.statusesForFilter,
      orderByID: orderByID ?? this.orderByID,
      deliveryOrderByID: deliveryOrderByID ?? this.deliveryOrderByID,
      isButtonEnabled: isButtonEnabled ?? this.isButtonEnabled,
      isOrderDeleted: isOrderDeleted ?? this.isOrderDeleted,
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
        isDriver,
        isInitialValuesLoaded,
        statusesForFilter,
        orderByID,
        deliveryOrderByID,
        isButtonEnabled,
        isOrderDeleted,
        randomNumber,
        taxiOrdersList,
        deliveryOrdersList,
        blocProgress,
        failureMessage,
      ];
}
