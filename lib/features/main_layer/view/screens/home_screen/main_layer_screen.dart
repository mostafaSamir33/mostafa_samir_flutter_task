import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:otex/core/resources/app_assets.dart';
import 'package:otex/features/main_layer/model/models/app_icon_model.dart';
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
  final PageController _pageController = PageController();

  int currentIndex = 0;

  final List<Widget> tabs = [
    const HomeScreen(),
    const ChatScreen(),
    const AddAdsScreen(),
    const UserAdsScreen(),
    const UserProfileScreen(),
  ];

  List<AppTextModel> _cachedAppTexts = [];
  List<AppIconModel> _cachedAppIcons = [];

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppCubit, AppStates>(
      builder: (context, state) {
        if (state is HomeDataSuccessLoaded) {
          _cachedAppTexts = state.appTexts;
          _cachedAppIcons = state.appIcons;
        } else if (state is PackagesDataSuccessLoaded) {
          _cachedAppTexts = state.appTexts;
          _cachedAppIcons = state.appIcons;
        }

        return Scaffold(
          body: PageView(
            controller: _pageController,
            physics: const NeverScrollableScrollPhysics(),
            children: tabs,
            onPageChanged: (index) {
              setState(() {
                currentIndex = index;
              });
            },
          ),
          bottomNavigationBar: Directionality(
            textDirection: TextDirection.rtl,
            child: _buildCustomBottomNavBar(),
          ),
        );
      },
    );
  }

  void _onTabSelected({required int index}) {
    setState(() {
      currentIndex = index;
    });
    _pageController.jumpToPage(index);
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
                _getNavIcon(iconKey: 'homeTabIcon'),
                _getNavText(textKey: 'home_layer'),
              ),
              _buildNavItem(
                1,
                _getNavIcon(iconKey: 'chatTabIcon'),
                _getNavText(textKey: 'chat_layer'),
              ),
              _buildNavItem(
                2,
                _getNavIcon(iconKey: 'addAdsTabIcon'),
                _getNavText(textKey: 'add_ads'),
              ),
              _buildNavItem(
                3,
                _getNavIcon(iconKey: 'userAdsTabIcon'),
                _getNavText(textKey: 'user_ads'),
              ),
              _buildNavItem(
                4,
                _getNavIcon(iconKey: 'userAccountTabIcon'),
                _getNavText(textKey: 'user_profile'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  String _getNavIcon({required String iconKey}) {
    if (_cachedAppIcons.isNotEmpty) {
      return AppGeneralMethods.getIconByKey(
        appIcons: _cachedAppIcons,
        iconKey: iconKey,
      );
    } else {
      //Fallback icons to prevent showing close icon
      return _getFallbackIcon(iconKey);
    }
  }

  String _getFallbackIcon(String iconKey) {
    switch (iconKey) {
      case 'homeTabIcon':
        return AppAssets.homeTabIcon;
      case 'chatTabIcon':
        return AppAssets.chatTabIcon;
      case 'addAdsTabIcon':
        return AppAssets.addAdsTabIcon;
      case 'userAdsTabIcon':
        return AppAssets.userAdsTabIcon;
      case 'userAccountTabIcon':
        return AppAssets.userAccountTabIcon;
      case 'bottomNavBarTabIndicator':
        return AppAssets.bottomNavBarTabIndicator;
      default:
        return iconKey;
    }
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
        onTap: () => _onTabSelected(index: index),
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
                  _getNavIcon(iconKey: 'bottomNavBarTabIndicator'),
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
