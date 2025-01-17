import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:madmon/core/reusabel_widgets/cusrom_elevated_button.dart';
import 'package:madmon/core/theming/colors_manager.dart';

import '../../../../core/strings/strings_manager.dart';
import 'collapsed_title.dart';
import 'custom_title_check_box.dart';

class FilterBottomSheet extends StatefulWidget {
  const FilterBottomSheet({super.key});

  @override
  State<FilterBottomSheet> createState() => _FilterBottomSheetState();
}

class _FilterBottomSheetState extends State<FilterBottomSheet> {
  RangeValues _currentRangeValues = const RangeValues(20, 80);

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
                  title: StringsManager.location,
                  child: Column(
                    children: [
                      CustomTitleCheckBox(title: 'Shakih Zayed'),
                      CustomTitleCheckBox(title: 'New Cairo'),
                    ],
                  ),
                ),
                SizedBox(height: 16.h),
                CollapsedTitle(
                  title: StringsManager.price,
                  child: Padding(
                    padding:  REdgeInsets.only(top: 8.0),
                    child: SliderTheme(
                      data: SliderTheme.of(context).copyWith(
                        valueIndicatorColor: ColorsManager.lightGreyShade,
                      ),
                      child: RangeSlider(
                        values: _currentRangeValues,
                        min: 0,
                        max: 100,
                        divisions: 10,
                        inactiveColor: ColorsManager.lightGreyShade4,
                        activeColor: ColorsManager.secondary,
                        labels: RangeLabels(
                          _currentRangeValues.start.round().toString(),
                          _currentRangeValues.end.round().toString(),
                        ),
                        onChanged: (RangeValues values) {
                          setState(() {
                            _currentRangeValues = values;
                          });
                        },
                      ),
                    ),
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
