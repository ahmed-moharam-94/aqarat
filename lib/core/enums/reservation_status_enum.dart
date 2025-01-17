import 'dart:ui';

import 'package:madmon/core/theming/colors_manager.dart';

import '../strings/strings_manager.dart';

enum ReservationStatusEnum {
  newStatus,
  contractSigned,
  noAnswer,
}

extension ReservationStatusValue on ReservationStatusEnum {
  String get value {
    switch (this) {
      case ReservationStatusEnum.newStatus:
        return StringsManager.newStatus;
      case ReservationStatusEnum.contractSigned:
        return StringsManager.contractSigned;
      case ReservationStatusEnum.noAnswer:
        return StringsManager.noAnswer;
    }
  }

  Color get color {
    switch (this) {
      case ReservationStatusEnum.newStatus:
        return ColorsManager.primary;
      case ReservationStatusEnum.contractSigned:
        return ColorsManager.green;
      case ReservationStatusEnum.noAnswer:
        return ColorsManager.red;
    }
  }

}