import 'package:flutter/cupertino.dart';
import 'package:madmon/core/routing/routes_manager.dart';
import 'package:madmon/features/bottom_navigation/presentaion/screen/bottom_navigation_screen.dart';

import '../../features/reservations/persentation/screen/reservations_screen.dart';

class AppRouter {
  // method to generate screen routes
  static Route? onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case RoutesManager.bottomNavigationScreen:
        return CupertinoPageRoute(
            settings: routeSettings,
            builder: (_) => const BottomNavigationScreen());
      case RoutesManager.reservationsScreen:
        return CupertinoPageRoute(
            settings: routeSettings,
            builder: (_) => const ReservationsScreen());

      default:
        return null;
    }
  }
}
