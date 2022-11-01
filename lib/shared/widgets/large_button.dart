import 'package:bebepaca/resources/theme/app_colors.dart';
import 'package:bebepaca/shared/widgets/bouncing_widgets.dart';
import 'package:flutter/material.dart';

class LargeButton extends StatelessWidget {
  final VoidCallback? onTap;
  final String text;
  final TextStyle? textStyle;
  final String? textSecondary;
  final TextStyle? textSecondaryStyle;
  final double height;
  final double? width;
  final bool isDisabled;
  final double? circular;
  final double? bottom;
  const LargeButton(
      {Key? key,
      this.onTap,
      required this.text,
      this.textStyle,
      this.textSecondary = '',
      this.textSecondaryStyle,
      this.height = 45,
      this.width,
      this.circular,
      this.bottom,
      required this.isDisabled})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BouncingWidget(
      onPress: () {
        if (onTap != null) onTap!();
      },
      child: Container(
        height: height,
        width: width ?? MediaQuery.of(context).size.width * 0.90,
        margin: EdgeInsets.only(bottom: bottom ?? 10),
        padding: const EdgeInsets.only(left: 15, right: 15),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: (isDisabled) ? [AppColors.gray, AppColors.gray] : [AppColors.blue, AppColors.cyan],
            begin: FractionalOffset.topRight,
            end: FractionalOffset.bottomLeft,
          ),
          borderRadius: BorderRadius.circular(circular ?? 10),
        ),
        child: Row(
          mainAxisAlignment: (textSecondary == '') ? MainAxisAlignment.center : MainAxisAlignment.spaceBetween,
          children: [
            Text(text,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: textStyle ?? TextStyle(fontSize: 15, fontWeight: FontWeight.w600, color: AppColors.white)),
            !(textSecondary == '')
                ? Text(textSecondary ?? '',
                    style: textSecondaryStyle ??
                        TextStyle(fontSize: 15, fontWeight: FontWeight.w600, color: AppColors.white))
                : Container()
          ],
        ),
      ),
    );
  }
}
