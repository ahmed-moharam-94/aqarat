import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:madmon/core/assets/assets_manager.dart';
import 'package:madmon/core/reusabel_widgets/custom_bottom_sheet.dart';
import 'package:madmon/core/reusabel_widgets/custom_text_field.dart';
import 'package:madmon/core/theming/colors_manager.dart';
import 'package:madmon/features/reservations/persentation/widgets/filter_bottom_sheet.dart';
import 'package:madmon/features/reservations/persentation/widgets/sort_bottom_sheet.dart';

import '../../../../core/strings/strings_manager.dart';

enum BottomSheetType {
  filter,
  sort,
}

class ReservationSearchFiltersBar extends StatefulWidget {
  const ReservationSearchFiltersBar({super.key});

  @override
  State<ReservationSearchFiltersBar> createState() =>
      _ReservationSearchFiltersBarState();
}

class _ReservationSearchFiltersBarState
    extends State<ReservationSearchFiltersBar> {
  final _searchController = TextEditingController();

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Padding(
            padding: REdgeInsets.only(top: 16.0, bottom: 16),
            child: CustomTextField(
              type: TextInputType.text,
              controller: _searchController,
              labelText: StringsManager.search,
              suffixIcon: SvgPicture.asset(
                AssetsManager.searchVector,
                width: 19,
                height: 19,
                fit: BoxFit.contain,
              ),
            ),
          ),
        ),
        SizedBox(width: 4.w),
        _buildSortAndFilterIcon(vector: AssetsManager.sortVector, onTap: () => _showBottomSheet(bottomSheetType: BottomSheetType.sort)),
        SizedBox(width: 4.w),
        _buildSortAndFilterIcon(
            vector: AssetsManager.filterVector, onTap: () => _showBottomSheet(bottomSheetType: BottomSheetType.filter)),
      ],
    );
  }

  Widget _buildSortAndFilterIcon(
      {required String vector, required Function() onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 40.w,
        height: 40.h,
        decoration: BoxDecoration(
            color: ColorsManager.white,
            border: Border.all(color: ColorsManager.containerBorder),
            borderRadius: BorderRadius.all(Radius.circular(10.r))),
        child: Padding(
          padding: REdgeInsets.all(12.0),
          child: SvgPicture.asset(
            vector,
          ),
        ),
      ),
    );
  }

  void _showBottomSheet({required BottomSheetType bottomSheetType}) {
    showModalBottomSheet(
        context: context,
        builder: (_) {
          return  CustomBottomSheet(children: bottomSheetType == BottomSheetType.filter? const FilterBottomSheet() : const SortBottomSheet());
        });
  }
}
