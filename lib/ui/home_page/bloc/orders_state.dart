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

  //post variables end
  final OrdersResponse orderByID;
  final bool isButtonEnabled;
  final int randomNumber;
  final SuperBlocProgress<List<InquiryButtons>> buttons;
  final DeliveryOrdersResponse orders;
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
    required this.orderByID,
    required this.isButtonEnabled,
    required this.randomNumber,
    required this.buttons,
    required this.orders,
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
      orderByID: OrdersResponse(
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
      isButtonEnabled: false,
      randomNumber: 0,
      buttons: SuperBlocProgress(model: const []),
      orders: DeliveryOrdersResponse(count: 0, results: []),
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
    OrdersResponse? orderByID,
    bool? isButtonEnabled,
    int? randomNumber,
    SuperBlocProgress<List<InquiryButtons>>? buttons,
    DeliveryOrdersResponse? orders,
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
      orderByID: orderByID ?? this.orderByID,
      isButtonEnabled: isButtonEnabled ?? this.isButtonEnabled,
      buttons: buttons ?? this.buttons,
      orders: orders ?? this.orders,
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
        orderByID,
        isButtonEnabled,
        randomNumber,
        buttons,
        orders,
        blocProgress,
        failureMessage,
      ];
}
