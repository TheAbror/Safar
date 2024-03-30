import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:safar/ui/home_page/widgets/buttons/add_item_button.dart';
import 'package:safar/ui/manage_order_page/widgets/app_bar/inqury_appbar.dart';

import 'texts_and_titles/submit_inquiry_button.dart';

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
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        backgroundColor: Theme.of(context).colorScheme.inverseSurface,
        appBar: order_appbar(
          context,
          widget.viewModel.isEdit ? 'Изменить детали доставки' : 'Заказать доставку',
          SubmitOrderButton(
            isEnabled: widget.viewModel.isEdit ? true : false,
            onTap: () {
              if (widget.viewModel.isEdit) {}
            },
          ),
        ),
        body: _Body(viewModel: widget.viewModel),
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
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(
            height: 40.h,
            width: double.infinity,
          ),
          AddItemButton(
            text: ' Add Item',
            width: 135.w,
            ontap: () {},
          ),
          SizedBox(height: 60.h),
        ],
      ),
    );
  }
}
