import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:safar/gen/assets.gen.dart';
import 'package:safar/ui_staff/staff_home_page/bloc/inquiry_bloc.dart';
import 'package:safar/ui_staff/staff_home_page/inquiries_tab/widgets/search_and_filter_created.dart';
import 'package:safar/ui_staff/staff_home_page/model/inquiry_list_model.dart';
import 'package:safar/ui_staff/staff_home_page/widgets/filter_card.dart';
import 'package:safar/ui_staff/staff_home_page/widgets/inquiry_card.dart';

class InquiriesTaxiTab extends StatelessWidget {
  final List<String> statusesList;
  final TextEditingController searchTaxi;
  final ScrollController scrollController;

  const InquiriesTaxiTab({
    super.key,
    required this.statusesList,
    required this.searchTaxi,
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
        buttons: [
          InquiryActionButtons(title: 'Assigned', type: 'type', color_scheme: 'color_scheme'),
          InquiryActionButtons(title: 'Assigned', type: 'type', color_scheme: 'color_scheme'),
          InquiryActionButtons(title: 'Assigned', type: 'type', color_scheme: 'color_scheme'),
          InquiryActionButtons(title: 'Assigned', type: 'type', color_scheme: 'color_scheme'),
        ],
        status: Status(title: 'Approved', color_scheme: 'olor(0xff3CA15F)', type: ''),
        created: Created(email: '+99899999999', firstname: 'Abror', lastname: 'Shamuradov'),
        authorDepartment: AuthorDepartment(value: 0, label: ''),
        authorPosition: AuthorPosition(value: 0, label: ''),
        recipient: Recipient(value: 0, label: ''),
        from: 'Oloy bozori, Tashkent',
        to: 'Urganch 9A, Khorazm',
      ),
      InquiryListItemResponse(
        id: 0,
        title: 'Delivery name',
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
        from: 'Aral, Nukus',
        to: 'Kitob Andijon',
      ),
      InquiryListItemResponse(
        id: 0,
        title: 'Item name',
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
        from: ' Suvchilar shaxarchasi, Buxoro',
        to: '2-sonli maktab, Namangan',
      ),
    ];
    return RefreshIndicator(
      color: Theme.of(context).colorScheme.primaryContainer,
      onRefresh: () async {
        // context.read<InquiryBloc>().getInitiallyCreated();
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
                  SearchAndFilterTaxi(
                    state: state,
                    statusesList: statusesList,
                    searchTaxi: searchTaxi,
                  ),
                  _FilterCards(state, context),
                  if (myInquiries.isNotEmpty)
                    ListView.builder(
                      itemCount: myInquiries.length,
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                        return InquiryCard(
                          model: myInquiries,
                          index: index,
                          child: Assets.icons.carTab.image(),
                        );
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

  Padding _FilterCards(InquiryState state, BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 8.w),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: [
            for (var status in state.listOfSelectedStatusesCreated)
              FilterCard(
                text: status,
                onTap: () => context.read<InquiryBloc>().changeStatusTaxi(status),
              ),
          ],
        ),
      ),
    );
  }
}
