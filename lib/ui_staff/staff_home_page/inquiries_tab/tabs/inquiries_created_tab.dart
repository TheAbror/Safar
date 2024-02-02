import 'package:safar/core/bottomsheet/primary_loader.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:safar/core/bloc_progress/bloc_progress.dart';
import 'package:safar/core/constants/something_went_wrong.dart';
import 'package:safar/ui_staff/staff_home_page/bloc/inquiry_bloc.dart';
import 'package:safar/ui_staff/staff_home_page/widgets/filter_card.dart';
import 'package:safar/ui_staff/staff_home_page/widgets/inquiry_card.dart';
import 'package:safar/ui_staff/staff_home_page/inquiries_tab/widgets/loader_and_wrong_widgets.dart';
import 'package:safar/ui_staff/staff_home_page/inquiries_tab/widgets/search_and_filter_created.dart';

class InquiriesCreatedTab extends StatelessWidget {
  final List<String> statusesList;
  final TextEditingController searchCreated;
  final ScrollController scrollController;

  const InquiriesCreatedTab({
    super.key,
    required this.statusesList,
    required this.searchCreated,
    required this.scrollController,
  });

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      color: Theme.of(context).colorScheme.primaryContainer,
      onRefresh: () async {
        context.read<InquiryBloc>().getInitiallyCreated();
      },
      child: BlocBuilder<InquiryBloc, InquiryState>(
        builder: (context, state) {
          return SingleChildScrollView(
            controller: scrollController,
            physics: const AlwaysScrollableScrollPhysics(),
            child: Padding(
              padding: EdgeInsets.only(bottom: 150.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SearchAndFilterCreated(
                    state: state,
                    statusesList: statusesList,
                    searchCreated: searchCreated,
                  ),
                  //Filer
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8.w),
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          for (var status in state.listOfSelectedStatusesCreated)
                            FilterCard(
                              text: status,
                              onTap: () => context.read<InquiryBloc>().changeStatusCreated(status),
                            ),
                        ],
                      ),
                    ),
                  ),
                  if (state.created.blocProgress == BlocProgress.IS_LOADING &&
                      state.createdFiltered.isEmpty)
                    TabsLoader()
                  else if (state.created.blocProgress == BlocProgress.FAILED)
                    const SomethingWentWrong()
                  else if (state.createdFiltered.isNotEmpty)
                    ListView.builder(
                      itemCount: state.createdFiltered.length + 1,
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                        if (index < state.createdFiltered.length) {
                          return InquiryCard(model: state.createdFiltered, index: index);
                        } else if (state.created.blocProgress == BlocProgress.IS_LOADING) {
                          return Padding(
                            padding: EdgeInsets.only(top: 40.h),
                            child: PrimaryLoader(),
                          );
                        } else {
                          return SizedBox();
                        }
                      },
                    )
                  else if (state.createdFiltered.isEmpty)
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
