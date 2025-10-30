import 'package:otex/core/resources/app_assets.dart';
import 'package:otex/features/main_layer/model/models/app_icon_model.dart';
import 'package:otex/features/main_layer/model/repositories/app_icon_repository.dart';

import '../models/app_text_model.dart';
import '../models/category_model.dart';
import '../models/filter_model.dart';
import '../models/package_model.dart';
import '../models/product_model.dart';
import '../repositories/app_text_repository.dart';
import '../repositories/category_repository.dart';
import '../repositories/filter_repository.dart';
import '../repositories/package_repository.dart';
import '../repositories/product_repository.dart';

class DataInitializer {
  final CategoryRepository categoryRepository;
  final ProductRepository productRepository;
  final PackageRepository packageRepository;
  final FilterRepository filterRepository;
  final AppTextRepository appTextRepository;
  final AppIconRepository appIconRepository;

  DataInitializer({
    required this.categoryRepository,
    required this.productRepository,
    required this.packageRepository,
    required this.filterRepository,
    required this.appTextRepository,
    required this.appIconRepository,
  });

  Future<void> initializeAllData() async {
    final existingCategories = await categoryRepository.getAllCategories();
    if (existingCategories.isEmpty) {
      await _initializeCategories();
      await _initializeProducts();
      await _initializePackages();
      await _initializeFilterOptions();
      await _initializeAppTexts();
      await _initializeAppIcons();
    } else {
      return;
    }
  }

  Future<void> _initializeCategories() async {
    final existingCategories = await categoryRepository.getAllCategories();
    if (existingCategories.isNotEmpty) return;

    final categories = [
      CategoryModel(name: 'موضة رجالى', imagePath: AppAssets.manImage),
      CategoryModel(name: 'ساعات', imagePath: AppAssets.watchImage),
      CategoryModel(name: 'موبايلات', imagePath: AppAssets.phonesImage),
      CategoryModel(name: 'منتجات تجميل', imagePath: AppAssets.makeupImage),
      CategoryModel(name: 'منازل', imagePath: AppAssets.houseImage),
    ];

    await categoryRepository.insertCategories(categories);
  }

  Future<void> _initializeProducts() async {
    final products = [
      ProductModel(
        name: 'جاكيت من الصوف مناسب',
        originalPrice: '60,000,000',
        discountedPrice: '32,000,000',
        imagePath: AppAssets.brownShirtImage,
        categoryId: 1,
        salesCount: '3.3k+',
      ),
      ProductModel(
        name: 'جاكيت من الصوف مناسب',
        originalPrice: '60,000,000',
        discountedPrice: '32,000,000',
        imagePath: AppAssets.blackJacketImage,
        categoryId: 1,
        salesCount: '3.3k+',
      ),
      ProductModel(
        name: 'جاكيت من الصوف مناسب',
        originalPrice: '60,000,000',
        discountedPrice: '32,000,000',
        imagePath: AppAssets.blackJacketImage,
        categoryId: 1,
        salesCount: '3.3k+',
      ),
      ProductModel(
        name: 'جاكيت من الصوف مناسب',
        originalPrice: '60,000,000',
        discountedPrice: '32,000,000',
        imagePath: AppAssets.shoesImage,
        categoryId: 1,
        salesCount: '3.3k+',
      ),
      ProductModel(
        name: 'جاكيت من الصوف مناسب',
        originalPrice: '60,000,000',
        discountedPrice: '32,000,000',
        imagePath: AppAssets.blackJacketImage,
        categoryId: 1,
        salesCount: '3.3k+',
      ),
      ProductModel(
        name: 'جاكيت من الصوف مناسب',
        originalPrice: '60,000,000',
        discountedPrice: '32,000,000',
        imagePath: AppAssets.shoesImage,
        categoryId: 1,
        salesCount: '3.3k+',
      ),
      ProductModel(
        name: 'جاكيت من الصوف مناسب',
        originalPrice: '60,000,000',
        discountedPrice: '32,000,000',
        imagePath: AppAssets.brownShirtImage,
        categoryId: 1,
        salesCount: '3.3k+',
      ),
      ProductModel(
        name: 'جاكيت من الصوف مناسب',
        originalPrice: '60,000,000',
        discountedPrice: '32,000,000',
        imagePath: AppAssets.blackJacketImage,
        categoryId: 1,
        salesCount: '3.3k+',
      ),
    ];

    await productRepository.insertProducts(products);
  }

