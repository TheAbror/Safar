import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:safar/core/bloc_progress/bloc_progress.dart';
import 'package:safar/core/colors/app_colors.dart';
import 'package:safar/core/constants/something_went_wrong.dart';
import 'package:safar/gen/assets.gen.dart';
import 'package:safar/ui_staff/staff_home_page/bloc/inquiry_bloc.dart';
import 'package:safar/ui_staff/staff_home_page/inquiries_tab/widgets/search_and_filter.dart';
import 'package:safar/ui_staff/staff_home_page/widgets/inquiry_card.dart';

class InquiriesDeliveryTab extends StatelessWidget {
  final List<String> statusesList;
  final TextEditingController searchDelivery;
  final ScrollController scrollController;

  const InquiriesDeliveryTab({
    super.key,
    required this.statusesList,
    required this.searchDelivery,
    required this.scrollController,
  });

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      color: Theme.of(context).colorScheme.primaryContainer,
      onRefresh: () async {
        context.read<InquiryBloc>().getInitiallyAssigned();
      },
      child: BlocBuilder<InquiryBloc, InquiryState>(
        builder: (context, state) {
          if (state.blocProgress == BlocProgress.IS_LOADING) {
            return const Center(
              child: CircularProgressIndicator(color: AppColors.primary),
            );
          }
          if (state.blocProgress == BlocProgress.FAILED) {
            return SomethingWentWrong();
          }
          return SingleChildScrollView(
            controller: scrollController,
            physics: const AlwaysScrollableScrollPhysics(),
            child: Padding(
              padding: EdgeInsets.only(bottom: 100.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SearchAndFilterDelivery(
                    state: state,
                    statusesList: statusesList,
                    searchDelivery: searchDelivery,
                  ),
                  _FilterCards(state, context),
                  // if (state.orders)
                  ListView.builder(
                    itemCount: state.orders.results.length,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      return InquiryCard(
                        model: state.orders.results,
                        index: index,
                        child: Assets.icons.deliveryIcon.image(),
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
          children: const [
            // for (var status in state.listOfSelectedStatusesAssigned)
            //   FilterCard(
            //     text: status,
            //     onTap: () => context.read<InquiryBloc>().changeStatusDelivery(status),
            //   ),
          ],
        ),
      ),
    );
  }
}






//  List<InquiryListItemResponse> myInquiries = [
//       InquiryListItemResponse(
//         id: 0,
//         title: 'Объект номер 1',
//         description: 'Доставьте быстро этот товар в Ургенч',
//         items: [Items(id: 0, name: 'dsaà', quantity: 9)],
//         created_date: 0,
//         updated_date: 0,
//         editable: false,
//         history: const [],
//         buttons: [
//           InquiryActionButtons(title: 'Assigned', type: 'type', color_scheme: 'color_scheme'),
//           InquiryActionButtons(title: 'Assigned', type: 'type', color_scheme: 'color_scheme'),
//           InquiryActionButtons(title: 'Assigned', type: 'type', color_scheme: 'color_scheme'),
//           InquiryActionButtons(title: 'Assigned', type: 'type', color_scheme: 'color_scheme'),
//         ],
//         status: Status(title: 'Доставлено', color_scheme: 'olor(0xff3CA15F)', type: ''),
//         created: Created(email: '+998912995539', firstname: 'Аброр', lastname: 'Шамурадов'),
//         authorDepartment: AuthorDepartment(value: 0, label: ''),
//         authorPosition: AuthorPosition(value: 0, label: ''),
//         recipient: Recipient(value: 0, label: ''),
//         from: 'Олой бозори 9А, Ташкент',
//         to: 'Ургенч, Хорезм',
//       ),
//       InquiryListItemResponse(
//         id: 0,
//         title: 'Объект номер 2',
//         description: 'Доставьте быстро этот товар в Андижан',
//         items: [Items(id: 0, name: 'dsaà', quantity: 9)],
//         created_date: 0,
//         updated_date: 0,
//         editable: false,
//         history: const [],
//         buttons: const [],
//         status: Status(title: 'В пути', color_scheme: 'olor(0xff3CA15F)', type: ''),
//         created: Created(email: '+998991116785', firstname: 'Аббос', lastname: 'Воситов'),
//         authorDepartment: AuthorDepartment(value: 0, label: ''),
//         authorPosition: AuthorPosition(value: 0, label: ''),
//         recipient: Recipient(value: 0, label: ''),
//         from: 'Арал, Нукус',
//         to: 'Китоб, Андижан',
//       ),
//       InquiryListItemResponse(
//         id: 0,
//         title: 'Item name',
//         description: 'Some more details',
//         items: [Items(id: 0, name: 'dsaà', quantity: 9)],
//         created_date: 0,
//         updated_date: 0,
//         editable: false,
//         history: const [],
//         buttons: const [],
//         status: Status(title: 'Approved', color_scheme: 'olor(0xff3CA15F)', type: ''),
//         created: Created(email: '+99899999999', firstname: 'Abror', lastname: 'Shamuradov'),
//         authorDepartment: AuthorDepartment(value: 0, label: ''),
//         authorPosition: AuthorPosition(value: 0, label: ''),
//         recipient: Recipient(value: 0, label: ''),
//         from: ' Suvchilar shaxarchasi, Buxoro',
//         to: '2-sonli maktab, Namangan',
//       ),
//     ];