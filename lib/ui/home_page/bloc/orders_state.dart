part of 'orders_bloc.dart';

class OrdersState extends Equatable {
  final int randomNumber;
  final int numberOfPassengers;
  final String date;
  final SuperBlocProgress<List<InquiryButtons>> buttons;
  final DeliveryOrdersResponse orders;
  final BlocProgress blocProgress;
  final String failureMessage;

  const OrdersState({
    required this.randomNumber,
    required this.numberOfPassengers,
    required this.date,
    required this.buttons,
    required this.orders,
    required this.blocProgress,
    required this.failureMessage,
  });

  factory OrdersState.initial() {
    return OrdersState(
      randomNumber: 0,
      numberOfPassengers: -1,
      date: '',
      buttons: SuperBlocProgress(model: const []),
      orders: DeliveryOrdersResponse(count: 0, results: []),
      blocProgress: BlocProgress.NOT_STARTED,
      failureMessage: '',
    );
  }

  OrdersState copyWith({
    int? randomNumber,
    int? numberOfPassengers,
    String? date,
    SuperBlocProgress<List<InquiryButtons>>? buttons,
    DeliveryOrdersResponse? orders,
    BlocProgress? blocProgress,
    String? failureMessage,
  }) {
    return OrdersState(
      randomNumber: randomNumber ?? this.randomNumber,
      numberOfPassengers: numberOfPassengers ?? this.numberOfPassengers,
      date: date ?? this.date,
      buttons: buttons ?? this.buttons,
      orders: orders ?? this.orders,
      blocProgress: blocProgress ?? this.blocProgress,
      failureMessage: failureMessage ?? this.failureMessage,
    );
  }

  @override
  List<Object?> get props => [
        randomNumber,
        numberOfPassengers,
        date,
        buttons,
        orders,
        blocProgress,
        failureMessage,
      ];
}
