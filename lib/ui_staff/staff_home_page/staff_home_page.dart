import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:safar/core/box/current_user_box.dart';
import 'package:safar/core/db/shared_keys.dart';
import 'package:safar/ui_staff/staff_home_page/bloc/orders_bloc.dart';
import 'package:safar/ui_staff/staff_home_page/inquiries_tab/inquiries_tab.dart';
import 'package:safar/ui_staff/staff_home_page/widgets/app_bar/staff_inquiries_appbar.dart';
import 'package:safar/ui_staff/staff_home_page/widgets/buttons/create_button.dart';

import 'model/current_user.dart';

class StaffHomePage extends StatefulWidget {
  const StaffHomePage({super.key});

  @override
  State<StaffHomePage> createState() => _StaffHomePageState();
}

class _StaffHomePageState extends State<StaffHomePage> {
  @override
  void initState() {
    context.read<OrdersBloc>().getInitiallyAssigned();

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
      child: Scaffold(
        appBar: inquiries_appbar(
          context,
          currentUser?.fullName ?? '',
          currentUser?.shortName ?? '',
          'Водитель',
        ),
        backgroundColor: Theme.of(context).colorScheme.background,
        resizeToAvoidBottomInset: false,
        floatingActionButton: const CreateButton(),
        body: MainTab(
          scrollControllerAssigned: _scrollControllerAssigned,
          scrollControllerCreated: _scrollControllerCreated,
        ),
      ),
    );
  }
}
