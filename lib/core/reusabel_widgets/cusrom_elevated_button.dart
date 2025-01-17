import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../theming/colors_manager.dart';

class CustomElevatedButtonWidget extends StatelessWidget {
  final String title;
  final void Function() onPressed;
  final Color? buttonColor;
  final Color? titleColor;
  final Color? borderColor;
  final double? width;
  final double? height;
  final double? borderRadius;
  final TextStyle? textStyle;
  final double? borderWidth;

  const CustomElevatedButtonWidget({
    super.key,
    required this.title,
    required this.onPressed,
    this.buttonColor,
    this.titleColor,
    this.borderColor,
    this.width,
    this.height,
    this.borderRadius,
    this.textStyle,
    this.borderWidth,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
          backgroundColor: buttonColor ?? ColorsManager.secondary,
          foregroundColor: ColorsManager.white.withOpacity(0.01),
          shadowColor: ColorsManager.white.withOpacity(0.01),
          elevation: 0,
          padding: REdgeInsets.symmetric(horizontal: 25),
          minimumSize: Size(width ?? 20, height ?? 40),
          shape: RoundedRectangleBorder(
              borderRadius:
              BorderRadius.all(Radius.circular(borderRadius ?? 10))),
          side: BorderSide(
            color: borderColor ?? Colors.transparent,
            width: borderWidth ?? 2,
          )),
      onPressed: onPressed,
      child: Text(
        title,
        style: textStyle ??
            Theme.of(context).textTheme.headlineMedium?.copyWith(
              color: titleColor ?? ColorsManager.white,
            ),
      ),
    );
  }
}