  Future<void> _initializePackages() async {
    final packages = [
      PackageModel(
        name: 'أساسية',
        price: '3,000',
        isFeatured: false,
        features: ['صلاحية الأعلان 30 يوم'],
      ),
      PackageModel(
        name: 'أكسترا',
        price: '3,000',
        viewsCount: 7,
        isFeatured: true,
        features: [
          'صلاحية الأعلان 30 يوم',
          'رفع لأعلى القائمة كل 3 أيام',
          'تثبيت فى مقاول صحى',
          '( خلال ال48 ساعة القادمة )',
        ],
      ),
      PackageModel(
        name: 'بلس',
        price: '3,000',
        viewsCount: 18,
        isFeatured: true,
        features: [
          'صلاحية الأعلان 30 يوم',
          'رفع لأعلى القائمة كل 2 يوم',
          'تثبيت فى مقاول صحى',
          '( خلال ال48 ساعة القادمة )',
          'ظهور فى كل محافظات مصر',
          'أعلان مميز',
          'تثبيت فى مقاول صحى فى الجهراء',
          'تثبيت فى مقاول صحى',
          '( خلال ال48 ساعة القادمة )',
        ],
        tapeText: 'أفضل قيمة مقابل سعر',
      ),
      PackageModel(
        name: 'سوبر',
        price: '3,000',
        viewsCount: 24,
        isFeatured: false,
        features: [
          'صلاحية الأعلان 30 يوم',
          'رفع لأعلى القائمة كل 2 يوم',
          'تثبيت فى مقاول صحى',
          '( خلال ال48 ساعة القادمة )',
          'ظهور فى كل محافظات مصر',
          'أعلان مميز',
          'تثبيت فى مقاول صحى فى الجهراء',
          'تثبيت فى مقاول صحى',
          '( خلال ال48 ساعة القادمة )',
        ],
        tapeText: 'أعلى مشاهدات',
      ),
    ];

    await packageRepository.insertPackages(packages);
  }

  Future<void> _initializeFilterOptions() async {
    final allFilterOptions = [
      FilterModel(filterType: 'kind', optionName: 'الكل'),
      FilterModel(filterType: 'kind', optionName: 'توين هاوس'),
      FilterModel(filterType: 'kind', optionName: 'فيلا منفصلة'),
      FilterModel(filterType: 'kind', optionName: 'تاون هاوس'),
      FilterModel(filterType: 'number_of_rooms', optionName: '4 غرف'),
      FilterModel(filterType: 'number_of_rooms', optionName: '5 غرف+'),
      FilterModel(filterType: 'number_of_rooms', optionName: 'الكل'),
      FilterModel(filterType: 'number_of_rooms', optionName: 'غرفتين'),
      FilterModel(filterType: 'number_of_rooms', optionName: '3 غرف'),
      FilterModel(filterType: 'payment_method', optionName: 'أى'),
      FilterModel(filterType: 'payment_method', optionName: 'تقسيط'),
      FilterModel(filterType: 'payment_method', optionName: 'كاش'),
      FilterModel(filterType: 'property_condition', optionName: 'أى'),
      FilterModel(filterType: 'property_condition', optionName: 'جاهز'),
      FilterModel(filterType: 'property_condition', optionName: 'قيد الأنشاء'),
    ];

    await filterRepository.insertFilterOptions(allFilterOptions);
  }

