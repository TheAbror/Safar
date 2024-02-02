import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:safar/core/colors/app_colors.dart';
import 'package:safar/core/widgets/search_input.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:safar/core/bottomsheet/primary_loader.dart';
import 'package:safar/core/bloc_progress/bloc_progress.dart';
import 'package:safar/core/bottomsheet/default_bottom_sheet.dart';
import 'package:safar/core/bottomsheet/bloc/bottom_sheet_data_bloc.dart';
import 'package:safar/core/bottomsheet/widgets/bottomsheet_top_radius.dart';
import 'package:safar/core/bottomsheet/bottom_sheet_list_single_choice_item.dart';

//          Finishing my work :)
//          Happy New Year !!!

class PrimaryBottomSheet extends StatelessWidget {
  final String title;
  final bool isSearchNeeded;
  final bool? isConfirmationNeeded;
  final double heightRatio;

  const PrimaryBottomSheet({
    super.key,
    required this.title,
    required this.isSearchNeeded,
    required this.heightRatio,
    required this.isConfirmationNeeded,
  });

  static Future<String?> show(
    BuildContext parentContext, {
    required String title,
    required bool isConfirmationNeeded,
    required bool isSearchNeeded,
    required double heightRatio,
    required String selectedValue,
    required List<String> initialList,
  }) async {
    return showModalBottomSheet<String>(
      backgroundColor: Theme.of(parentContext).colorScheme.background,
      context: parentContext,
      useSafeArea: true,
      shape: BottomSheetRadius(),
      isScrollControlled: true,
      builder: (context) {
        return BlocProvider(
          create: (context) => BottomSheetDataBloc(
            initialValue: selectedValue,
            initialList: initialList,
          ),
          child: PrimaryBottomSheet(
            title: title,
            isSearchNeeded: isSearchNeeded,
            isConfirmationNeeded: isConfirmationNeeded,
            heightRatio: heightRatio,
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BottomSheetDataBloc, BottomSheetDataState>(
      builder: (context, state) {
        return DefaultBottomSheet(
          title: title,
          heightRatio: heightRatio,
          isActionEnabled: state.isButtonEnabled,
          actionText: 'Select',
          action: () {
            if (state.isButtonEnabled) {
              Navigator.pop(context, state.selectedValue);
            }
          },
          child: BlocBuilder<BottomSheetDataBloc, BottomSheetDataState>(
            builder: (context, state) {
              if (state.blocProgress == BlocProgress.IS_LOADING) {
                return const PrimaryBottomSheetLoader();
              }

              return _Body(isSearchNeeded: isSearchNeeded);
            },
          ),
        );
      },
    );
  }
}

class _Body extends StatefulWidget {
  final bool isSearchNeeded;

  const _Body({
    required this.isSearchNeeded,
  });

  @override
  State<_Body> createState() => _BodyState();
}

class _BodyState extends State<_Body> {
  final searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BottomSheetDataBloc, BottomSheetDataState>(
      builder: (context, state) {
        return Column(
          children: [
            Divider(
              color: Theme.of(context).colorScheme.onSurfaceVariant,
              height: 1.h,
              thickness: 1.h,
            ),

            if (widget.isSearchNeeded == true)
              Container(
                margin: EdgeInsets.symmetric(horizontal: 10.w, vertical: 12.h),
                child: SearchInput(
                  fillColor: Theme.of(context).colorScheme.surfaceTint,
                  width: double.infinity,
                  hintText: 'Search',
                  prefixIcon: const Icon(Icons.search, color: AppColors.primary),
                  controller: searchController,
                  onChanged: (val) {
                    context.read<BottomSheetDataBloc>().search(val);
                  },
                ),
              ),

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

                  return ListView.builder(
                    physics: const BouncingScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: state.searchedList.length,
                    itemBuilder: (BuildContext context, int index) {
                      return BottomSheetListSingleChoiceItem<String>(
                        itemTitle: state.searchedList[index].toString(),
                        value: state.searchedList[index].toString(),
                        groupValue: state.selectedValue.toString(),
                        onChanged: (value) {
                          context.read<BottomSheetDataBloc>().choose(value);
                          Navigator.pop(context, value);
                        },
                      );
                    },
                  );
                },
              ),
            ),
            // INFO: Always needed for Scrollable Bottom sheets
            SizedBox(height: 24.h),
          ],
        );
      },
    );
  }
}
