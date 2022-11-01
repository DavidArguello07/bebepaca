

import 'package:bebepaca/layout/bloc/layout_bloc.dart';
import 'package:bebepaca/resources/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quickalert/quickalert.dart';

InputDecoration customInputDecoration(String hintText) {
  return InputDecoration(
      hintText: hintText,
      enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.blue), borderRadius: BorderRadius.circular(7)),
      hintStyle: TextStyle(color: AppColors.blue, height: 1, fontWeight: FontWeight.w400),
      border: OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.blue), borderRadius: BorderRadius.circular(7)),
      focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.blue, width: 1.5),
          borderRadius: BorderRadius.circular(7)),
      focusedErrorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.blue), borderRadius: BorderRadius.circular(7)),
      fillColor: Colors.white.withOpacity(0.4),
      labelText: hintText);
}

void showQuickAlert(BuildContext context, QuickAlertType type, String title, String message) {
  LayoutBloc layotBloc = context.read<LayoutBloc>();

  if (!layotBloc.state.dialogOpen) {
    layotBloc.setDialogOpen(true);
    QuickAlert.show(
      context: context,
      type: type,
      title: title,
      text: message,
      animType: QuickAlertAnimType.slideInDown,
      confirmBtnColor: AppColors.blue,
    ).then((value) => layotBloc.setDialogOpen(false));
  }
}