import 'package:bebepaca/resources/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class Loading extends StatelessWidget {
  final bool? inScreenWhite;
  const Loading({Key? key, this.inScreenWhite = false}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (inScreenWhite!) {
      return Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          color: AppColors.whiteBackground,
          child: Center(
              child: LoadingAnimationWidget.discreteCircle(
            color: AppColors.cyan,
            secondRingColor: AppColors.blue,
            thirdRingColor: AppColors.cyan,
            size: 50,
          )));
    } else {
      return Center(
          child: LoadingAnimationWidget.discreteCircle(
        color: AppColors.cyan,
        secondRingColor: AppColors.cyan,
        thirdRingColor: AppColors.cyan,
        size: 50,
      ));
    }
  }
}
