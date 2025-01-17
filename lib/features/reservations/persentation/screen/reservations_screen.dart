import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:madmon/core/enums/reservation_status_enum.dart';
import 'package:madmon/features/reservations/persentation/widgets/reservation_card.dart';

import '../../../../core/theming/colors_manager.dart';
import '../widgets/reservation_search_filters_bar.dart';

class ReservationsScreen extends StatelessWidget {
  const ReservationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  REdgeInsets.symmetric(horizontal: 24.w),
      child: Column(
        children: [
          const ReservationSearchFiltersBar(),
          Expanded(child: ListView.builder(
              physics: const BouncingScrollPhysics(),
              itemCount: 5,
              itemBuilder: (context, index) {
                return ReservationCard(
                  reservationId: '#45256526712',
                  reservationStatus: _getFakeReservationStatus(index: index),
                  location: 'Fifth Settlement',
                  sellerName: 'Ahmed Moharam',
                  sellerPhone: '0110030293',
                  commission: 15000000,
                  unitPrice: 15000000,
                );
              })),
        ],
      ),
    );
  }

  ReservationStatusEnum _getFakeReservationStatus({required int index}) {
    if (index == 0) {
      return ReservationStatusEnum.newStatus;
    } else if (index == 1) {
      return ReservationStatusEnum.contractSigned;
    } else {
      return ReservationStatusEnum.noAnswer;
    }
  }
}
