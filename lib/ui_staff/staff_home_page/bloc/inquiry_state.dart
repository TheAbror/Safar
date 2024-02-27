part of 'inquiry_bloc.dart';

class InquiryState extends Equatable {
  final int randomNumber;
  final SuperBlocProgress<List<InquiryButtons>> buttons;
  final DeliveryOrdersResponse orders;
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
      orders: DeliveryOrdersResponse(count: 0, results: []),
      blocProgress: BlocProgress.NOT_STARTED,
      failureMessage: '',
    );
  }

  InquiryState copyWith({
    int? randomNumber,
    SuperBlocProgress<List<InquiryButtons>>? buttons,
    DeliveryOrdersResponse? orders,
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
