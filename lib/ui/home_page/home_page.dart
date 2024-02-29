import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:safar/core/box/current_user_box.dart';
import 'package:safar/core/db/shared_keys.dart';
import 'package:safar/core/routes/route_constants.dart';
import 'package:safar/ui/home_page/bloc/orders_bloc.dart';
import 'package:safar/ui/home_page/main_tab/main_tab.dart';
import 'package:safar/ui/home_page/widgets/app_bar/staff_inquiries_appbar.dart';
import 'package:safar/ui/home_page/widgets/buttons/create_button.dart';
import 'package:safar/ui/manage_order_page/manage_delievry_orders_page.dart';
import 'package:safar/ui/manage_order_page/manage_taxi_orders_page.dart';
import 'model/current_user.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    context.read<OrdersBloc>().getTaxiOrders();

    super.initState();
  }

  final ScrollController _scrollControllerAssigned = ScrollController();
  final ScrollController _scrollControllerCreated = ScrollController();

  CurrentUser? currentUser = boxCurrentUser.get(ShPrefKeys.currentUser);
  String errorOccured = 'Произошла ошибка';

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Builder(builder: (context) {
        return Scaffold(
          appBar: inquiries_appbar(
            context,
            currentUser?.fullName ?? '',
            currentUser?.shortName ?? '',
            'Водитель',
          ),
          backgroundColor: Theme.of(context).colorScheme.background,
          resizeToAvoidBottomInset: false,
          body: MainTab(
            scrollControllerAssigned: _scrollControllerAssigned,
            scrollControllerCreated: _scrollControllerCreated,
          ),
          floatingActionButton: CreateButton(
            onPressed: () {
              DefaultTabController.of(context).index == 0
                  ? Navigator.of(context).pushNamed(
                      AppRoutes.manageDeliveryOrder,
                      arguments: ManagDeliveryOrdersPageViewModel(id: 0, isEdit: false),
                    )
                  : Navigator.of(context).pushNamed(
                      AppRoutes.manageTaxiOrder,
                      arguments: ManageTaxiOrdersPageViewModel(id: 0, isEdit: false),
                    );
            },
          ),
        );
      }),
    );
  }
}
