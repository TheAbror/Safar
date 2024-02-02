// import 'package:safar/core/bottomsheet/default_bottom_sheet.dart';
// import 'package:safar/ui_staff/bildirgi_page/widgets/action/bloc/meetig_bloc.dart';
// import 'package:safar/ui_staff/bildirgi_page/widgets/action/bloc/meeting_bloc.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';

// class ManageAddressBottomSheet extends StatelessWidget {
//   final String text;

//   const ManageAddressBottomSheet({
//    super.key,
//     required this.text,
//   }) : super(key: key);

//   static Future<String?> show(
//     BuildContext parentContext, {
//     required String text,
//   }) async {
//     return showModalBottomSheet(
//       context: parentContext,
//       backgroundColor: AppColors.float,
//       shape: const RoundedRectangleBorder(
//         borderRadius: BorderRadius.only(
//           topLeft: Radius.circular(20.0),
//           topRight: Radius.circular(20.0),
//         ),
//       ),
//       isDismissible: false,
//       isScrollControlled: true,
//       builder: (context) {
//         return BlocProvider.value(
//           value: parentContext.read<MeetingBloc>(),
//           child: ManageAddressBottomSheet(
//             text: text,
//           ),
//         );
//       },
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return BlocProvider(
//       create: (context) => MeetingBloc(),
//       child: BlocBuilder<MeetingBloc, MeetingState>(
//         builder: (context, state) {
//           return DefaultBottomSheet(
//             title: 'Add Address',
//             isActionEnabled: state.isEnabled,
//             action: () {
//               Navigator.of(context).pop(state.selectedValue);
//             },
//             child: _Body(text: text),
//           );
//         },
//       ),
//     );
//   }
// }

// class _Body extends StatelessWidget {
//   final String text;

//   const _Body({
//    super.key,
//     required this.text,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return BlocBuilder<ManageAddressBloc, ManageAddressState>(
//       builder: (context, state) {
//         return ListView(
//           physics: const BouncingScrollPhysics(),
//           children: [
//             // INFO: Always needed for Scrollable Bottom sheets
//             SizedBox(height: 24.h),
//           ],
//         );
//       },
//     );
//   }
// }
