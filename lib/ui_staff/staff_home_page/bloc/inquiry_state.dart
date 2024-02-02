part of 'inquiry_bloc.dart';

class InquiryState extends Equatable {
  // Assigned //
  final int assignedCounter;
  final int assignedTotalElements;
  final SuperBlocProgress<InquiryListResponse> assigned;
  final List<InquiryListItemResponse> assignedFiltered;
  final List<String> listOfSelectedStatusesAssigned;
  // Assigned //

  // Created //
  final int counterCreated;
  final int createdTotalElements;
  final SuperBlocProgress<InquiryListResponse> created;
  final List<InquiryListItemResponse> createdFiltered;
  final List<String> listOfSelectedStatusesCreated;
  // Created //

  final int randomNumber;
  final SuperBlocProgress<List<InquiryButtons>> buttons;

  const InquiryState({
    required this.assignedCounter,
    required this.assignedTotalElements,
    required this.assigned,
    required this.assignedFiltered,
    required this.listOfSelectedStatusesAssigned,
    required this.counterCreated,
    required this.createdTotalElements,
    required this.created,
    required this.createdFiltered,
    required this.listOfSelectedStatusesCreated,
    required this.randomNumber,
    required this.buttons,
  });

  factory InquiryState.initial() {
    var superBlocProgress = SuperBlocProgress(
      model: InquiryListResponse(
        last: false,
        totalElements: 0,
        totalPages: 0,
        pageable: Pageable(
          offset: 0,
          pageNumber: 0,
          pageSize: 0,
          paged: false,
          sort: Sort(
            unsorted: false,
            sorted: false,
            empty: false,
          ),
          unpaged: false,
        ),
        content: [],
      ),
    );
    return InquiryState(
      assignedCounter: 0,
      assignedTotalElements: 0,
      assigned: superBlocProgress,
      assignedFiltered: const [],
      listOfSelectedStatusesAssigned: const [],
      counterCreated: 0,
      createdTotalElements: 0,
      created: superBlocProgress,
      listOfSelectedStatusesCreated: const [],
      randomNumber: 0,
      buttons: SuperBlocProgress(model: const []),
      createdFiltered: const [],
    );
  }

  InquiryState copyWith({
    int? assignedCounter,
    int? assignedTotalElements,
    SuperBlocProgress<InquiryListResponse>? assigned,
    List<InquiryListItemResponse>? assignedFiltered,
    List<String>? listOfSelectedStatusesAssigned,
    int? counterCreated,
    int? createdTotalElements,
    SuperBlocProgress<InquiryListResponse>? created,
    List<InquiryListItemResponse>? createdFiltered,
    List<String>? listOfSelectedStatusesCreated,
    int? randomNumber,
    SuperBlocProgress<List<InquiryButtons>>? buttons,
    String? failureMessage,
  }) {
    return InquiryState(
      assignedCounter: assignedCounter ?? this.assignedCounter,
      assigned: assigned ?? this.assigned,
      assignedFiltered: assignedFiltered ?? this.assignedFiltered,
      listOfSelectedStatusesAssigned:
          listOfSelectedStatusesAssigned ?? this.listOfSelectedStatusesAssigned,
      counterCreated: counterCreated ?? this.counterCreated,
      createdTotalElements: createdTotalElements ?? this.createdTotalElements,
      created: created ?? this.created,
      createdFiltered: createdFiltered ?? this.createdFiltered,
      listOfSelectedStatusesCreated:
          listOfSelectedStatusesCreated ?? this.listOfSelectedStatusesCreated,
      randomNumber: randomNumber ?? this.randomNumber,
      buttons: buttons ?? this.buttons,
      assignedTotalElements: assignedTotalElements ?? this.assignedTotalElements,
    );
  }

  @override
  List<Object?> get props => [
        assignedCounter,
        assignedTotalElements,
        assigned,
        assignedFiltered,
        listOfSelectedStatusesAssigned,
        counterCreated,
        created,
        createdTotalElements,
        createdFiltered,
        listOfSelectedStatusesCreated,
        randomNumber,
        buttons,
      ];
}
