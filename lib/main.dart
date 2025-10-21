import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'core/resources/app_scroll_behavior.dart';
import 'core/resources/app_theme.dart';
import 'features/main_layer/view/screens/filter_screen.dart';
import 'features/main_layer/view/screens/home_screen/main_layer_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(360, 800),
      minTextAdapt: true,
      splitScreenMode: true,
      builder:
          (context, child) => MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: AppTheme.themeData,
            themeMode: ThemeMode.light,
            scrollBehavior: AppScrollBehavior(),
            routes: {
              MainLayerScreen.routeName: (_) => MainLayerScreen(),
              FilterScreen.routeName: (_) => FilterScreen(),
            },
            initialRoute: MainLayerScreen.routeName,
          ),
    );
  }
}
