import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
import 'features/main_layer/view_model/cubit/home_cubit.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await _initializeApp();

  runApp(const MyApp());
}

Future<void> _initializeApp() async {
  try {
    final categoryRepository = CategoryRepository();
    final productRepository = ProductRepository();
    final packageRepository = PackageRepository();
    final filterRepository = FilterRepository();
    final appTextRepository = AppTextRepository();

    final dataInitializer = DataInitializer(
      categoryRepository: categoryRepository,
      productRepository: productRepository,
      packageRepository: packageRepository,
      filterRepository: filterRepository,
      appTextRepository: appTextRepository,
    );

    await dataInitializer.initializeAllData();
  } catch (e) {
    rethrow;
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<AppCubit>(
      create:
          (context) => AppCubit(
            categoryRepository: CategoryRepository(),
            productRepository: ProductRepository(),
            packageRepository: PackageRepository(),
            filterRepository: FilterRepository(),
            appTextRepository: AppTextRepository(),
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
