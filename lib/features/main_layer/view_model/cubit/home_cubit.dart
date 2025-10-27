import 'package:flutter_bloc/flutter_bloc.dart';

import '../../model/repositories/app_text_repository.dart';
import '../../model/repositories/category_repository.dart';
import '../../model/repositories/filter_repository.dart';
import '../../model/repositories/package_repository.dart';
import '../../model/repositories/product_repository.dart';
import 'home_cubit_states.dart';

class AppCubit extends Cubit<AppState> {
  final CategoryRepository _categoryRepository;
  final ProductRepository _productRepository;
  final PackageRepository _packageRepository;
  final FilterRepository _filterRepository;
  final AppTextRepository _appTextRepository;

  AppCubit({
    required CategoryRepository categoryRepository,
    required ProductRepository productRepository,
    required PackageRepository packageRepository,
    required FilterRepository filterRepository,
    required AppTextRepository appTextRepository,
  }) : _categoryRepository = categoryRepository,
       _productRepository = productRepository,
       _packageRepository = packageRepository,
       _filterRepository = filterRepository,
       _appTextRepository = appTextRepository,
       super(AppInitial());

  // Load home screen data with texts
  Future<void> loadHomeData() async {
    emit(AppLoading());
    try {
      final categories = await _categoryRepository.getAllCategories();
      final products = await _productRepository.getAllProducts();
      final appTexts = await _appTextRepository.getAppTextsByScreen('home');

      emit(
        HomeDataLoaded(
          categories: categories,
          products: products,
          appTexts: appTexts,
        ),
      );
    } catch (e) {
      emit(AppError('Failed to load home data: $e'));
    }
  }

  // Load packages screen data with texts
  Future<void> loadPackagesData() async {
    emit(AppLoading());
    try {
      final packages = await _packageRepository.getAllPackages();
      final appTexts = await _appTextRepository.getAppTextsByScreen('packages');

      emit(PackagesDataLoaded(packages: packages, appTexts: appTexts));
    } catch (e) {
      emit(AppError('Failed to load packages: $e'));
    }
  }

  // Load filter screen data with texts
  Future<void> loadFilterData() async {
    emit(AppLoading());
    try {
      final kindOptions = await _filterRepository.getFilterOptions('kind');
      final roomsOptions = await _filterRepository.getFilterOptions('number_of_rooms');
      final paymentOptions = await _filterRepository.getFilterOptions(
        'payment_method',
      );
      final conditionOptions = await _filterRepository.getFilterOptions(
        'property_condition',
      );
      final appTexts = await _appTextRepository.getAppTextsByScreen('filter');

      emit(
        FilterDataLoaded(
          kindOptions: kindOptions,
          roomsOptions: roomsOptions,
          paymentOptions: paymentOptions,
          conditionOptions: conditionOptions,
          appTexts: appTexts,
        ),
      );
    } catch (e) {
      emit(AppError('Failed to load filter data: $e'));
    }
  }

  // Get specific text by key
  Future<String> getText(String screenName, String textKey) async {
    return await _appTextRepository.getTextByKey(screenName, textKey);
  }
}
