// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:bebepaca/resources/theme/app_colors.dart';
import 'package:bebepaca/shared/widgets/bouncing_widgets.dart';
import 'package:flutter/material.dart';

class AppBarBackButton extends StatelessWidget {
  final bool isModal;
  final VoidCallback? onTap;
  const AppBarBackButton({Key? key, required this.isModal, this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: (onTap == null)
          ? () {
              Navigator.of(context).pop();
            }
          : onTap,
      child: BouncingWidget(
        child: Container(
          height: 35,
          width: 35,
          decoration: BoxDecoration(
              color: AppColors.white,
              boxShadow: [BoxShadow(color: Colors.grey, blurRadius: 5, spreadRadius: 0, offset: Offset(0, 5))],
              borderRadius: BorderRadius.circular(10)),
          child: Center(
              child: Icon(
            (isModal) ? Icons.clear : Icons.chevron_left,
            color: AppColors.blue,
            size: (isModal) ? 20 : 25,
          )),
        ),
      ),
    );
  }
}
