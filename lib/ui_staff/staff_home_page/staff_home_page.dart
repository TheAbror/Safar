import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:safar/ui_staff/staff_home_page/bloc/inquiry_bloc.dart';
import 'package:safar/ui_staff/staff_home_page/inquiries_tab/inquiries_tab.dart';
import 'package:safar/ui_staff/staff_home_page/widgets/app_bar/staff_inquiries_appbar.dart';
import 'package:safar/ui_staff/staff_home_page/widgets/buttons/create_button.dart';

class StaffHomePage extends StatefulWidget {
  const StaffHomePage({super.key});

  @override
  State<StaffHomePage> createState() => _StaffHomePageState();
}

class _StaffHomePageState extends State<StaffHomePage> {
  @override
  void initState() {
    // context.read<InquiryBloc>()
    //   ..getButons()
    //   ..getInitiallyCreated()
    //   ..getInitiallyAssigned();

    _scrollControllerAssigned.addListener(() {
      if (_scrollControllerAssigned.position.maxScrollExtent -
              _scrollControllerAssigned.position.pixels <=
          300) {
        context.read<InquiryBloc>().getAssignedWithPageable();
      }
    });
    _scrollControllerCreated.addListener(() {
      if (_scrollControllerCreated.position.maxScrollExtent -
              _scrollControllerCreated.position.pixels <=
          300) {
        context.read<InquiryBloc>().getCreatedWithPageable();
      }
    });

    super.initState();
  }

  final ScrollController _scrollControllerAssigned = ScrollController();
  final ScrollController _scrollControllerCreated = ScrollController();

  // CurrentUser? currentUser = boxCurrentUser.get(ShPrefKeys.currentUser);
  String errorOccured = 'Произошла ошибка';

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: inquiries_appbar(context, 'Аброр Шамурадов', 'АБ', 'Водитель'),
        backgroundColor: Theme.of(context).colorScheme.background,
        resizeToAvoidBottomInset: false,
        floatingActionButton: const CreateButton(),
        body: InquiriesTab(
          scrollControllerAssigned: _scrollControllerAssigned,
          scrollControllerCreated: _scrollControllerCreated,
        ),
      ),
    );
  }
}
