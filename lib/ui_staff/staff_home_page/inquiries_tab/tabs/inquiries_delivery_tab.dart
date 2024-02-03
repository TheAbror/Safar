import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:safar/core/bloc_progress/bloc_progress.dart';
import 'package:safar/ui_staff/staff_home_page/bloc/inquiry_bloc.dart';
import 'package:safar/ui_staff/staff_home_page/widgets/inquiry_card.dart';
import 'package:safar/ui_staff/staff_home_page/inquiries_tab/widgets/search_and_filter.dart';
import 'package:safar/ui_staff/staff_home_page/inquiries_tab/widgets/loader_and_wrong_widgets.dart';
import '../../model/inquiry_list_model.dart';
import '../../widgets/filter_card.dart';

class InquiriesDeliveryTab extends StatelessWidget {
  final List<String> statusesList;
  final TextEditingController searchAssigned;
  final ScrollController scrollController;

  const InquiriesDeliveryTab({
    super.key,
    required this.statusesList,
    required this.searchAssigned,
    required this.scrollController,
  });

  @override
  Widget build(BuildContext context) {
    List<InquiryListItemResponse> myInquiries = [
      InquiryListItemResponse(
        id: 0,
        title: 'Package name',
        description: 'Some more details',
        items: [Items(id: 0, name: 'dsaà', quantity: 9)],
        created_date: 0,
        updated_date: 0,
        editable: false,
        history: const [],
        buttons: const [],
        status: Status(title: 'Approved', color_scheme: 'olor(0xff3CA15F)', type: ''),
        created: Created(email: '+99899999999', firstname: 'Abror', lastname: 'Shamuradov'),
        authorDepartment: AuthorDepartment(value: 0, label: ''),
        authorPosition: AuthorPosition(value: 0, label: ''),
        recipient: Recipient(value: 0, label: ''),
        recipientGroup: RecipientGroupType(value: '', label: ''),
        from: 'Oloy bozori, Tashkent',
        recipientPostion: '',
        to: 'Urganch 9A, Khorazm',
      ),
      InquiryListItemResponse(
        id: 0,
        title: 'Package name',
        description: 'Some more details',
        items: [Items(id: 0, name: 'dsaà', quantity: 9)],
        created_date: 0,
        updated_date: 0,
        editable: false,
        history: const [],
        buttons: const [],
        status: Status(title: 'Approved', color_scheme: 'olor(0xff3CA15F)', type: ''),
        created: Created(email: '+998991116785', firstname: 'Abbos', lastname: 'Vositov'),
        authorDepartment: AuthorDepartment(value: 0, label: ''),
        authorPosition: AuthorPosition(value: 0, label: ''),
        recipient: Recipient(value: 0, label: ''),
        recipientGroup: RecipientGroupType(value: '', label: ''),
        from: 'Aral, Nukus',
        recipientPostion: '',
        to: 'Kitob Andijon',
      ),
      InquiryListItemResponse(
        id: 0,
        title: 'Package name',
        description: 'Some more details',
        items: [Items(id: 0, name: 'dsaà', quantity: 9)],
        created_date: 0,
        updated_date: 0,
        editable: false,
        history: const [],
        buttons: const [],
        status: Status(title: 'Approved', color_scheme: 'olor(0xff3CA15F)', type: ''),
        created: Created(email: '+99899999999', firstname: 'Abror', lastname: 'Shamuradov'),
        authorDepartment: AuthorDepartment(value: 0, label: ''),
        authorPosition: AuthorPosition(value: 0, label: ''),
        recipient: Recipient(value: 0, label: ''),
        recipientGroup: RecipientGroupType(value: '', label: ''),
        from: ' Suvchilar shaxarchasi, Buxoro',
        recipientPostion: '',
        to: '2-sonli maktab, Namangan',
      ),
    ];
    return RefreshIndicator(
      color: Theme.of(context).colorScheme.primaryContainer,
      onRefresh: () async {
        context.read<InquiryBloc>().getInitiallyAssigned();
      },
      child: BlocBuilder<InquiryBloc, InquiryState>(
        builder: (context, state) {
          return SingleChildScrollView(
            controller: scrollController,
            physics: const AlwaysScrollableScrollPhysics(),
            child: Padding(
              padding: EdgeInsets.only(bottom: 100.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SearchAndFilterAssigned(
                    state: state,
                    statusesList: statusesList,
                    searchAssigned: searchAssigned,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8.w),
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          for (var status in state.listOfSelectedStatusesAssigned)
                            FilterCard(
                              text: status,
                              onTap: () => context.read<InquiryBloc>().changeStatusAssigned(status),
                            ),
                        ],
                      ),
                    ),
                  ),
                  if (state.assigned.blocProgress == BlocProgress.IS_LOADING &&
                      state.assignedFiltered.isEmpty)
                    TabsLoader()
                  // else if (state.assigned.blocProgress == BlocProgress.FAILED)
                  //   const SomethingWentWrong()
                  else if (myInquiries.isNotEmpty)
                    ListView.builder(
                      itemCount: myInquiries.length,
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                        return InquiryCard(model: myInquiries, index: index);
                      },
                    )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
