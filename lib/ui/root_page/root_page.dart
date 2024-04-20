import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:safar/core/api/api_provider.dart';
import 'package:safar/core/box/current_user_box.dart';
import 'package:safar/core/db/preferences_services.dart';
import 'package:safar/core/db/shared_keys.dart';
import 'package:safar/core/routes/route_constants.dart';
import 'package:safar/ui/root_page/bloc/orders_bloc.dart';
import 'package:safar/ui/root_page/main_tab/main_tab.dart';
import 'package:safar/ui/root_page/widgets/app_bar/homepage_appbar.dart';
import 'package:safar/ui/root_page/widgets/buttons/create_button.dart';
import 'package:safar/ui/signin_page/bloc/auth_bloc.dart';
import '../manage_order_page/delivery/manage_delievry_orders_page.dart';
import '../manage_order_page/taxi/manage_taxi_orders_page.dart';
import 'model/current_user.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late StreamSubscription<bool> notAuthorizedStreamSubscription;

  @override
  void initState() {
    super.initState();

    notAuthorizedStreamSubscription = ApiProvider.notAuthorizedInterceptor.controller.stream.listen(
      (bool isNotAuthorized) {
        if (isNotAuthorized) {
          signOut(context);
        }
      },
    );

    context.read<OrdersBloc>().getTaxiOrders();
    context.read<OrdersBloc>().getDeliveryOrders();
  }

  void signOut(_) {
    PreferencesServices.clearAll().then(
      (value) {
        if (value == true) {
          ApiProvider.create();
          boxCurrentUser.clear();
          context.read<AuthBloc>().clearAll();
          Navigator.pushNamed(context, AppRoutes.splashPage);
        }
      },
    );
  }

  final ScrollController _scrollControllerAssigned = ScrollController();
  final ScrollController _scrollControllerCreated = ScrollController();

  CurrentUser? currentUser = boxCurrentUser.get(ShPrefKeys.currentUser);
  String errorOccured = ShPrefKeys.errorOccured;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Builder(builder: (context) {
        return Scaffold(
          appBar: homePage_appbar(
            context,
            currentUser?.fullName ?? 'Error happened',
            currentUser?.number ?? '',
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
                      arguments: ManagDeliveryOrdersPageViewModel(
                        id: 0,
                        isEdit: false,
                      ),
                    )
                  : Navigator.of(context).pushNamed(
                      AppRoutes.manageTaxiOrder,
                      arguments: ManageTaxiOrdersPageViewModel(
                        id: 0,
                        isEdit: false,
                      ),
                    );
            },
          ),
        );
      }),
    );
  }
}
