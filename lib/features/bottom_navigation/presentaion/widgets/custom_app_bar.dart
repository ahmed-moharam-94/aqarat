import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:madmon/app_root.dart';
import 'package:madmon/core/theming/colors_manager.dart';

import '../../../../core/assets/assets_manager.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final double? bottomHeight;

  const CustomAppBar({super.key, required this.title, this.bottomHeight});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: kToolbarHeight + 56.h,
      decoration: BoxDecoration(
        color: ColorsManager.white,
        borderRadius: BorderRadius.vertical(bottom: Radius.circular(20.r)),
        boxShadow: const [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 7,
            spreadRadius: 0,
            offset: Offset(0, 0),
          )
        ],
      ),
      child: Padding(
        padding: REdgeInsets.only(top: kToolbarHeight / 2),
        child: Row(
          children: [
            Padding(
              padding: REdgeInsets.symmetric(horizontal: 28),
              child: SvgPicture.asset(AssetsManager.menuVector),
            ),
            const Spacer(),
            Center( // Ensures the title is centered
              child: Text(
                title,
                style: Theme.of(context).textTheme.labelLarge,
              ),
            ),
            const Spacer(),
            Padding(
              padding: REdgeInsets.symmetric(horizontal: 28),
              child: SvgPicture.asset(AssetsManager.notificationsVector),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(
    kToolbarHeight +
        40 +
        (bottomHeight != null ? (bottomHeight ?? 0 + 40) : 0),
  );
}
