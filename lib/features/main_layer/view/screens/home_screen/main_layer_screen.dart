import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:otex/core/resources/app_assets.dart';
import 'package:otex/features/main_layer/view/screens/home_screen/tabs/add_ads_screen.dart';
import 'package:otex/features/main_layer/view/screens/home_screen/tabs/chat_screen.dart';
import 'package:otex/features/main_layer/view/screens/home_screen/tabs/home_screen.dart';
import 'package:otex/features/main_layer/view/screens/home_screen/tabs/user_account_screen.dart';
import 'package:otex/features/main_layer/view/screens/home_screen/tabs/user_ads_screen.dart';

import '../../../../../core/resources/app_colors.dart';
import '../../../../../core/resources/custom_text_styles.dart';

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
    const UserAccountScreen(),
  ];
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(index: currentIndex, children: tabs),
      bottomNavigationBar: Directionality(
        textDirection: TextDirection.rtl,
        child: _buildCustomBottomNavBar(),
      ),
    );
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
              _buildNavItem(0, AppAssets.homeTabIcon, 'الرئيسية'),
              _buildNavItem(1, AppAssets.chatTabIcon, 'محادثة'),
              _buildNavItem(2, AppAssets.addAdsTabIcon, 'أضف أعلان'),
              _buildNavItem(3, AppAssets.userAdsTabIcon, 'أعلاناتي'),
              _buildNavItem(4, AppAssets.userAccountTabIcon, 'حسابي'),
            ],
          ),
        ),
      ),
    );
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
          setState(() {
            currentIndex = index;
          });
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
