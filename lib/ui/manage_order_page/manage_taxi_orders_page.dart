import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:safar/core/bloc_progress/bloc_progress.dart';
import 'package:safar/ui/manage_order_page/widgets/app_bar/inqury_appbar.dart';
import 'package:safar/ui/manage_order_page/widgets/texts_and_titles/manage_taxi_order_fields.dart';
import 'package:safar/ui/manage_order_page/widgets/texts_and_titles/submit_inquiry_button.dart';
import '../../core/constants/something_went_wrong.dart';
import '../../core/dialogs/dialog_success_failure.dart';
import '../../core/routes/route_constants.dart';
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
                    bloc.postTaxiOrders(widget.viewModel.isEdit, widget.viewModel.id);
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
  var exactLocationController = TextEditingController();
  var exactDestinationController = TextEditingController();
  var offeredPriceController = TextEditingController();
  var dateController = TextEditingController();
  var phoneNumberController = TextEditingController();
  var commentsController = TextEditingController();

  @override
  void initState() {
    super.initState();

    if (widget.viewModel.isEdit) {
      context.read<OrdersBloc>().getInquiryByIdForEdit(widget.viewModel.id);
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<OrdersBloc, OrdersState>(
      listener: (context, state) {
        if (state.isInitialValuesLoaded && widget.viewModel.isEdit) {
          String dateString = state.date;
          DateTime dateTime = DateTime.parse(dateString);

          fromController.text = state.pickup;
          toController.text = state.destination;
          exactLocationController.text = state.pickUpReference;
          exactDestinationController.text = state.destinationReference;
          offeredPriceController.text = state.offeredPrice;
          dateController.text = DateFormat('yyyy-MM-dd, HH:mm:ss').format(dateTime);
          phoneNumberController.text = '';
          commentsController.text = state.commentsForDriver;

          context.read<OrdersBloc>().initialValuesDisplayed();
        } else if (state.blocProgress == BlocProgress.IS_SUCCESS) {
          //

          Navigator.pushNamed(context, AppRoutes.homePage);

          showMessage('Успех');
        }
      },
      builder: (context, state) {
        if (state.blocProgress == BlocProgress.IS_LOADING) {
          return Center(
            child: CircularProgressIndicator(
              color: Theme.of(context).colorScheme.primaryContainer,
            ),
          );
        }
        if (state.blocProgress == BlocProgress.FAILED) {
          return const SomethingWentWrong();
        }

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
                phoneNumberController: phoneNumberController,
              ),
            ],
          ),
        );
      },
    );
  }
}
