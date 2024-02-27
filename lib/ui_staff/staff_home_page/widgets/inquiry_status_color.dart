// ignore_for_file: use_full_hex_values_for_flutter_colors
import 'package:safar/core/colors/app_colors.dart';
import 'package:safar/ui_staff/signin_page/auth/models/user_info.dart';
import 'package:safar/ui_staff/staff_home_page/model/inquiry_list_model.dart';
import 'package:flutter/material.dart';

class StatusColors {
  final Color textColor;
  final Color backgroundColor;

  StatusColors({
    required this.textColor,
    required this.backgroundColor,
  });
}

class InquiryItemStatusColor {
  static StatusColors displayColorByStatus(
    int index,
    List<OrdersResponse> model,
  ) {
    return _getStatusColors(model[index].destination);
  }
}

class InquiryChengeLogItemStatusColor {
  static StatusColors displayColorByStatus(History item) {
    return _getStatusColors(item.status?.title);
  }
}

StatusColors _getStatusColors(String? statusTitle) {
  Color textColor = AppColors.textMain;
  Color backgroundColor = AppColors.background;

  switch (statusTitle?.toLowerCase()) {
    case 'assigned':
      backgroundColor = AppColors.primaryLight;
      textColor = AppColors.primary;
      break;
    case 'in progress':
      backgroundColor = AppColors.stroke;
      textColor = AppColors.textMain;
      break;
    case 'update required':
      backgroundColor = AppColors.warning.withOpacity(0.2);
      textColor = const Color(0XFFE79A07);
      break;
    case 'updated':
      backgroundColor = const Color(0XFF1FD57E26).withOpacity(0.15);
      textColor = const Color(0XFF179C5C);
      break;
    case 'rejected':
      backgroundColor = Colors.red;
      textColor = AppColors.float;
      break;
    case 'meeting':
      backgroundColor = Colors.yellow;
      textColor = AppColors.textMain;
      break;
    case 'declined':
      backgroundColor = Colors.red.withOpacity(0.7);
      textColor = AppColors.float;
      break;
    case 'approved':
      backgroundColor = Colors.green;
      textColor = AppColors.float;
      break;
    case 'approve':
      backgroundColor = Colors.green;
      textColor = AppColors.float;
      break;
    case 'accepted':
      backgroundColor = AppColors.mindaro;
      textColor = AppColors.float;
      break;
    case 'viewer':
      backgroundColor = AppColors.bittersweet;
      textColor = AppColors.float;
      break;
    default:
      backgroundColor = AppColors.primary;
      textColor = AppColors.float;
  }

  return StatusColors(textColor: textColor, backgroundColor: backgroundColor);
}
