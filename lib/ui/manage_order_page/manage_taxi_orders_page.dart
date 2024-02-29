import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:safar/core/bloc_progress/bloc_progress.dart';
import 'package:safar/core/dialogs/dialog_success_failure.dart';
import 'package:safar/core/routes/route_constants.dart';
import 'package:safar/ui/manage_order_page/bloc/manage_order_bloc.dart';
import 'package:safar/ui/manage_order_page/widgets/amount_selection.dart';
import 'package:safar/ui/manage_order_page/widgets/app_bar/inqury_appbar.dart';
import 'package:safar/ui/manage_order_page/widgets/card_number_and_remove.dart';
import 'package:safar/ui/manage_order_page/widgets/texts_and_titles/item_inquiry_title.dart';
import 'package:safar/ui/manage_order_page/widgets/texts_and_titles/submit_inquiry_button.dart';
import 'package:safar/ui/manage_order_page/widgets/texts_and_titles/title_and_description.dart';
import 'package:safar/ui/manage_order_page/widgets/unit_selection.dart';
import 'package:safar/ui/home_page/widgets/buttons/add_item_button.dart';

class ManageTaxiOrdersPageViewModel {
  final int id;
  final bool isEdit;

  ManageTaxiOrdersPageViewModel({
    required this.id,
    required this.isEdit,
  });
}

class ManageTaxiOrdersPage extends StatefulWidget {
  final ManageTaxiOrdersPageViewModel viewModel;

  const ManageTaxiOrdersPage({super.key, required this.viewModel});

  @override
  State<ManageTaxiOrdersPage> createState() => _ManageTaxiOrdersPageState();
}

class _ManageTaxiOrdersPageState extends State<ManageTaxiOrdersPage> {
  final bloc = ManageOrderBloc();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => bloc,
      child: BlocBuilder<ManageOrderBloc, ManageOrderState>(
        builder: (context, state) {
          return GestureDetector(
            onTap: () => FocusScope.of(context).unfocus(),
            child: Scaffold(
              resizeToAvoidBottomInset: true,
              backgroundColor: Theme.of(context).colorScheme.inverseSurface,
              appBar: staff_inruiry_appbar(
                context,
                widget.viewModel.isEdit ? 'Изменить детали заказа' : 'Заказать такси',
                SubmitInquiryButton(
                  isEnabled: widget.viewModel.isEdit ? true : state.isButtonEnabled,
                  onTap: () {
                    if (widget.viewModel.isEdit) {
                      //   bloc.editInquiryByID(
                      //     widget.viewModel.id,
                      //     state.title.trim(),
                      //     state.description.trim(),
                      //     state.recipientID,
                      //   );
                      // } else {
                      //   bloc.postNewInquiry(
                      //     state.title.trim(),
                      //     state.description.trim(),
                      //     state.recipientID,
                      //   );
                    }
                  },
                ),
              ),
              body: _Body(viewModel: widget.viewModel),
            ),
          );
        },
      ),
    );
  }
}

class _Body extends StatefulWidget {
  final ManageTaxiOrdersPageViewModel viewModel;

  const _Body({required this.viewModel});

  @override
  State<_Body> createState() => _BodyState();
}

class _BodyState extends State<_Body> {
  var fromController = TextEditingController();
  var toController = TextEditingController();
  var descriptionController = TextEditingController();
  var recipientController = TextEditingController();

  @override
  void initState() {
    super.initState();

    if (widget.viewModel.isEdit) {
      // context.read<ManageOrderBloc>().getInquiryByIdForEdit(widget.viewModel.id);
      context.read<ManageOrderBloc>().isButtonEnabled();
    }

    // context.read<ManageOrderBloc>().getMeausures();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ManageOrderBloc, ManageOrderState>(
      listener: (context, state) {
        if (state.isInitialValuesLoaded) {
          fromController.text = state.data.title;
          descriptionController.text = state.data.description;

          context.read<ManageOrderBloc>().initialValuesDisplayed();
        } else if (state.blocProgress == BlocProgress.IS_SUCCESS) {
          //
          // context.read<InquiryBloc>().getInitiallyCreated();

          Navigator.pushNamed(context, AppRoutes.homePage);

          showMessage('Success');
        }
      },
      builder: (context, state) {
        // if (state.blocProgress == BlocProgress.IS_LOADING) {
        //   return Center(
        //     child: CircularProgressIndicator(
        //       color: Theme.of(context).colorScheme.primaryContainer,
        //     ),
        //   );
        // }
        // if (state.blocProgress == BlocProgress.FAILED) {
        //   return const SomethingWentWrong();
        // }

        return SingleChildScrollView(
          child: Column(
            children: [
              TitleAndDescription(
                fromController: fromController,
                toController: toController,
                descriptionController: descriptionController,
              ),
              ListView.builder(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: state.listofItems.length,
                itemBuilder: (context, index) {
                  final item = state.listofItems[index];

                  return Container(
                    key: Key(state.listofItems.length.toString()),
                    margin: EdgeInsets.only(right: 8.w, left: 8.w, bottom: 2.h),
                    padding: EdgeInsets.all(10.w),
                    decoration: _Decoration(context),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CardNumberAndRemove(index: index),
                        ItemInquiryTitle(index: index, item: item),
                        AmountSelection(item: item, index: index),
                        UnitSelection(index: index, item: item),
                      ],
                    ),
                  );
                },
              ),
              SizedBox(height: 20.h),
              AddItemButton(
                text: ' Add Item',
                width: 135.w,
                ontap: () => context.read<ManageOrderBloc>().addInquiryItem(),
              ),
              SizedBox(height: 60.h),
            ],
          ),
        );
      },
    );
  }

  BoxDecoration _Decoration(BuildContext context) {
    return BoxDecoration(
      color: Theme.of(context).colorScheme.onBackground,
      borderRadius: BorderRadius.circular(16.r),
    );
  }
}
