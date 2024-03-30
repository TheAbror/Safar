import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:safar/core/bloc_progress/bloc_progress.dart';
import 'package:safar/core/bottomsheet/bloc/bottom_sheet_data_bloc.dart';
import 'package:safar/core/bottomsheet/primary_loader.dart';
import 'package:safar/core/bottomsheet/widgets/bottomsheet_top_radius.dart';
import 'package:safar/core/buttons/action_button.dart';

import 'terms_and_conditions_appbar.dart';

class TermsBottomSheet extends StatelessWidget {
  const TermsBottomSheet({
    super.key,
  });

  static Future<String?> show(BuildContext parentContext) async {
    return showModalBottomSheet<String>(
      backgroundColor: Theme.of(parentContext).colorScheme.background,
      context: parentContext,
      useSafeArea: true,
      shape: BottomSheetRadius(),
      isScrollControlled: true,
      builder: (context) {
        return BlocProvider(
          create: (context) => BottomSheetDataBloc(
            initialValue: '',
            initialList: [],
          ),
          child: TermsBottomSheet(),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BottomSheetDataBloc, BottomSheetDataState>(
      builder: (context, state) {
        return TermsAndConditionsAppBar(
          child: _Body(),
        );
      },
    );
  }
}

class _Body extends StatefulWidget {
  @override
  State<_Body> createState() => _BodyState();
}

class _BodyState extends State<_Body> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BottomSheetDataBloc, BottomSheetDataState>(
      builder: (context, state) {
        return Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Column(
            children: [
              Expanded(
                child: BlocBuilder<BottomSheetDataBloc, BottomSheetDataState>(
                  builder: (context, state) {
                    if (state.blocProgress == BlocProgress.IS_LOADING) {
                      return const PrimaryLoader();
                    } else if (state.searchedList.isEmpty) {
                      return Padding(
                        padding: EdgeInsets.only(top: 24.h),
                        child: const Text(
                          'No Results',
                        ),
                      );
                    } else if (state.searchedList.length == 1 && state.searchedList.first.isEmpty) {
                      return Padding(
                        padding: EdgeInsets.only(top: 24.h),
                        child: const Text(
                          'No Results',
                        ),
                      );
                    }

                    return Expanded(child: Text('dasas'));
                  },
                ),
              ),
              ActionButton(
                text: 'Accept',
                onPressed: () {},
              ),
              SizedBox(height: 24.h),

              // INFO: Always needed for Scrollable Bottom sheets
              SizedBox(height: 24.h),
            ],
          ),
        );
      },
    );
  }
}
