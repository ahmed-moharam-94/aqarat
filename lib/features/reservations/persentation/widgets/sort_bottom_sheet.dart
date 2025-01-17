import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:madmon/features/reservations/persentation/widgets/custom_title_check_box.dart';

import '../../../../core/reusabel_widgets/cusrom_elevated_button.dart';
import '../../../../core/strings/strings_manager.dart';
import '../../../../core/theming/colors_manager.dart';
import 'collapsed_title.dart';

class SortBottomSheet extends StatelessWidget {
  const SortBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: REdgeInsets.symmetric(horizontal: 24.w),
          child:  Text(StringsManager.filterBy, style: TextStyle(
            color: ColorsManager.primary,
            fontSize: 14.sp,
            fontWeight: FontWeight.w500,
          ),),
        ),
        Expanded(
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: 16.h),
                const CollapsedTitle(
                  title: StringsManager.status,
                  child: Column(
                    children: [
                      CustomTitleCheckBox(title: StringsManager.reserved),
                      CustomTitleCheckBox(title: StringsManager.notReserved),
                    ],
                  ),
                ),
                SizedBox(height: 16.h),
                 const CollapsedTitle(
                  title: StringsManager.price,
                  child: Column(
                    children: [
                      CustomTitleCheckBox(title: StringsManager.highToLow),
                      CustomTitleCheckBox(title: StringsManager.lowToHigh),
                    ],
                  ),
                ),
                SizedBox(height: 16.h),
                const CollapsedTitle(
                  title: StringsManager.date,
                  child: Column(
                    children: [
                      CustomTitleCheckBox(title: StringsManager.newest),
                      CustomTitleCheckBox(title: StringsManager.oldest),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        Padding(
          padding: REdgeInsets.symmetric(horizontal: 24),
          child: CustomElevatedButtonWidget(
              width: double.infinity,
              height: 40.h,
              title: StringsManager.showResults, onPressed: () {}),
        ),
        SizedBox(height: 22.h),
        Align(
          alignment: Alignment.center,
          child: TextButton(onPressed: () {}, child: const Text(StringsManager.resetAll, style: TextStyle(
            color: ColorsManager.darkGreyShade,
            decoration: TextDecoration.underline,
            fontSize: 16,
            fontWeight: FontWeight.w400,
          ),)),
        ),
        SizedBox(height: 16.h),
      ],
    );
  }
}
