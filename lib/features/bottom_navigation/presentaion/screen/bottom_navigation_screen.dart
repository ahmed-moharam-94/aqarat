import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:madmon/app_root.dart';
import 'package:madmon/core/assets/assets_manager.dart';
import 'package:madmon/core/enums/navigation_bar_enum.dart';
import 'package:madmon/core/strings/strings_manager.dart';
import 'package:madmon/features/bottom_navigation/presentaion/widgets/custom_app_bar.dart';
import 'package:madmon/features/reservations/persentation/screen/reservations_screen.dart';

import '../../../../core/theming/colors_manager.dart';
import '../cubit/navigation_cubit.dart';

class BottomNavigationScreen extends StatefulWidget {
  const BottomNavigationScreen({super.key});

  @override
  State<BottomNavigationScreen> createState() => _BottomNavigationScreenState();
}

class _BottomNavigationScreenState extends State<BottomNavigationScreen> {

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NavigationCubit(),
      child: BlocBuilder<NavigationCubit, NavigationState>(
        builder: (context, navigationState) {
          if (navigationState is NavigationCurrentState) {
            return Scaffold(
              appBar: CustomAppBar(
                  title: _getAppBarTitle(currentIndex: navigationState.index)),
              bottomNavigationBar: Container(
                padding: REdgeInsets.only(top: 20, bottom: 16),
                decoration: const BoxDecoration(
                  color: ColorsManager.white,
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(45),
                      topLeft: Radius.circular(45)),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.black12, spreadRadius: 0, blurRadius: 10),
                  ],
                ),
                child: ClipRRect(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(45),
                    topRight: Radius.circular(45),
                  ),
                  child: BottomNavigationBar(
                    currentIndex: navigationState.index,
                    type: BottomNavigationBarType.fixed,
                    selectedItemColor: ColorsManager.primary,
                    unselectedItemColor: ColorsManager.lightGreyShade,
                    items: [
                      _getNavigationBarItem(
                          iconIndex: 0,
                          currentIndex: navigationState.index,
                          vector: AssetsManager.homeVector,
                          label: StringsManager.home),
                      _getNavigationBarItem(
                          iconIndex: 1,
                          currentIndex: navigationState.index,
                          vector: AssetsManager.leadsVector,
                          label: StringsManager.leads),
                      _getNavigationBarItem(
                          iconIndex: 2,
                          currentIndex: navigationState.index,
                          vector: AssetsManager.unitsVector,
                          label: StringsManager.units),
                      _getNavigationBarItem(
                          iconIndex: 3,
                          currentIndex: navigationState.index,
                          vector: AssetsManager.reservationsVector,
                          label: StringsManager.reservations),
                      _getNavigationBarItem(
                          iconIndex: 4,
                          currentIndex: navigationState.index,
                          vector: AssetsManager.accountVector,
                          label: StringsManager.account),
                    ],
                    onTap: (index) {
                      if (index == 0) {
                        BlocProvider.of<NavigationCubit>(context)
                            .getNavBarItem(NavigationBarTabsEnum.home);
                      } else if (index == 1) {
                        BlocProvider.of<NavigationCubit>(context)
                            .getNavBarItem(NavigationBarTabsEnum.leads);
                      } else if (index == 2) {
                        BlocProvider.of<NavigationCubit>(context)
                            .getNavBarItem(NavigationBarTabsEnum.units);
                      } else if (index == 3) {
                        BlocProvider.of<NavigationCubit>(context)
                            .getNavBarItem(NavigationBarTabsEnum.reservations);
                      } else if (index == 4) {
                        BlocProvider.of<NavigationCubit>(context)
                            .getNavBarItem(NavigationBarTabsEnum.account);
                      }
                    },
                  ),
                ),
              ),
              body: BlocBuilder<NavigationCubit, NavigationState>(
                  builder: (context, state) {
                if (state is NavigationCurrentState) {
                  if (state.navigationBarTab == NavigationBarTabsEnum.home) {
                    return const SizedBox();
                  } else if (state.navigationBarTab ==
                      NavigationBarTabsEnum.leads) {
                    return const SizedBox();
                  } else if (state.navigationBarTab ==
                      NavigationBarTabsEnum.units) {
                    return const SizedBox();
                  } else if (state.navigationBarTab ==
                      NavigationBarTabsEnum.reservations) {
                    return const ReservationsScreen();
                  } else if (state.navigationBarTab ==
                      NavigationBarTabsEnum.account) {
                    return const SizedBox();
                  }
                }
                return const SizedBox();
              }),
            );
          } else {
            return const Scaffold(
              body: SizedBox(),
            );
          }
        },
      ),
    );
  }

  BottomNavigationBarItem _getNavigationBarItem(
      {required int currentIndex,
      required iconIndex,
      required String label,
      required String vector}) {
    return BottomNavigationBarItem(
      icon: Padding(
        padding: const EdgeInsets.only(bottom: 14),
        child: SvgPicture.asset(
          vector,
          color:
              _navIconColor(iconIndex: iconIndex, currentIndex: currentIndex),
        ),
      ),
      label: label,
    );
  }

  Color _navIconColor({required int iconIndex, required int currentIndex}) {
    return currentIndex == iconIndex
        ? ColorsManager.primary
        : ColorsManager.lightGreyShade;
  }

  String _getAppBarTitle({required int currentIndex}) {
    if (currentIndex == 0) {
      return StringsManager.home;
    } else if (currentIndex == 1) {
      return StringsManager.leads;
    } else if (currentIndex == 2) {
      return StringsManager.units;
    } else if (currentIndex == 3) {
      return StringsManager.reservations;
    } else {
      return StringsManager.account;
    }
  }
}

