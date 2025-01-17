import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:madmon/core/assets/assets_manager.dart';
import 'package:madmon/core/enums/reservation_status_enum.dart';
import 'package:madmon/core/strings/strings_manager.dart';

import '../../../../core/theming/colors_manager.dart';

class ReservationCard extends StatefulWidget {
  final String reservationId;
  final String location;
  final ReservationStatusEnum reservationStatus;
  final String sellerName;
  final String sellerPhone;
  final double unitPrice;
  final double commission;

  const ReservationCard({
    super.key,
    required this.reservationId,
    required this.location,
    required this.reservationStatus,
    required this.sellerName,
    required this.sellerPhone,
    required this.unitPrice,
    required this.commission,
  });

  @override
  State<ReservationCard> createState() => _ReservationCardState();
}

class _ReservationCardState extends State<ReservationCard> {
  bool _showMoreInfo = false;

  void _changeShowMoreInfoValue(bool value) {
    setState(() {
      _showMoreInfo = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      curve: Curves.linear,
      height: _showMoreInfo? 480.h : 220.h,
      margin: const EdgeInsets.symmetric(vertical: 11),
      decoration: BoxDecoration(
        color: ColorsManager.white,
        border: Border.all(color: ColorsManager.containerBorder),
        borderRadius: BorderRadius.circular(16),
        boxShadow: const [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 7,
            spreadRadius: 0,
            offset: Offset(0, 0),
          )
        ], /**/
      ),
      // elevation: 3,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        // Wrap with singleChildScrollView to avoid overflow when animating
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildReservationInfo(),
              const Divider(height: 24, color: ColorsManager.dividerColor),
              // Seller info
              _buildSellerAndBuyerInfo(isSeller: true),
              const Divider(height: 24, color: ColorsManager.dividerColor),

              if (_showMoreInfo)
                Column(
                  children: [
                    // Buyer info
                    _buildSellerAndBuyerInfo(isSeller: false),
                    const Divider(
                        height: 24, color: ColorsManager.dividerColor),
                    _buildUnitPriceAndCommission(),
                    const Divider(
                        height: 24, color: ColorsManager.dividerColor),
                    _buildDates(),
                    const Divider(
                        height: 24, color: ColorsManager.dividerColor),
                    _buildSeeNotes(),
                    const Divider(
                        height: 24, color: ColorsManager.dividerColor),
                  ],
                ),

              InkWell(
                onTap: () => _changeShowMoreInfoValue(!_showMoreInfo),
                child: Center(
                  child: Icon(
                    _showMoreInfo
                        ? Icons.keyboard_arrow_up
                        : Icons.keyboard_arrow_down,
                    color: ColorsManager.lightGreyShade,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildReservationInfo() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "#${widget.reservationId}",
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: ColorsManager.lightGreyShade,
                    fontWeight: FontWeight.w500,
                  ),
            ),
            SizedBox(height: 8.h),
            Row(
              children: [
                SvgPicture.asset(
                  AssetsManager.locationVector,
                ),
                SizedBox(width: 5.w),
                Text(
                  widget.location,
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: ColorsManager.lightGreyShade,
                      ),
                ),
              ],
            ),
          ],
        ),
        // Status Button
        Container(
          width: 125.w,
          height: 28.h,
          decoration: BoxDecoration(
            border: widget.reservationStatus == ReservationStatusEnum.newStatus
                ? Border.all(color: ColorsManager.primary)
                : null,
            color: widget.reservationStatus == ReservationStatusEnum.newStatus
                ? ColorsManager.white
                : widget.reservationStatus.color,
            borderRadius: BorderRadius.circular(4),
          ),
          alignment: Alignment.center,
          child: Text(widget.reservationStatus.value,
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: widget.reservationStatus ==
                            ReservationStatusEnum.newStatus
                        ? ColorsManager.primary
                        : ColorsManager.white,
                  )),
        ),
      ],
    );
  }

  Widget _buildSellerAndBuyerInfo({required bool isSeller}) {
    return Row(
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                isSeller ? StringsManager.sellerInfo : StringsManager.buyerInfo,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 12,
                ),
              ),
              SizedBox(height: 7.h),
              Text(
                widget.sellerName,
                style: const TextStyle(
                    color: ColorsManager.lightGreyShade,
                    fontSize: 14,
                    fontWeight: FontWeight.normal),
              ),
              SizedBox(height: 7.h),
              Row(
                children: [
                  SvgPicture.asset(
                    AssetsManager.phoneVector,
                  ),
                  const SizedBox(width: 6),
                  Text(
                    widget.sellerPhone,
                    style: const TextStyle(
                        color: ColorsManager.lightGreyShade,
                        fontSize: 14,
                        fontWeight: FontWeight.normal),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildUnitPriceAndCommission() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              StringsManager.unitPrice,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 12,
              ),
            ),
            const SizedBox(height: 7),
            Text(
              '${widget.unitPrice}',
              style: TextStyle(
                fontSize: 14.sp,
                fontWeight: FontWeight.w500,
                color: ColorsManager.red,
              ),
            ),
          ],
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              StringsManager.commission,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 12,
              ),
            ),
            const SizedBox(height: 7),
            Text(
              '${widget.commission}',
              style: TextStyle(
                fontSize: 14.sp,
                fontWeight: FontWeight.w500,
                color: ColorsManager.red,
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildDates() {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              StringsManager.dataReserved,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 12,
              ),
            ),
            SizedBox(height: 7),
            Text('20/3/2025',
                style: TextStyle(
                    color: ColorsManager.lightGreyShade,
                    fontSize: 14,
                    fontWeight: FontWeight.normal)),
          ],
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              StringsManager.lastAction,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 12,
              ),
            ),
            SizedBox(height: 7),
            Text(
              '20/3/2025',
              style: TextStyle(
                  color: ColorsManager.lightGreyShade,
                  fontSize: 14,
                  fontWeight: FontWeight.normal),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildSeeNotes() {
    return Row(
      children: [
        const Icon(Icons.edit_outlined, size: 20, color: ColorsManager.primary),
        SizedBox(width: 7.w),
        const Text(
          StringsManager.seeNotes,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 12,
          ),
        ),
      ],
    );
  }
}
