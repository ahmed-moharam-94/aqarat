part of 'navigation_cubit.dart';

@immutable
abstract class NavigationState {}

class NavigationInitial extends NavigationState {}

class NavigationCurrentState extends NavigationState {
  final NavigationBarTabsEnum navigationBarTab;
  final int index;

  NavigationCurrentState(
      {required this.navigationBarTab, required this.index});
}
