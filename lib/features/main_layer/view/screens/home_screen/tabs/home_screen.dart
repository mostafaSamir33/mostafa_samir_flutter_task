import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:otex/core/resources/app_colors.dart';
import 'package:otex/core/resources/app_general_methods.dart';
import 'package:otex/core/resources/custom_text_styles.dart';
import 'package:otex/features/main_layer/view/screens/filter_screen.dart';
import 'package:otex/features/main_layer/view/screens/home_screen/widgets/home_screen_widgets/Custom_tab_bar.dart';
import 'package:otex/features/main_layer/view/screens/home_screen/widgets/home_screen_widgets/categories_tab_bar.dart';

import '../../../../../../main.dart';
import '../../../../model/models/app_text_model.dart';
import '../../../../view_model/cubit/app_cubit.dart';
import '../../../../view_model/cubit/app_cubit_states.dart';
import '../widgets/home_screen_widgets/product_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with RouteAware {
  int selectedTabIndex = 0;

  @override
  void initState() {
    super.initState();
    _loadHomeData();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    routeObserver.subscribe(this, ModalRoute.of(context)! as PageRoute);
  }

  @override
  void dispose() {
    routeObserver.unsubscribe(this);
    super.dispose();
  }

  @override
  void didPopNext() {
    final cubit = context.read<AppCubit>();
    if (cubit.state is! HomeDataSuccessLoaded) {
      cubit.loadHomeData();
    }
  }

  void _loadHomeData() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<AppCubit>().loadHomeData();
    });
  }

  List<String> _getTabTexts({required List<AppTextModel> appTexts}) {
    return [
      AppGeneralMethods.getTextByKey(appTexts: appTexts, textKey: 'all_offers'),
      AppGeneralMethods.getTextByKey(appTexts: appTexts, textKey: 'clothes'),
      AppGeneralMethods.getTextByKey(
        appTexts: appTexts,
        textKey: 'accessories',
      ),
      AppGeneralMethods.getTextByKey(
        appTexts: appTexts,
        textKey: 'electronics',
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppCubit, AppStates>(
      builder: (context, state) {
        if (state is AppDataError) {
          return Center(
            child: Text(
              'Error: ${state.message}',
              style: CustomTextStyles.style16w500.copyWith(
                color: AppColors.black,
              ),
              textAlign: TextAlign.center,
            ),
          );
        } else if (state is HomeDataSuccessLoaded) {
          final tabs = _getTabTexts(appTexts: state.appTexts);
          return Scaffold(
            body: SafeArea(
              child: CustomScrollView(
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
                          GestureDetector(
                            onTap: () {
                              Navigator.of(
                                context,
                              ).pushNamed(FilterScreen.routeName);
                            },
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                SvgPicture.asset(
                                  AppGeneralMethods.getIconByKey(
                                    appIcons: state.appIcons,
                                    iconKey: 'arrowForwardIcon',
                                  ),
                                  height: 24.h,
                                  width: 24.w,
                                  colorFilter: ColorFilter.mode(
                                    AppColors.black.withValues(alpha: 0.5),
                                    BlendMode.srcIn,
                                  ),
                                ),
                                SizedBox(width: 4.w),
                                Text(
                                  AppGeneralMethods.getTextByKey(
                                    appTexts: state.appTexts,
                                    textKey: 'all',
                                  ),
                                  style: CustomTextStyles.style16w700.copyWith(
                                    color: AppColors.black.withValues(
                                      alpha: 0.5,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Text(
                            AppGeneralMethods.getTextByKey(
                              appTexts: state.appTexts,
                              textKey: 'explore_offers',
                            ),
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
                        height: 42.h,
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
                          padding: EdgeInsets.symmetric(horizontal: 16.r),
                          itemCount: state.categories.length,
                          itemBuilder: (BuildContext context, int index) {
                            final category = state.categories[index];
                            return CategoriesTabBar(
                              tabImage: category.imagePath,
                              tabText: category.name,
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
                        padding: EdgeInsets.symmetric(
                          horizontal: 8.r,
                          vertical: 4.r,
                        ),
                        decoration: BoxDecoration(
                          color: AppColors.orange.withValues(alpha: 0.05),
                          borderRadius: BorderRadius.circular(4.r),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              AppGeneralMethods.getTextByKey(
                                appTexts: state.appTexts,
                                textKey: 'order',
                              ),
                              style: CustomTextStyles.style10w400.copyWith(
                                color: AppColors.darkBlue,
                              ),
                              textDirection: TextDirection.rtl,
                            ),
                            Row(
                              children: [
                                Text(
                                  AppGeneralMethods.getTextByKey(
                                    appTexts: state.appTexts,
                                    textKey: 'free_shipping',
                                  ),
                                  style: CustomTextStyles.style12w400.copyWith(
                                    color: AppColors.green,
                                  ),
                                ),
                                SizedBox(width: 4.w),
                                SvgPicture.asset(
                                  AppGeneralMethods.getIconByKey(
                                    appIcons: state.appIcons,
                                    iconKey: 'rightIcon',
                                  ),
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
                      itemCount: state.products.length,
                      itemBuilder: (BuildContext context, int index) {
                        final product = state.products[index];
                        return ProductCard(
                          productModel: product,
                          appIcons: state.appIcons,
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          );
        }
        return Center(child: CircularProgressIndicator(color: AppColors.blue));
      },
    );
  }
}
