import 'package:safar/core/colors/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:safar/gen/assets.gen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:safar/core/routes/route_constants.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:safar/core/bottomsheet/primary_loader.dart';
import 'package:safar/core/bloc_progress/bloc_progress.dart';
import 'package:safar/core/constants/something_went_wrong.dart';
import 'package:safar/core/dialogs/dialog_success_failure.dart';
import 'package:safar/core/bottomsheet/primary_bottom_sheet.dart';
import 'package:safar/ui_staff/staff_home_page/bloc/inquiry_bloc.dart';
import 'package:safar/ui_staff/bildirgi_page/bildirgi_action_button.dart';
import 'package:safar/ui_staff/manage_inquiry_page/manage_inquiry_page.dart';
import 'package:safar/ui_staff/bildirgi_page/modalPopups/delete_dialog.dart';
import 'package:safar/ui_staff/staff_home_page/model/inquiry_list_model.dart';
import 'package:safar/ui_staff/manage_inquiry_page/bloc/manage_inquiry_bloc.dart';
import 'package:safar/ui_staff/bildirgi_page/widgets/change_log/change_log_item.dart';
import 'package:safar/ui_staff/manage_inquiry_page/widgets/app_bar/inqury_appbar.dart';

class BildirgiPageViewModel {
  final int index;
  final List<InquiryListItemResponse> model;

  const BildirgiPageViewModel({
    Key? key,
    required this.model,
    this.index = 0,
  });
}

class BildirgiPage extends StatelessWidget {
  final BildirgiPageViewModel viewModel;

  const BildirgiPage({
    super.key,
    required this.viewModel,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ManageInquiryBloc()..getInquiryById(viewModel.model[viewModel.index].id),
      child: _Body(model: viewModel.model[viewModel.index], index: viewModel.index),
    );
  }
}

class _Body extends StatefulWidget {
  final int index;
  final InquiryListItemResponse model;

  const _Body({
    required this.model,
    required this.index,
  });

  @override
  State<_Body> createState() => _BodyState();
}

