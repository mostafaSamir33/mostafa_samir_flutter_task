import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:otex/core/resources/app_assets.dart';
import 'package:otex/core/resources/app_colors.dart';
import 'package:otex/core/resources/custom_text_styles.dart';
import 'package:otex/features/main_layer/view/screens/home_screen/widgets/home_screen_widgets/Custom_tab_bar.dart';
import 'package:otex/features/main_layer/view/screens/home_screen/widgets/home_screen_widgets/categories_tab_bar.dart';

import '../widgets/home_screen_widgets/product_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<String> tabs = ['كل العروض', 'ملابس', 'أكسسوارات', 'الكترونيات'];
  int selectedTabIndex = 0;

  List<Map<String, String>> categoriesTabs = [
    {'tabImage': AppAssets.manImage, 'tabText': 'موضة رجالى'},
    {'tabImage': AppAssets.watchImage, 'tabText': 'ساعات'},
    {'tabImage': AppAssets.phonesImage, 'tabText': 'موبايلات'},
    {'tabImage': AppAssets.makeupImage, 'tabText': 'منتجات تجميل'},
    {'tabImage': AppAssets.houseImage, 'tabText': 'منازل'},
  ];

  List<String> productCardsImages = [
    AppAssets.brownShirtImage,
    AppAssets.blackJacketImage,
    AppAssets.blackJacketImage,
    AppAssets.shoesImage,
    AppAssets.blackJacketImage,
    AppAssets.shoesImage,
    AppAssets.brownShirtImage,
    AppAssets.blackJacketImage,
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(child: SizedBox(height: 45.h)),
            SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 16.r,
                ).copyWith(bottom: 12.r),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        SvgPicture.asset(
                          AppAssets.arrowForwardIcon,
                          height: 24.h,
                          width: 24.w,
                          colorFilter: ColorFilter.mode(
                            AppColors.black.withValues(alpha: 0.5),
                            BlendMode.srcIn,
                          ),
                        ),
                        SizedBox(width: 4.w),
                        Text(
                          'الكل',
                          style: CustomTextStyles.style16w700.copyWith(
                            color: AppColors.black.withValues(alpha: 0.5),
                          ),
                        ),
                      ],
                    ),
                    Text(
                      'أستكشف العروض',
                      style: CustomTextStyles.style16w500.copyWith(
                        color: AppColors.darkBlue,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Directionality(
                textDirection: TextDirection.rtl,
                child: SizedBox(
                  height: 41.h,
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    padding: EdgeInsets.symmetric(horizontal: 16.r),
                    itemCount: tabs.length,
                    itemBuilder: (BuildContext context, int index) {
                      return GestureDetector(
                        onTap: () {
                          setState(() {
                            selectedTabIndex = index;
                          });
                        },
                        child: CustomTabBar(
                          tabText: tabs[index],
                          isActive: selectedTabIndex == index,
                        ),
                      );
                    },
                    separatorBuilder:
                        (BuildContext context, int index) =>
                            SizedBox(width: 8.w),
                  ),
                ),
              ),
            ),
            SliverToBoxAdapter(child: SizedBox(height: 33.h)),
            SliverToBoxAdapter(
              child: Directionality(
                textDirection: TextDirection.rtl,
                child: SizedBox(
                  height: 85.h,
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    padding: EdgeInsets.symmetric(
                      horizontal: 16.r,
                      // vertical: 33.r,
                    ),
                    itemCount: categoriesTabs.length,
                    itemBuilder: (BuildContext context, int index) {
                      return CategoriesTabBar(
                        tabImage: categoriesTabs[index]['tabImage']!,
                        tabText: categoriesTabs[index]['tabText']!,
                      );
                    },
                    separatorBuilder:
                        (BuildContext context, int index) =>
                            SizedBox(width: 12.w),
                  ),
                ),
              ),
            ),
            SliverToBoxAdapter(child: SizedBox(height: 33.h)),

            SliverPadding(
              padding: EdgeInsets.symmetric(horizontal: 16.r),
              sliver: SliverToBoxAdapter(
                child: Container(
                  height: 32.h,
                  width: double.infinity,
                  padding: EdgeInsets.symmetric(horizontal: 8.r, vertical: 4.r),
                  decoration: BoxDecoration(
                    color: AppColors.orange.withValues(alpha: 0.05),
                    borderRadius: BorderRadius.circular(4.r),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        'لأى عرض تطلبه دلوقتى !',
                        style: CustomTextStyles.style10w400.copyWith(
                          color: AppColors.darkBlue,
                        ),
                        textDirection: TextDirection.rtl,
                      ),
                      Row(
                        children: [
                          Text(
                            'شحن مجانى',
                            style: CustomTextStyles.style12w400.copyWith(
                              color: AppColors.green,
                            ),
                          ),
                          SizedBox(width: 4.w),
                          SvgPicture.asset(
                            AppAssets.rightIcon,
                            height: 24.h,
                            width: 24.w,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),

            SliverPadding(
              padding: EdgeInsets.only(
                top: 20.r,
                bottom: 28.r,
                left: 16.r,
                right: 16.r,
              ),
              sliver: SliverGrid.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 12.w,
                  mainAxisSpacing: 12.h,
                  childAspectRatio: 0.438.r,
                ),
                itemCount: productCardsImages.length,
                itemBuilder: (BuildContext context, int index) {
                  return ProductCard(
                    productCardImage: productCardsImages[index],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
