import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:safar/core/bloc_progress/bloc_progress.dart';
import 'package:safar/core/dialogs/dialog_success_failure.dart';
import 'package:safar/core/routes/route_constants.dart';
import 'package:safar/ui/manage_order_page/widgets/app_bar/inqury_appbar.dart';
import 'package:safar/ui/manage_order_page/widgets/texts_and_titles/manage_taxi_order_fields.dart';
import 'package:safar/ui/manage_order_page/widgets/texts_and_titles/submit_inquiry_button.dart';

import '../home_page/bloc/orders_bloc.dart';

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
  final bloc = OrdersBloc();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => bloc,
      child: BlocBuilder<OrdersBloc, OrdersState>(
        builder: (context, state) {
          return GestureDetector(
            onTap: () => FocusScope.of(context).unfocus(),
            child: Scaffold(
              resizeToAvoidBottomInset: true,
              backgroundColor: Theme.of(context).colorScheme.inverseSurface,
              appBar: order_appbar(
                context,
                widget.viewModel.isEdit ? 'Изменить детали заказа' : 'Заказать такси',
                SubmitOrderButton(
                  isEnabled: widget.viewModel.isEdit ? true : state.isButtonEnabled,
                  onTap: () async {
                    bloc.postTaxiOrders();
                    print('ontap here');
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
  var commentsController = TextEditingController();
  var exactLocationController = TextEditingController();
  var exactDestinationController = TextEditingController();
  var offeredPriceController = TextEditingController();
  var dateController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<OrdersBloc, OrdersState>(
      listener: (context, state) {
        // if (state.isInitialValuesLoaded) {
        //   fromController.text = state.data.title;
        //   commentsController.text = state.data.description;

        //   context.read<OrdersBloc>().initialValuesDisplayed();
        // } else
        if (state.blocProgress == BlocProgress.IS_SUCCESS) {
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

        // --- Orders detail ---
        // endpoint: /api/orders_detail/<int:pk>/

        return SingleChildScrollView(
          child: Column(
            children: [
              ManageTaxiOrderFields(
                fromController: fromController,
                toController: toController,
                commentsController: commentsController,
                exactLocationController: exactLocationController,
                exactDestinationController: exactDestinationController,
                offeredPriceController: offeredPriceController,
                dateController: dateController,
              ),
            ],
          ),
        );
      },
    );
  }
}
