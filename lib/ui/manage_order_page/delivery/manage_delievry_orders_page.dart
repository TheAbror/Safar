import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:safar/core/bloc_progress/bloc_progress.dart';
import 'package:safar/core/constants/something_went_wrong.dart';
import 'package:safar/core/dialogs/dialog_success_failure.dart';
import 'package:safar/core/routes/route_constants.dart';
import 'package:safar/ui/root_page/bloc/orders_bloc.dart';
import 'package:safar/ui/root_page/widgets/buttons/add_item_button.dart';
import 'package:safar/ui/manage_order_page/widgets/inqury_appbar.dart';
import '../text_form_fields/submit_inquiry_button.dart';
import '../widgets/amount_selection.dart';
import '../widgets/card_number_and_remove.dart';
import '../widgets/item_inquiry_title.dart';
import 'manage_delivery_order_fields.dart';

class ManagDeliveryOrdersPageViewModel {
  final int id;
  final bool isEdit;

  ManagDeliveryOrdersPageViewModel({
    required this.id,
    required this.isEdit,
  });
}

class ManagDeliveryOrdersPage extends StatefulWidget {
  final ManagDeliveryOrdersPageViewModel viewModel;

  const ManagDeliveryOrdersPage({super.key, required this.viewModel});

  @override
  State<ManagDeliveryOrdersPage> createState() => _ManagDeliveryOrdersPageState();
}

class _ManagDeliveryOrdersPageState extends State<ManagDeliveryOrdersPage> {
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
                widget.viewModel.isEdit ? 'Изменить детали доставки' : 'Заказать доставку',
                SubmitOrderButton(
                  isEnabled: widget.viewModel.isEdit
                      ? true
                      : state.isDeliveryButtonEnabled
                          ? true
                          : false,
                  onTap: () {
                    widget.viewModel.isEdit
                        ? bloc.editDeliveryOrdersByID(widget.viewModel.id)
                        : bloc.postDeliveryOrders();
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
  final ManagDeliveryOrdersPageViewModel viewModel;

  const _Body({required this.viewModel});

  @override
  State<_Body> createState() => _BodyState();
}

class _BodyState extends State<_Body> {
  var fromController = TextEditingController();
  var toController = TextEditingController();
  var offeredPriceController = TextEditingController();
  var exactLocationController = TextEditingController();
  var exactDestinationController = TextEditingController();
  var phoneController = TextEditingController();
  var commentsController = TextEditingController();
  var dateController = TextEditingController();

  @override
  void initState() {
    super.initState();

    if (widget.viewModel.isEdit) {
      context.read<OrdersBloc>().getDeliveryOrderByIdForEdit(widget.viewModel.id);
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<OrdersBloc, OrdersState>(
      listener: (context, state) {
        if (state.isInitialValuesLoaded && widget.viewModel.isEdit) {
          String dateString = state.deliveryDate;
          DateTime dateTime = DateTime.parse(dateString);

          fromController.text = state.deliveryPickup;
          toController.text = state.deliveryDestination;
          exactLocationController.text = state.deliveryPickUpReference;
          exactDestinationController.text = state.deliveryDestinationReference;
          offeredPriceController.text = state.deliveryOfferedPrice;
          dateController.text = DateFormat('yyyy-MM-dd, HH:mm:ss').format(dateTime);
          commentsController.text = state.deliveryCommentsForDriver;

          context.read<OrdersBloc>().initialValuesDisplayed();
        } else if (state.blocProgress == BlocProgress.IS_SUCCESS &&
            state.isDeliveryPostSuccessfull) {
          Navigator.pushNamed(context, AppRoutes.rootPage);

          showMessage('Успех');

          context.read<OrdersBloc>().makeBlocProgressFalse();
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
              ManageDeliveryOrderFields(
                fromController: fromController,
                toController: toController,
                exactLocationController: exactLocationController,
                exactDestinationController: exactDestinationController,
                phoneNumberController: phoneController,
                offeredPriceController: offeredPriceController,
                dateController: dateController,
                commentsController: commentsController,
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
                      ],
                    ),
                  );
                },
              ),
              SizedBox(
                height: 10.h,
                width: double.infinity,
              ),
              AddItemButton(
                text: ' Добавить',
                width: 135.w,
                ontap: () => context.read<OrdersBloc>().addDeliveryItem(),
              ),
              SizedBox(height: 20.h),
              PhotoUploader(context),
              SizedBox(height: 60.h),
            ],
          ),
        );
      },
    );
  }

  Container PhotoUploader(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 8.h, right: 8.w, left: 8.w, bottom: 2.h),
      padding: EdgeInsets.all(10.w),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.onBackground,
        borderRadius: BorderRadius.circular(16.r),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text('Загрузите фото'),
          GestureDetector(
            onTap: () async {
              FilePickerResult? result = await FilePicker.platform.pickFiles();
              if (result != null) {
                File file = File(result.files.single.path!);
                _asyncFileUpload('Your text', file);
              } else {
                // User canceled file picking.
              }
            },
            child: Container(
              margin: EdgeInsets.only(top: 8.h, right: 8.w, left: 8.w, bottom: 2.h),
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.background,
                borderRadius: BorderRadius.circular(16.r),
              ),
              child: Column(
                children: [
                  SizedBox(height: 20.h),
                  Text(
                    '+',
                    style: TextStyle(fontSize: 24.sp),
                  ),
                  Text(
                    'Выберите фото',
                    style: TextStyle(fontSize: 16.sp),
                  ),
                  SizedBox(height: 20.h),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Future<void> _asyncFileUpload(String text, File file) async {
    var request = http.MultipartRequest("POST", Uri.parse("<url>"));
    request.fields["text_field"] = text;
    var pic = await http.MultipartFile.fromPath("file_field", file.path);
    request.files.add(pic);

    try {
      var response = await request.send();
      if (response.statusCode == 200) {
        var responseData = await response.stream.toBytes();
        var responseString = String.fromCharCodes(responseData);
        print(responseString);
      } else {
        print('Failed to upload file: ${response.reasonPhrase}');
      }
    } catch (e) {
      print('Error uploading file: $e');
    }
  }

  BoxDecoration _Decoration(BuildContext context) {
    return BoxDecoration(
      color: Theme.of(context).colorScheme.onBackground,
      borderRadius: BorderRadius.circular(16.r),
    );
  }
}