class _BodyState extends State<_Body> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.inverseSurface,
      appBar: staff_inruiry_appbar(
          context,
          widget.model.title,
          widget.model.editable == true
              ? GestureDetector(
                  onTap: () async {
                    final result = await PrimaryBottomSheet.show(
                      context,
                      title: 'Choose Action',
                      isConfirmationNeeded: false,
                      isSearchNeeded: false,
                      heightRatio: 0.30,
                      selectedValue: '',
                      initialList: ['Edit', 'Delete'],
                    );

                    if (result != null) {
                      if (!mounted) return;

                      result.toLowerCase() == 'edit'
                          ? Navigator.of(context).pushNamed(AppRoutes.manageInquiry,
                              arguments:
                                  ManageInquiryPageViewModel(id: widget.model.id, isEdit: true))
                          : delete_dialog(context).then((value) {
                              if (value) {
                                context
                                    .read<ManageInquiryBloc>()
                                    .deleteInquiryById(widget.model.id);
                                // Navigator.pop(context);
                              } else if (value == false) {}
                            });
                    }
                  },
                  child: Assets.icons.staffIcons.edit.svg(
                    height: 24.h,
                    width: 24.h,
                  ),
                )
              : const SizedBox()),
      body: BlocConsumer<ManageInquiryBloc, ManageInquiryState>(
        listener: (context, state) {
          if (state.blocProgress == BlocProgress.IS_SUCCESS) {
            //
            context.read<InquiryBloc>().getInitiallyCreated();

            Navigator.pushNamed(context, AppRoutes.staffHome);

            showMessage('Inquiry was successfully deleted');
          }
        },
        builder: (context, state) {
          if (state.blocProgress == BlocProgress.IS_LOADING) {
            return const PrimaryLoader();
          }

          if (state.blocProgress == BlocProgress.FAILED) {
            return const SomethingWentWrong();
          }

          return Stack(
            children: [
              RefreshIndicator(
                onRefresh: () async {
                  context.read<ManageInquiryBloc>().getInquiryById(state.item.id);
                },
                child: ListView(
                  physics: const AlwaysScrollableScrollPhysics(),
                  children: [
                    Container(
                      padding: EdgeInsets.all(10.w),
                      margin: EdgeInsets.only(right: 8.w, left: 8.w, bottom: 2.h, top: 8.h),
                      decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.outline,
                        borderRadius: BorderRadius.circular(16.r),
                      ),
                      child: ListView(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        children: [
                          SizedBox(height: 8.h),
                          Text(
                            state.item.title,
                            style: TextStyle(
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          SizedBox(height: 4.h),
                          Text(
                            state.item.description
                                .replaceAll('<p>', '')
                                .replaceAll('</p>', '')
                                .replaceAll('<br>', '')
                                .replaceAll('</br>', '')
                                .replaceAll('<strong>', '')
                                .replaceAll('</strong>', '')
                                .replaceAll('<em>', '')
                                .replaceAll('</em>', '')
                                .replaceAll('<u>', '')
                                .replaceAll('</u>', '')
                                .replaceAll('<p style="text-align: justify">', '')
                                .replaceAll('</p style="text-align: justify">', ''),
                            style: TextStyle(
                              height: 1.4.h,
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          SizedBox(height: 18.h),
                          ListView.builder(
                            padding: EdgeInsets.zero,
                            itemCount: state.item.items.length,
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemBuilder: (context, index) {
                              final item = state.item.items[index];

                              return Container(
                                margin: EdgeInsets.only(bottom: 10.h),
                                padding: EdgeInsets.all(12.w),
                                decoration: BoxDecoration(
                                  color: Theme.of(context).colorScheme.background,
                                  border: Border.all(
                                    color: Theme.of(context).colorScheme.inversePrimary,
                                    width: 0.5.w,
                                  ),
                                  borderRadius: BorderRadius.circular(8.r),
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Name ',
                                      style: TextStyle(
                                        fontSize: 11.sp,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                    Text(
                                      item.name,
                                      style: TextStyle(
                                        fontSize: 14.sp,
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                    SizedBox(height: 8.h),
                                    Row(
                                      children: [
                                        SizedBox(
                                          width: 94.w,
                                          child: Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                'Amount',
                                                style: TextStyle(
                                                  fontSize: 11.sp,
                                                  fontWeight: FontWeight.w500,
                                                ),
                                              ),
                                              SizedBox(height: 4.h),
                                              Text(
                                                (item.quantity).toString(),
                                                style: TextStyle(
                                                  fontSize: 12.sp,
                                                  fontWeight: FontWeight.w500,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        SizedBox(width: 8.w),
                                        SizedBox(
                                          width: 94.w,
                                          child: Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                'Unit',
                                                style: TextStyle(
                                                  fontSize: 11.sp,
                                                  fontWeight: FontWeight.w500,
                                                ),
                                              ),
                                              Text(
                                                item.measurement?.label ?? '',
                                                style: TextStyle(
                                                  fontSize: 12.sp,
                                                  fontWeight: FontWeight.w500,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        SizedBox(width: 8.w),
                                      ],
                                    ),
                                  ],
                                ),
                              );
                            },
                          ),
                          SizedBox(height: 10.h),
                        ],
                      ),
                    ),
                    //
                    Container(
                      margin: EdgeInsets.only(right: 8.w, left: 8.w, bottom: 24.h),
                      padding: EdgeInsets.all(10.w),
                      decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.outline,
                        borderRadius: BorderRadius.circular(16.r),
                      ),
                      child: ListView(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        children: [
                          Text(
                            'Change log',
                            style: TextStyle(
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          SizedBox(height: 16.h),
                          ListView.builder(
                            itemCount: state.item.history.length,
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemBuilder: (context, index) {
                              final currentItem = state.item.history[index];
                              return ChangeLogItem(item: currentItem);
                            },
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 40.h)
                  ],
                ),
              ),
              if (state.item.buttons.isNotEmpty)
                BildirgiActionButton(
                  id: state.item.id,
                  buttons: state.item.buttons,
                ),
            ],
          );
        },
      ),
    );
  }
}