  Future<void> _initializeAppTexts() async {
    // bottom Nav bar Texts
    final bottomNavTexts = [
      // add to home screen
      AppTextModel(
        screenName: 'home',
        textKey: 'home_layer',
        textValue: 'الرئيسية',
      ),
      AppTextModel(
        screenName: 'home',
        textKey: 'chat_layer',
        textValue: 'محادثة',
      ),
      AppTextModel(
        screenName: 'home',
        textKey: 'add_ads',
        textValue: 'أضف أعلان',
      ),
      AppTextModel(
        screenName: 'home',
        textKey: 'user_ads',
        textValue: 'أعلاناتى',
      ),
      AppTextModel(
        screenName: 'home',
        textKey: 'user_profile',
        textValue: 'حسابى',
      ),
      // add to packages screen
      AppTextModel(
        screenName: 'packages',
        textKey: 'home_layer',
        textValue: 'الرئيسية',
      ),
      AppTextModel(
        screenName: 'packages',
        textKey: 'chat_layer',
        textValue: 'محادثة',
      ),
      AppTextModel(
        screenName: 'packages',
        textKey: 'add_ads',
        textValue: 'أضف أعلان',
      ),
      AppTextModel(
        screenName: 'packages',
        textKey: 'user_ads',
        textValue: 'أعلاناتى',
      ),
      AppTextModel(
        screenName: 'packages',
        textKey: 'user_profile',
        textValue: 'حسابى',
      ),
    ];

    // Home Screen Texts
    final homeTexts = [
      AppTextModel(
        screenName: 'home',
        textKey: 'explore_offers',
        textValue: 'أستكشف العروض',
      ),
      AppTextModel(screenName: 'home', textKey: 'all', textValue: 'الكل'),
      AppTextModel(
        screenName: 'home',
        textKey: 'free_shipping',
        textValue: 'شحن مجانى',
      ),
      AppTextModel(
        screenName: 'home',
        textKey: 'order',
        textValue: 'لأى عرض تطلبه دلوقتى !',
      ),
      AppTextModel(
        screenName: 'home',
        textKey: 'all_offers',
        textValue: 'كل العروض',
      ),
      AppTextModel(screenName: 'home', textKey: 'clothes', textValue: 'ملابس'),
      AppTextModel(
        screenName: 'home',
        textKey: 'accessories',
        textValue: 'أكسسوارات',
      ),
      AppTextModel(
        screenName: 'home',
        textKey: 'electronics',
        textValue: 'الكترونيات',
      ),
    ];

    // Packages Screen Texts
    final packagesTexts = [
      AppTextModel(
        screenName: 'packages',
        textKey: 'choose_packages',
        textValue: 'أختر الباقات اللى تناسبك',
      ),
      AppTextModel(
        screenName: 'packages',
        textKey: 'choose_description',
        textValue: 'أختار من باقات التمييز بل أسفل اللى تناسب أحتياجاتك',
      ),
      AppTextModel(
        screenName: 'packages',
        textKey: 'double_number',
        textValue: 'ضعف عدد',
      ),
      AppTextModel(
        screenName: 'packages',
        textKey: 'views',
        textValue: 'المشاهدات',
      ),
      AppTextModel(
        screenName: 'packages',
        textKey: 'custom_packages',
        textValue: 'باقات مخصصة لك',
      ),
      AppTextModel(
        screenName: 'packages',
        textKey: 'contact_us',
        textValue: 'تواصل معنا لأختيار الباقة المناسبة لك',
      ),
      AppTextModel(
        screenName: 'packages',
        textKey: 'contact_sales',
        textValue: 'فريق المبيعات',
      ),
      AppTextModel(
        screenName: 'packages',
        textKey: 'next',
        textValue: 'التالى',
      ),
    ];

    // Filter Screen Texts
    final filterTexts = [
      AppTextModel(
        screenName: 'filter',
        textKey: 'filter_title',
        textValue: 'فلترة',
      ),
      AppTextModel(
        screenName: 'filter',
        textKey: 'reset',
        textValue: 'رجوع للأفتراضى',
      ),
      AppTextModel(
        screenName: 'filter',
        textKey: 'Category',
        textValue: 'الفئة',
      ),
      AppTextModel(
        screenName: 'filter',
        textKey: 'real_estate',
        textValue: 'عقارات',
      ),
      AppTextModel(
        screenName: 'filter',
        textKey: 'villas_for_sale',
        textValue: 'فلل البيع',
      ),
      AppTextModel(screenName: 'filter', textKey: 'change', textValue: 'تغيير'),
      AppTextModel(
        screenName: 'filter',
        textKey: 'location',
        textValue: 'الموقع',
      ),
      AppTextModel(screenName: 'filter', textKey: 'egypt', textValue: 'مصر'),
      AppTextModel(
        screenName: 'filter',
        textKey: 'monthly_installments',
        textValue: 'الأقساط الشهرية',
      ),
      AppTextModel(screenName: 'filter', textKey: 'type', textValue: 'النوع'),
      AppTextModel(
        screenName: 'filter',
        textKey: 'rooms_count',
        textValue: 'عدد الغرف',
      ),
      AppTextModel(screenName: 'filter', textKey: 'price', textValue: 'السعر'),
      AppTextModel(
        screenName: 'filter',
        textKey: 'lowest_price',
        textValue: 'أقل سعر',
      ),
      AppTextModel(
        screenName: 'filter',
        textKey: 'maximum_price',
        textValue: 'أقصى سعر',
      ),
      AppTextModel(
        screenName: 'filter',
        textKey: 'payment_method',
        textValue: 'طريقة الدفع',
      ),
      AppTextModel(
        screenName: 'filter',
        textKey: 'property_condition',
        textValue: 'حالة العقار',
      ),
      AppTextModel(
        screenName: 'filter',
        textKey: 'view_results',
        textValue: 'شاهد 10,000+ نتائج',
      ),
    ];

    await appTextRepository.insertAppTexts([
      ...bottomNavTexts,
      ...homeTexts,
      ...packagesTexts,
      ...filterTexts,
    ]);
  }

