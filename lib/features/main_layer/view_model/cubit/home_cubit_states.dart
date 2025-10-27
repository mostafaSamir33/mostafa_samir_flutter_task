import '../../model/models/app_text_model.dart';
import '../../model/models/category_model.dart';
import '../../model/models/filter_model.dart';
import '../../model/models/package_model.dart';
import '../../model/models/product_model.dart';

abstract class AppState {
  const AppState();
}

class AppInitial extends AppState {}

class AppLoading extends AppState {}

class HomeDataLoaded extends AppState {
  final List<CategoryModel> categories;
  final List<ProductModel> products;
  final List<AppTextModel> appTexts;

  const HomeDataLoaded({
    required this.categories,
    required this.products,
    required this.appTexts,
  });
}

class PackagesDataLoaded extends AppState {
  final List<PackageModel> packages;
  final List<AppTextModel> appTexts;

  const PackagesDataLoaded({required this.packages, required this.appTexts});
}

class FilterDataLoaded extends AppState {
  final List<FilterModel> kindOptions;
  final List<FilterModel> roomsOptions;
  final List<FilterModel> paymentOptions;
  final List<FilterModel> conditionOptions;
  final List<AppTextModel> appTexts;

  const FilterDataLoaded({
    required this.kindOptions,
    required this.roomsOptions,
    required this.paymentOptions,
    required this.conditionOptions,
    required this.appTexts,
  });
}

class AppError extends AppState {
  final String message;

  const AppError(this.message);
}
