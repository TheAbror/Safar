import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:safar/ui_staff/staff_home_page/bloc/orders_bloc.dart';
import 'package:safar/ui_staff/staff_home_page/inquiries_tab/tabs/inquiries_delivery_tab.dart';
import 'package:safar/ui_staff/staff_home_page/inquiries_tab/tabs/inquiries_taxi_tab.dart';

class InquiriesTab extends StatefulWidget {
  final ScrollController scrollControllerAssigned;
  final ScrollController scrollControllerCreated;

  const InquiriesTab({
    super.key,
    required this.scrollControllerAssigned,
    required this.scrollControllerCreated,
  });

  @override
  State<InquiriesTab> createState() => InquiriesTabState();
}

class InquiriesTabState extends State<InquiriesTab> {
  final searchDelivery = TextEditingController();
  final searchTaxi = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OrdersBloc, OrdersState>(
      builder: (context, state) {
        return TabBarView(
          children: [
            InquiriesDeliveryTab(
              searchDelivery: searchDelivery,
              scrollController: widget.scrollControllerAssigned,
              // statusesList: state.buttons.model.map((e) => e.label).toList(),
              statusesList: const ['Доставлено', 'В пути', 'В ожидании'],
            ),
            InquiriesTaxiTab(
              searchTaxi: searchTaxi,
              scrollController: widget.scrollControllerCreated,
              // statusesList: state.buttons.model.map((e) => e.label).toList(),
              statusesList: const ['Доставлено', 'В пути', 'В ожидании'],
            ),
          ],
        );
      },
    );
  }
}
