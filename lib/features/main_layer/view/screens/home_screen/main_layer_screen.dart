import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:otex/core/resources/app_assets.dart';
import 'package:otex/features/main_layer/view/screens/home_screen/tabs/add_ads_screen.dart';
import 'package:otex/features/main_layer/view/screens/home_screen/tabs/chat_screen.dart';
import 'package:otex/features/main_layer/view/screens/home_screen/tabs/home_screen.dart';
import 'package:otex/features/main_layer/view/screens/home_screen/tabs/user_ads_screen.dart';
import 'package:otex/features/main_layer/view/screens/home_screen/tabs/user_profile_screen.dart';

import '../../../../../core/resources/app_colors.dart';
import '../../../../../core/resources/app_general_methods.dart';
import '../../../../../core/resources/custom_text_styles.dart';
import '../../../model/models/app_text_model.dart';
import '../../../view_model/cubit/app_cubit.dart';
import '../../../view_model/cubit/app_cubit_states.dart';

class MainLayerScreen extends StatefulWidget {
  static const String routeName = '/HomeScreen';

  const MainLayerScreen({super.key});

  @override
  State<MainLayerScreen> createState() => _MainLayerScreenState();
}

class _MainLayerScreenState extends State<MainLayerScreen> {
  final List<Widget> tabs = [
    const HomeScreen(),
    const ChatScreen(),
    const AddAdsScreen(),
    const UserAdsScreen(),
    const UserProfileScreen(),
  ];

  int currentIndex = 0;

  List<AppTextModel> _cachedAppTexts = [];

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {
        if (state is HomeDataSuccessLoaded) {
          _cachedAppTexts = state.appTexts;
        } else if (state is PackagesDataSuccessLoaded) {
          _cachedAppTexts = state.appTexts;
        }
      },
      builder: (context, state) {
        if (state is HomeDataSuccessLoaded) {
          _cachedAppTexts = state.appTexts;
        } else if (state is PackagesDataSuccessLoaded) {
          _cachedAppTexts = state.appTexts;
        }

        return Scaffold(
          body: _buildBody(state: state),
          bottomNavigationBar: Directionality(
            textDirection: TextDirection.rtl,
            child: _buildCustomBottomNavBar(),
          ),
        );
      },
    );
  }

  Future<void> _onTabSelected({required int index}) async {
    setState(() {
      currentIndex = index;
    });

    final cubit = context.read<AppCubit>();
    switch (index) {
      case 0: // Home
        await cubit.loadHomeData();
        break;
      case 4: // Profile/Packages
        await cubit.loadPackagesData();
        break;
    }
  }

  Widget _buildBody({required AppStates state}) {
    if (state is AppDataError) {
      return Center(
        child: Text(
          'Error: ${state.message}',
          style: CustomTextStyles.style16w500.copyWith(color: AppColors.black),
          textAlign: TextAlign.center,
        ),
      );
    } else if (state is HomeDataSuccessLoaded ||
        state is PackagesDataSuccessLoaded) {
      return IndexedStack(index: currentIndex, children: tabs);
    }
    return Center(child: CircularProgressIndicator(color: AppColors.blue));
  }

  Widget _buildCustomBottomNavBar() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border(
          top: BorderSide(
            color: AppColors.black.withValues(alpha: 0.1),
            width: 1.w,
          ),
        ),
      ),
      child: Container(
        height: 62.h,
        margin: EdgeInsets.only(top: 8.r),
        decoration: BoxDecoration(color: Colors.white),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 11.5.r),
          child: Row(
            spacing: 8.w,
            children: [
              _buildNavItem(
                0,
                AppAssets.homeTabIcon,
                _getNavText(textKey: 'home_layer'),
              ),
              _buildNavItem(
                1,
                AppAssets.chatTabIcon,
                _getNavText(textKey: 'chat_layer'),
              ),
              _buildNavItem(
                2,
                AppAssets.addAdsTabIcon,
                _getNavText(textKey: 'add_ads'),
              ),
              _buildNavItem(
                3,
                AppAssets.userAdsTabIcon,
                _getNavText(textKey: 'user_ads'),
              ),
              _buildNavItem(
                4,
                AppAssets.userAccountTabIcon,
                _getNavText(textKey: 'user_profile'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  String _getNavText({required String textKey}) {
    if (_cachedAppTexts.isNotEmpty) {
      return AppGeneralMethods.getTextByKey(
        appTexts: _cachedAppTexts,
        textKey: textKey,
      );
    } else {
      //Fallback texts to prevent showing text keys
      return _getFallbackText(textKey);
    }
  }

  String _getFallbackText(String textKey) {
    switch (textKey) {
      case 'home_layer':
        return 'الرئيسية';
      case 'chat_layer':
        return 'محادثة';
      case 'add_ads':
        return 'أضف أعلان';
      case 'user_ads':
        return 'أعلاناتى';
      case 'user_profile':
        return 'حسابى';
      default:
        return textKey;
    }
  }

  Widget _buildNavItem(int index, String iconPath, String label) {
    bool isSelected = currentIndex == index;
    bool isAddAdsTab = index == 2;

    Color iconColor =
        isAddAdsTab
            ? AppColors.blue
            : (isSelected
                ? AppColors.darkBlue
                : AppColors.darkBlue.withValues(alpha: 0.5));

    Color labelColor =
        isAddAdsTab
            ? AppColors.blue
            : (isSelected
                ? AppColors.darkBlue
                : AppColors.darkBlue.withValues(alpha: 0.5));

    Color indicatorColor = isAddAdsTab ? AppColors.blue : AppColors.darkBlue;

    return Expanded(
      child: InkWell(
        onTap: () {
          _onTabSelected(index: index);
        },
        child: Stack(
          alignment: Alignment.center,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                SvgPicture.asset(
                  iconPath,
                  height: 24.h,
                  width: 24.w,
                  colorFilter: ColorFilter.mode(iconColor, BlendMode.srcIn),
                ),
                SizedBox(height: 4.h),
                Text(
                  label,
                  style: CustomTextStyles.style12w500.copyWith(
                    color: labelColor,
                  ),
                ),
                SizedBox(height: 4.h),
              ],
            ),
            if (isSelected)
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: SvgPicture.asset(
                  AppAssets.bottomNavBarTabIndicator,
                  width: double.infinity,
                  height: 46.h,
                  colorFilter: ColorFilter.mode(
                    indicatorColor,
                    BlendMode.srcIn,
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
