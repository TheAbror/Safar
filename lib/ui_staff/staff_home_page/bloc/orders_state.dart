part of 'orders_bloc.dart';

class OrdersState extends Equatable {
  final int randomNumber;
  final SuperBlocProgress<List<InquiryButtons>> buttons;
  final DeliveryOrdersResponse orders;
  final BlocProgress blocProgress;
  final String failureMessage;

  const OrdersState({
    required this.randomNumber,
    required this.buttons,
    required this.orders,
    required this.blocProgress,
    required this.failureMessage,
  });

  factory OrdersState.initial() {
    return OrdersState(
      randomNumber: 0,
      buttons: SuperBlocProgress(model: const []),
      orders: DeliveryOrdersResponse(count: 0, results: []),
      blocProgress: BlocProgress.NOT_STARTED,
      failureMessage: '',
    );
  }

  OrdersState copyWith({
    int? randomNumber,
    SuperBlocProgress<List<InquiryButtons>>? buttons,
    DeliveryOrdersResponse? orders,
    BlocProgress? blocProgress,
    String? failureMessage,
  }) {
    return OrdersState(
      randomNumber: randomNumber ?? this.randomNumber,
      buttons: buttons ?? this.buttons,
      orders: orders ?? this.orders,
      blocProgress: blocProgress ?? this.blocProgress,
      failureMessage: failureMessage ?? this.failureMessage,
    );
  }

  @override
  List<Object?> get props => [
        randomNumber,
        buttons,
        orders,
        blocProgress,
        failureMessage,
      ];
}
