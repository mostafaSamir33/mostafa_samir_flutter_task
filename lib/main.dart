import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:otex/features/main_layer/model/repositories/app_icon_repository.dart';
import 'package:otex/features/main_layer/model/repositories/app_text_repository.dart';

import 'core/resources/app_scroll_behavior.dart';
import 'core/resources/app_theme.dart';
import 'features/main_layer/model/repositories/category_repository.dart';
import 'features/main_layer/model/repositories/filter_repository.dart';
import 'features/main_layer/model/repositories/package_repository.dart';
import 'features/main_layer/model/repositories/product_repository.dart';
import 'features/main_layer/model/services/data_initializer.dart';
import 'features/main_layer/view/screens/filter_screen.dart';
import 'features/main_layer/view/screens/home_screen/main_layer_screen.dart';
import 'features/main_layer/view_model/cubit/app_cubit.dart';

final RouteObserver<PageRoute> routeObserver = RouteObserver<PageRoute>();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  CategoryRepository categoryRepository = CategoryRepository();
  ProductRepository productRepository = ProductRepository();
  PackageRepository packageRepository = PackageRepository();
  FilterRepository filterRepository = FilterRepository();
  AppTextRepository appTextRepository = AppTextRepository();
  AppIconRepository appIconRepository = AppIconRepository();

  await _initializeData(
    categoryRepository: categoryRepository,
    productRepository: productRepository,
    packageRepository: packageRepository,
    filterRepository: filterRepository,
    appTextRepository: appTextRepository,
    appIconRepository: appIconRepository,
  );

  runApp(
    MyApp(
      categoryRepository: categoryRepository,
      productRepository: productRepository,
      packageRepository: packageRepository,
      filterRepository: filterRepository,
      appTextRepository: appTextRepository,
      appIconRepository: appIconRepository,
    ),
  );
}

Future<void> _initializeData({
  required CategoryRepository categoryRepository,
  required ProductRepository productRepository,
  required PackageRepository packageRepository,
  required FilterRepository filterRepository,
  required AppTextRepository appTextRepository,
  required AppIconRepository appIconRepository,
}) async {
  try {
    final dataInitializer = DataInitializer(
      categoryRepository: categoryRepository,
      productRepository: productRepository,
      packageRepository: packageRepository,
      filterRepository: filterRepository,
      appTextRepository: appTextRepository,
      appIconRepository: appIconRepository,
    );

    await dataInitializer.initializeAllData();
  } catch (e) {
    rethrow;
  }
}

class MyApp extends StatelessWidget {
  final CategoryRepository? categoryRepository;
  final ProductRepository? productRepository;
  final PackageRepository? packageRepository;
  final FilterRepository? filterRepository;
  final AppTextRepository? appTextRepository;
  final AppIconRepository? appIconRepository;

  const MyApp({
    super.key,
    this.categoryRepository,
    this.productRepository,
    this.packageRepository,
    this.filterRepository,
    this.appTextRepository,
    this.appIconRepository,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider<AppCubit>(
      create:
          (context) => AppCubit(
            categoryRepository: categoryRepository!,
            productRepository: productRepository!,
            packageRepository: packageRepository!,
            filterRepository: filterRepository!,
            appTextRepository: appTextRepository!,
            appIconRepository: appIconRepository!,
          ),
      child: ScreenUtilInit(
        designSize: Size(360, 800),
        minTextAdapt: true,
        splitScreenMode: true,
        builder:
            (context, child) => MaterialApp(
              debugShowCheckedModeBanner: false,
              theme: AppTheme.themeData,
              themeMode: ThemeMode.light,
              navigatorObservers: [routeObserver],
              scrollBehavior: AppScrollBehavior(),
              routes: {
                MainLayerScreen.routeName: (_) => MainLayerScreen(),
                FilterScreen.routeName: (_) => FilterScreen(),
              },
              initialRoute: MainLayerScreen.routeName,
            ),
      ),
    );
  }
}
