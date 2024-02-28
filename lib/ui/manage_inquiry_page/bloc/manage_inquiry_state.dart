part of 'manage_inquiry_bloc.dart';

class ManageInquiryState extends Equatable {
  final String title;
  final String description;
  final int recipientID;
  final String recipientName;
  final String recipientGroup;
  final InquiryListItemResponse data;
  final InquiryListItemResponse item;
  final bool isInitialValuesLoaded;
  final bool isButtonEnabled;
  final List<InquiryItem> listofItems;
  final List<MeasurementResponse> measurementsList;
  final BlocProgress blocProgress;
  final String failureMessage;

  const ManageInquiryState({
    required this.title,
    required this.description,
    required this.recipientID,
    required this.recipientName,
    required this.recipientGroup,
    required this.item,
    required this.data,
    required this.isInitialValuesLoaded,
    required this.isButtonEnabled,
    required this.listofItems,
    required this.measurementsList,
    required this.blocProgress,
    required this.failureMessage,
  });

  factory ManageInquiryState.initial() {
    return ManageInquiryState(
      title: '',
      description: '',
      recipientID: 0,
      recipientName: '',
      recipientGroup: 'STAFF',
      item: InquiryListItemResponse(
        id: 0,
        title: '',
        description: '',
        items: const [],
        created_date: 0,
        updated_date: 0,
        editable: false,
        history: const [],
        buttons: const [],
        authorDepartment: AuthorDepartment(label: '', value: 0),
        authorPosition: AuthorPosition(label: '', value: 0),
        recipient: Recipient(value: 0, label: ''),
        from: '',
        to: '',
      ),
      data: InquiryListItemResponse(
        id: 0,
        title: '',
        description: '',
        items: const [],
        created_date: 0,
        updated_date: 0,
        editable: false,
        history: const [],
        buttons: const [],
        authorDepartment: AuthorDepartment(label: '', value: 0),
        authorPosition: AuthorPosition(label: '', value: 0),
        recipient: Recipient(value: 0, label: ''),
        from: '',
        to: '',
      ),
      isInitialValuesLoaded: false,
      isButtonEnabled: false,
      listofItems: const [],
      measurementsList: [MeasurementResponse(label: '', value: '')],
      blocProgress: BlocProgress.IS_LOADING,
      failureMessage: '',
    );
  }

  ManageInquiryState copyWith({
    String? title,
    String? description,
    int? recipientID,
    String? recipientName,
    String? recipientGroup,
    InquiryListItemResponse? data,
    InquiryListItemResponse? item,
    bool? isInitialValuesLoaded,
    bool? isButtonEnabled,
    List<InquiryItem>? listofItems,
    List<MeasurementResponse>? measurementsList,
    BlocProgress? blocProgress,
    String? failureMessage,
  }) {
    return ManageInquiryState(
      title: title ?? this.title,
      description: description ?? this.description,
      recipientID: recipientID ?? this.recipientID,
      recipientName: recipientName ?? this.recipientName,
      recipientGroup: recipientGroup ?? this.recipientGroup,
      data: data ?? this.data,
      item: item ?? this.item,
      isInitialValuesLoaded: isInitialValuesLoaded ?? this.isInitialValuesLoaded,
      isButtonEnabled: isButtonEnabled ?? this.isButtonEnabled,
      listofItems: listofItems ?? this.listofItems,
      measurementsList: measurementsList ?? this.measurementsList,
      blocProgress: blocProgress ?? this.blocProgress,
      failureMessage: failureMessage ?? this.failureMessage,
    );
  }

  @override
  List<Object?> get props => [
        title,
        description,
        recipientID,
        recipientName,
        recipientGroup,
        data,
        item,
        isInitialValuesLoaded,
        isButtonEnabled,
        listofItems,
        blocProgress,
        failureMessage,
        measurementsList,
      ];
}
