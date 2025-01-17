import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../strings/strings_manager.dart';
import '../theming/colors_manager.dart';

class CustomTextField extends StatefulWidget {
  final bool obscure;
  final String? Function(String?)? validator;
  final TextEditingController controller;
  final String labelText;
  final FocusNode? focusNode;
  final bool nextType;
  final FocusNode? nextNameFocus;
  final TextInputType type;
  final Widget? prefixIcon;
  final bool enable;
  final int? maxLines;
  final bool? isCountryCode;
  final Function(String value)? onChanged;
  final Color? borderColor;
  final Color? textFieldColor;
  final Color? labelColor;
  final Widget? prefix;
  final bool digitsOnly;
  final int? maxCharacters;
  final void Function()? onEditingComplete;
  final TextStyle? textStyle;
  final Widget? suffixIcon;

  const CustomTextField({
    super.key,
    this.enable = true,
    this.prefixIcon,
    required this.type,
    this.obscure = false,
    this.validator,
    required this.controller,
    this.nextNameFocus,
    this.focusNode,
    required this.labelText,
    this.nextType = false,
    this.onChanged,
    this.maxLines,
    this.isCountryCode,
    this.borderColor,
    this.textFieldColor,
    this.labelColor,
    this.prefix,
    this.digitsOnly = false,
    this.maxCharacters,
    this.onEditingComplete,
    this.textStyle,
    this.suffixIcon,
  });

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (widget.focusNode != null) {
          FocusScope.of(context).requestFocus(widget.focusNode);
        }
      },
      child: Container(
        height: 40.h,
        padding:
            REdgeInsets.only(left: 16.w, right: 9.w, top: 11.h, bottom: 8.h),
        decoration: BoxDecoration(
          color: ColorsManager.white,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            color: widget.borderColor ?? ColorsManager.containerBorder,
          ),
        ),
        child: TextFormField(
          cursorColor: ColorsManager.lightGreyShade,
          maxLength: widget.maxCharacters,
          enabled: widget.enable,
          controller: widget.controller,
          validator: widget.validator,
          focusNode: widget.focusNode,
          keyboardType: widget.type,
          maxLines: widget.maxLines ?? 1,
          textAlign: TextAlign.start,
          textInputAction:
              widget.nextType ? TextInputAction.next : TextInputAction.done,
          obscureText: widget.obscure,
          style: widget.textStyle ??
              Theme.of(context).textTheme.bodySmall?.copyWith(
                    fontSize: 11.sp,
                    color: ColorsManager.primary,
                  ),
          decoration: InputDecoration(
            suffixIcon: widget.suffixIcon,

            hintText: widget.labelText,
            hintStyle:
                TextStyle(fontSize: 14.sp, color: ColorsManager.lightGreyShade),
            fillColor: ColorsManager.white,
            isDense: true,
            border: InputBorder.none,
          ),
          onChanged: widget.onChanged,
          onEditingComplete: widget.onEditingComplete,
        ),
      ),
    );
  }
}
