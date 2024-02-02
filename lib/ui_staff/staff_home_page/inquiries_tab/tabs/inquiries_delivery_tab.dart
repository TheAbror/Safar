import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:safar/core/bottomsheet/primary_loader.dart';
import 'package:safar/core/bloc_progress/bloc_progress.dart';
import 'package:safar/ui_staff/staff_home_page/bloc/inquiry_bloc.dart';
import 'package:safar/ui_staff/staff_home_page/widgets/inquiry_card.dart';
import 'package:safar/ui_staff/staff_home_page/inquiries_tab/widgets/search_and_filter.dart';
import 'package:safar/ui_staff/staff_home_page/inquiries_tab/widgets/loader_and_wrong_widgets.dart';
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
                  else if (state.assignedFiltered.isNotEmpty)
                    ListView.builder(
                      itemCount: state.assignedFiltered.length + 1,
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                        if (index < state.assignedFiltered.length) {
                          return InquiryCard(model: state.assignedFiltered, index: index);
                        } else if (state.assigned.blocProgress == BlocProgress.IS_LOADING) {
                          return Padding(
                            padding: EdgeInsets.only(top: 40.h),
                            child: PrimaryLoader(),
                          );
                        } else {
                          return SizedBox();
                        }
                      },
                    )
                  else if (state.assignedFiltered.isEmpty)
                    TabsNoData()
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
