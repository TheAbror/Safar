part of 'inquiry_bloc.dart';

class InquiryState extends Equatable {
  final int randomNumber;
  final SuperBlocProgress<List<InquiryButtons>> buttons;
  final OrdersResponse orders;
  final BlocProgress blocProgress;
  final String failureMessage;

  const InquiryState({
    required this.randomNumber,
    required this.buttons,
    required this.orders,
    required this.blocProgress,
    required this.failureMessage,
  });

  factory InquiryState.initial() {
    return InquiryState(
      randomNumber: 0,
      buttons: SuperBlocProgress(model: const []),
      orders: OrdersResponse(
        id: 0,
        pickup: '',
        destination: '',
        numberOfPassengers: 0,
        desiredPickupTime: '',
        desiredCarModel: '',
        offeredPrice: 0,
        pickupReference: '',
        destinationReference: '',
        commentForDriver: '',
        assignedAt: '',
        assigned: false,
        created: false,
        createdAt: '',
        delivered: false,
        deliveredAt: '',
        driver: 0,
        inProcess: false,
        inProcessAt: '',
        updateRequired: false,
        user: 0,
      ),
      blocProgress: BlocProgress.NOT_STARTED,
      failureMessage: '',
    );
  }

  InquiryState copyWith({
    int? randomNumber,
    SuperBlocProgress<List<InquiryButtons>>? buttons,
    OrdersResponse? orders,
    BlocProgress? blocProgress,
    String? failureMessage,
  }) {
    return InquiryState(
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
