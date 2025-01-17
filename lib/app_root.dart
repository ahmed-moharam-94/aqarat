import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:madmon/core/routing/routes_manager.dart';

import 'core/routing/app_router.dart';
import 'core/strings/strings_manager.dart';
import 'core/theming/themes_manager.dart';

class AppRoot extends StatelessWidget {
  const AppRoot({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      child: Builder(
        builder: (context) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            themeMode: ThemeMode.light,
            theme: ThemesManager.lightTheme,
            // darkTheme: ThemesManager.darkTheme,
            title: StringsManager.madmoonTask,
            initialRoute: RoutesManager.bottomNavigationScreen,
            onGenerateRoute: AppRouter.onGenerateRoute,
          );
        }
      ),
    );
  }
}
