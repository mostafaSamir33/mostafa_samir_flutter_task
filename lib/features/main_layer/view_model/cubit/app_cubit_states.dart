import '../../model/models/app_text_model.dart';
import '../../model/models/category_model.dart';
import '../../model/models/filter_model.dart';
import '../../model/models/package_model.dart';
import '../../model/models/product_model.dart';

abstract class AppStates {
  const AppStates();
}

class AppInitial extends AppStates {}

class AppDataLoading extends AppStates {}

class AppDataError extends AppStates {
  final String message;

  const AppDataError(this.message);
}

//home data
class HomeDataSuccessLoaded extends AppStates {
  final List<CategoryModel> categories;
  final List<ProductModel> products;
  final List<AppTextModel> appTexts;

  const HomeDataSuccessLoaded({
    required this.categories,
    required this.products,
    required this.appTexts,
  });
}

//packages data
class PackagesDataSuccessLoaded extends AppStates {
  final List<PackageModel> packages;
  final List<AppTextModel> appTexts;

  const PackagesDataSuccessLoaded({
    required this.packages,
    required this.appTexts,
  });
}


//filter data
class FilterDataSuccessLoaded extends AppStates {
  final List<FilterModel> kindOptions;
  final List<FilterModel> roomsOptions;
  final List<FilterModel> paymentOptions;
  final List<FilterModel> conditionOptions;
  final List<AppTextModel> appTexts;

  const FilterDataSuccessLoaded({
    required this.kindOptions,
    required this.roomsOptions,
    required this.paymentOptions,
    required this.conditionOptions,
    required this.appTexts,
  });
}

