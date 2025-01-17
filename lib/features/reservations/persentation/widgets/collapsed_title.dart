import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:madmon/app_root.dart';

import '../../../../core/theming/colors_manager.dart';

class CollapsedTitle extends StatefulWidget {
  final String title;
  final Widget child;

  const CollapsedTitle({super.key, required this.title, required this.child});

  @override
  State<CollapsedTitle> createState() => _CollapsedTitleState();
}

class _CollapsedTitleState extends State<CollapsedTitle> {
  bool _expand = false;

  void _changeExpandValue(bool value) {
    setState(() {
      _expand = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(

      duration: const Duration(milliseconds: 300),
      curve: Curves.linear,
      height: _expand ? 150.h : 30.h,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: double.infinity,
              height: 34.h,
              color: ColorsManager.lightGreyShade2,
              child: InkWell(
                onTap: () {
                  _changeExpandValue(!_expand);
                },
                child: Padding(
                  padding: REdgeInsets.symmetric(horizontal: 24),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        widget.title,
                        style: TextStyle(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Icon(_expand
                          ? Icons.keyboard_arrow_up
                          : Icons.keyboard_arrow_down),
                    ],
                  ),
                ),
              ),
            ),
            if (_expand) Padding(
              padding:  REdgeInsets.only(left: 24.w, right: 12),
              child: widget.child,
            )
          ],
        ),
      ),
    );
  }
}
