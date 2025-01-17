import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:madmon/app_root.dart';
import 'package:madmon/core/theming/colors_manager.dart';

class CustomBottomSheet extends StatelessWidget {
  final Widget children;
  const CustomBottomSheet({super.key, required this.children});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 546.h,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
           SizedBox(height: 20.h),
          _buildBottomSheetTopIndication(),
          SizedBox(height: 22.h),
          Expanded(child: children),
        ],
      ),
    );
  }

  Widget _buildBottomSheetTopIndication() {
    return Container(
      width: 67.w,
      height: 6.h,
      decoration: BoxDecoration(
          color: ColorsManager.lightGreyShade4,
          borderRadius: BorderRadius.all(Radius.circular(8.r))),
    );
  }
}
