import 'package:bloc/bloc.dart';
import 'package:madmon/core/enums/navigation_bar_enum.dart';
import 'package:meta/meta.dart';

part 'navigation_state.dart';

class NavigationCubit extends Cubit<NavigationState> {
  NavigationCubit() : super(NavigationCurrentState(
      navigationBarTab: NavigationBarTabsEnum.home, index: 0));

  void getNavBarItem(NavigationBarTabsEnum tabs) {
    switch (tabs) {
      case NavigationBarTabsEnum.home:
        emit(NavigationCurrentState(
            navigationBarTab: NavigationBarTabsEnum.home, index: 0));
        break;
      case NavigationBarTabsEnum.leads:
        emit(NavigationCurrentState(
            navigationBarTab: NavigationBarTabsEnum.leads, index: 1));
        break;
      case NavigationBarTabsEnum.units:
        emit(NavigationCurrentState(
            navigationBarTab: NavigationBarTabsEnum.units, index: 2));
        break;
      case NavigationBarTabsEnum.reservations:
        emit(NavigationCurrentState(
            navigationBarTab: NavigationBarTabsEnum.reservations, index: 3));
      case NavigationBarTabsEnum.account:
        emit(NavigationCurrentState(
            navigationBarTab: NavigationBarTabsEnum.account, index: 4));
        break;
    }
  }
}
