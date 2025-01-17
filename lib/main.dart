import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:madmon/app_root.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // Screen Util
  await ScreenUtil.ensureScreenSize();
  runApp(const AppRoot());
}

