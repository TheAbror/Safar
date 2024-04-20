import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:safar/core/bloc_progress/bloc_progress.dart';
import 'package:safar/core/bottomsheet/primary_loader.dart';
import 'package:safar/core/bottomsheet/widgets/bottomsheet_top_radius.dart';
import 'package:safar/core/buttons/action_button.dart';
import 'package:safar/ui/splash_page/bloc/splash_bloc.dart';

class TermsBottomSheet extends StatelessWidget {
  const TermsBottomSheet({super.key});

  static Future<bool?> show(BuildContext parentContext) async {
    return showModalBottomSheet<bool>(
      backgroundColor: Theme.of(parentContext).colorScheme.background,
      context: parentContext,
      useSafeArea: true,
      shape: BottomSheetRadius(),
      isScrollControlled: true,
      builder: (context) {
        return TermsBottomSheet();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return _Body();
  }
}

class _Body extends StatefulWidget {
  @override
  State<_Body> createState() => _BodyState();
}

class _BodyState extends State<_Body> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
      child: Column(
        children: [
          Expanded(
            child: BlocBuilder<SplashBloc, SplashState>(
              builder: (context, state) {
                if (state.blocProgress == BlocProgress.IS_LOADING) {
                  return const PrimaryLoader();
                } else if (state.terms.isEmpty) {
                  return Padding(
                    padding: EdgeInsets.only(top: 24.h),
                    child: const Text(
                      'No Results',
                    ),
                  );
                }

                return SingleChildScrollView(
                  child: Column(
                    children: [
                      Text(state.terms),
                      SizedBox(height: 24.h),
                      ActionButton(
                        text: 'Принять',
                        onPressed: () {
                          Navigator.pop(context, true);
                        },
                      ),
                      SizedBox(height: 24.h),
                    ],
                  ),
                );
              },
            ),
          ),
          // INFO: Always needed for Scrollable Bottom sheets
          SizedBox(height: 24.h),
        ],
      ),
    );
  }
}
