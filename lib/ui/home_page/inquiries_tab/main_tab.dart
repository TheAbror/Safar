import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:safar/ui/home_page/bloc/orders_bloc.dart';
import 'package:safar/ui/home_page/inquiries_tab/tabs/delivery_tab.dart';
import 'package:safar/ui/home_page/inquiries_tab/tabs/taxi_tab.dart';

class MainTab extends StatefulWidget {
  final ScrollController scrollControllerAssigned;
  final ScrollController scrollControllerCreated;

  const MainTab({
    super.key,
    required this.scrollControllerAssigned,
    required this.scrollControllerCreated,
  });

  @override
  State<MainTab> createState() => MainTabState();
}

class MainTabState extends State<MainTab> {
  final searchDelivery = TextEditingController();
  final searchTaxi = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OrdersBloc, OrdersState>(
      builder: (context, state) {
        return TabBarView(
          children: [
            DeliveryTab(
              searchDelivery: searchDelivery,
              scrollController: widget.scrollControllerAssigned,
              // statusesList: state.buttons.model.map((e) => e.label).toList(),
              statusesList: const ['Доставлено', 'В пути', 'В ожидании'],
            ),
            TaxiTab(
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