  Future<void> _initializeAppIcons() async {
    //bottom nav bar icons
    final bottomNavIcons = [
      //add to home screen
      AppIconModel(
        screenName: 'home',
        iconKey: 'homeTabIcon',
        iconPath: AppAssets.homeTabIcon,
      ),
      AppIconModel(
        screenName: 'home',
        iconKey: 'chatTabIcon',
        iconPath: AppAssets.chatTabIcon,
      ),
      AppIconModel(
        screenName: 'home',
        iconKey: 'addAdsTabIcon',
        iconPath: AppAssets.addAdsTabIcon,
      ),
      AppIconModel(
        screenName: 'home',
        iconKey: 'userAdsTabIcon',
        iconPath: AppAssets.userAdsTabIcon,
      ),
      AppIconModel(
        screenName: 'home',
        iconKey: 'userAccountTabIcon',
        iconPath: AppAssets.userAccountTabIcon,
      ),
      AppIconModel(
        screenName: 'home',
        iconKey: 'bottomNavBarTabIndicator',
        iconPath: AppAssets.bottomNavBarTabIndicator,
      ),

      //add to packages screen
      AppIconModel(
        screenName: 'packages',
        iconKey: 'homeTabIcon',
        iconPath: AppAssets.homeTabIcon,
      ),
      AppIconModel(
        screenName: 'packages',
        iconKey: 'chatTabIcon',
        iconPath: AppAssets.chatTabIcon,
      ),
      AppIconModel(
        screenName: 'packages',
        iconKey: 'addAdsTabIcon',
        iconPath: AppAssets.addAdsTabIcon,
      ),
      AppIconModel(
        screenName: 'packages',
        iconKey: 'userAdsTabIcon',
        iconPath: AppAssets.userAdsTabIcon,
      ),
      AppIconModel(
        screenName: 'packages',
        iconKey: 'userAccountTabIcon',
        iconPath: AppAssets.userAccountTabIcon,
      ),
      AppIconModel(
        screenName: 'packages',
        iconKey: 'bottomNavBarTabIndicator',
        iconPath: AppAssets.bottomNavBarTabIndicator,
      ),
    ];

    //home screen icons
    final homeScreenIcons = [
      AppIconModel(
        screenName: 'home',
        iconKey: 'arrowForwardIcon',
        iconPath: AppAssets.arrowForwardIcon,
      ),
      AppIconModel(
        screenName: 'home',
        iconKey: 'rightIcon',
        iconPath: AppAssets.rightIcon,
      ),
      AppIconModel(
        screenName: 'home',
        iconKey: 'percentIcon',
        iconPath: AppAssets.percentIcon,
      ),
      AppIconModel(
        screenName: 'home',
        iconKey: 'heartIcon',
        iconPath: AppAssets.heartIcon,
      ),
      AppIconModel(
        screenName: 'home',
        iconKey: 'fireIcon',
        iconPath: AppAssets.fireIcon,
      ),
      AppIconModel(
        screenName: 'home',
        iconKey: 'cartIcon',
        iconPath: AppAssets.cartIcon,
      ),
      AppIconModel(
        screenName: 'home',
        iconKey: 'rightPadgeIcon',
        iconPath: AppAssets.rightPadgeIcon,
      ),
      AppIconModel(
        screenName: 'home',
        iconKey: 'talatMostafaLogoIcon',
        iconPath: AppAssets.talatMostafaLogoIcon,
      ),
    ];

    //packages screen icons
    final packagesScreenIcons = [
      AppIconModel(
        screenName: 'packages',
        iconKey: 'smallArrowBackIcon',
        iconPath: AppAssets.smallArrowBackIcon,
      ),
      AppIconModel(
        screenName: 'packages',
        iconKey: 'earthIcon',
        iconPath: AppAssets.earthIcon,
      ),
      AppIconModel(
        screenName: 'packages',
        iconKey: 'pinIcon',
        iconPath: AppAssets.pinIcon,
      ),
      AppIconModel(
        screenName: 'packages',
        iconKey: 'rocketIcon',
        iconPath: AppAssets.rocketIcon,
      ),
      AppIconModel(
        screenName: 'packages',
        iconKey: 'specialAdsPadgeIcon',
        iconPath: AppAssets.specialAdsPadgeIcon,
      ),
      AppIconModel(
        screenName: 'packages',
        iconKey: 'timeIcon',
        iconPath: AppAssets.timeIcon,
      ),
      AppIconModel(
        screenName: 'packages',
        iconKey: 'arrowForwardIcon',
        iconPath: AppAssets.arrowForwardIcon,
      ),
    ];

    //filter screen icons
    final filterScreenIcons = [
      AppIconModel(
        screenName: 'filter',
        iconKey: 'closeIcon',
        iconPath: AppAssets.closeIcon,
      ),
      AppIconModel(
        screenName: 'filter',
        iconKey: 'handCarryHouseIcon',
        iconPath: AppAssets.handCarryHouseIcon,
      ),
      AppIconModel(
        screenName: 'filter',
        iconKey: 'locationIcon',
        iconPath: AppAssets.locationIcon,
      ),
      AppIconModel(
        screenName: 'filter',
        iconKey: 'smallArrowForwardIcon',
        iconPath: AppAssets.smallArrowForwardIcon,
      ),
    ];

    await appIconRepository.insertIcons([
      ...bottomNavIcons,
      ...homeScreenIcons,
      ...packagesScreenIcons,
      ...filterScreenIcons,
    ]);
  }
}
