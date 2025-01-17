import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:madmon/core/theming/colors_manager.dart';

class CustomTitleCheckBox extends StatefulWidget {
  final String title;

  const CustomTitleCheckBox({super.key, required this.title});

  @override
  State<CustomTitleCheckBox> createState() => _CustomTitleCheckBoxState();
}

class _CustomTitleCheckBoxState extends State<CustomTitleCheckBox> {
  bool _value = false;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(widget.title,
            style: TextStyle(
              color: ColorsManager.darkGreyShade,
              fontSize: 14.sp,
            )),
        const Spacer(),
        Transform.scale(
          scale: 1.5,
          child: Padding(
            padding: EdgeInsets.zero,
            child: Checkbox(
                side: WidgetStateBorderSide.resolveWith(
                    (states) => const BorderSide(
                          color: ColorsManager.secondary,
                          width: 1.5,
                        )),
                activeColor: Colors.white,
                checkColor: ColorsManager.secondary,
                focusColor: Colors.transparent,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5.r)),
                value: _value,
                onChanged: (value) {
                  setState(() {
                    _value = value ?? false;
                  });
                }),
          ),
        )
      ],
    );
  }
}
