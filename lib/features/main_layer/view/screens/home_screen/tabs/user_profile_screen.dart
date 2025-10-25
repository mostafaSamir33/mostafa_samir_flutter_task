import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:otex/core/resources/app_assets.dart';
import 'package:otex/core/resources/app_colors.dart';
import 'package:otex/core/resources/custom_text_styles.dart';

import '../widgets/user_profile_screen_widgets/bouquet_card.dart';

class UserProfileScreen extends StatefulWidget {
  const UserProfileScreen({super.key});

  @override
  State<UserProfileScreen> createState() => _UserProfileScreenState();
}

class _UserProfileScreenState extends State<UserProfileScreen> {
  Widget _extraAndPlusBouquetDetails() {
    return Column(
      spacing: 8.h,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Flexible(
              child: Text(
                'صلاحية الأعلان 30 يوم',
                style: CustomTextStyles.style14w500.copyWith(
                  color: AppColors.darkBlue,
                  height: 0,
                ),
                textDirection: TextDirection.rtl,
              ),
            ),
            SizedBox(width: 8.w),
            SvgPicture.asset(
              AppAssets.timeIcon,
              height: 24.h,
              width: 24.w,
              colorFilter: ColorFilter.mode(
                AppColors.darkBlue,
                BlendMode.srcIn,
              ),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Flexible(
              child: Text(
                'رفع لأعلى القائمة كل 2 يوم',
                style: CustomTextStyles.style14w500.copyWith(
                  color: AppColors.darkBlue,
                  height: 0,
                ),
                textDirection: TextDirection.rtl,
              ),
            ),
            SizedBox(width: 8.w),
            SvgPicture.asset(
              AppAssets.rocketIcon,
              height: 24.h,
              width: 24.w,
              colorFilter: ColorFilter.mode(
                AppColors.darkBlue,
                BlendMode.srcIn,
              ),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Flexible(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    'تثبيت فى مقاول صحى',
                    style: CustomTextStyles.style14w500.copyWith(
                      color: AppColors.darkBlue,
                      height: 0,
                    ),
                    textDirection: TextDirection.rtl,
                  ),
                  Text(
                    '( خلال ال48 ساعة القادمة )',
                    style: CustomTextStyles.style14w500.copyWith(
                      color: AppColors.redWatermelon,
                      height: 0,
                    ),
                    textDirection: TextDirection.rtl,
                  ),
                ],
              ),
            ),
            SizedBox(width: 8.w),
            SvgPicture.asset(
              AppAssets.pinIcon,
              height: 24.h,
              width: 24.w,
              colorFilter: ColorFilter.mode(
                AppColors.darkBlue,
                BlendMode.srcIn,
              ),
            ),
          ],
        ),

        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Flexible(
              child: Text(
                'ظهور فى كل محافظات مصر',
                style: CustomTextStyles.style14w500.copyWith(
                  color: AppColors.darkBlue,
                  height: 0,
                ),
                textDirection: TextDirection.rtl,
              ),
            ),
            SizedBox(width: 8.w),
            SvgPicture.asset(
              AppAssets.earthIcon,
              height: 24.h,
              width: 24.w,
              colorFilter: ColorFilter.mode(
                AppColors.darkBlue,
                BlendMode.srcIn,
              ),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Flexible(
              child: Text(
                'أعلان مميز',
                style: CustomTextStyles.style14w400.copyWith(
                  color: AppColors.darkBlue,
                  height: 0,
                ),
                textDirection: TextDirection.rtl,
              ),
            ),
            SizedBox(width: 8.w),
            SvgPicture.asset(
              AppAssets.specialAdsPadgeIcon,
              height: 24.h,
              width: 24.w,
              colorFilter: ColorFilter.mode(
                AppColors.darkBlue,
                BlendMode.srcIn,
              ),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Flexible(
              child: Text(
                'تثبيت فى مقاول صحى فى الجهراء',
                style: CustomTextStyles.style14w500.copyWith(
                  color: AppColors.darkBlue,
                  height: 0,
                ),
                textDirection: TextDirection.rtl,
              ),
            ),
            SizedBox(width: 8.w),
            SvgPicture.asset(
              AppAssets.pinIcon,
              height: 24.h,
              width: 24.w,
              colorFilter: ColorFilter.mode(
                AppColors.darkBlue,
                BlendMode.srcIn,
              ),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Flexible(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    'تثبيت فى مقاول صحى',
                    style: CustomTextStyles.style14w500.copyWith(
                      color: AppColors.darkBlue,
                      height: 0,
                    ),
                    textDirection: TextDirection.rtl,
                  ),
                  Text(
                    '( خلال ال48 ساعة القادمة )',
                    style: CustomTextStyles.style14w500.copyWith(
                      color: AppColors.redWatermelon,
                      height: 0,
                    ),
                    textDirection: TextDirection.rtl,
                  ),
                ],
              ),
            ),
            SizedBox(width: 8.w),
            SvgPicture.asset(
              AppAssets.pinIcon,
              height: 24.h,
              width: 24.w,
              colorFilter: ColorFilter.mode(
                AppColors.darkBlue,
                BlendMode.srcIn,
              ),
            ),
          ],
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          padding: EdgeInsets.only(top: 16.r, bottom: 12.r),
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.r),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Flexible(
                    child: Text(
                      'أختر الباقات اللى تناسبك',
                      style: CustomTextStyles.style24w500.copyWith(
                        color: AppColors.darkBlue,
                      ),
                      textDirection: TextDirection.rtl,
                    ),
                  ),
                  SizedBox(width: 12.w),
                  SvgPicture.asset(
                    AppAssets.smallArrowBackIcon,
                    height: 24.h,
                    width: 24.w,
                    colorFilter: ColorFilter.mode(
                      AppColors.darkBlue,
                      BlendMode.srcIn,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 12.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.r),
              child: Text(
                'أختار من باقات التمييز بل أسفل اللى تناسب أحتياجاتك',
                style: CustomTextStyles.style14w400.copyWith(
                  color: AppColors.darkBlue.withValues(alpha: 0.5),
                ),
                textDirection: TextDirection.rtl,
              ),
            ),
            SizedBox(height: 20.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.r),
              child: BouquetCard(
                bouquetName: 'أساسية',
                bouquetDetails: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Flexible(
                      child: Text(
                        'صلاحية الأعلان 30 يوم',
                        style: CustomTextStyles.style14w500.copyWith(
                          color: AppColors.darkBlue,
                          height: 0,
                        ),
                        textDirection: TextDirection.rtl,
                      ),
                    ),
                    SizedBox(width: 8.w),
                    SvgPicture.asset(
                      AppAssets.timeIcon,
                      height: 24.h,
                      width: 24.w,
                      colorFilter: ColorFilter.mode(
                        AppColors.darkBlue,
                        BlendMode.srcIn,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 24.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.r),
              child: BouquetCard(
                bouquetName: 'أكسترا',
                initialValueOfCheckBox: true,
                doubleViewsContainerNumber: 7,
                bouquetDetails: Column(
                  spacing: 8.h,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Flexible(
                          child: Text(
                            'صلاحية الأعلان 30 يوم',
                            style: CustomTextStyles.style14w500.copyWith(
                              color: AppColors.darkBlue,
                              height: 0,
                            ),
                            textDirection: TextDirection.rtl,
                          ),
                        ),
                        SizedBox(width: 8.w),
                        SvgPicture.asset(
                          AppAssets.timeIcon,
                          height: 24.h,
                          width: 24.w,
                          colorFilter: ColorFilter.mode(
                            AppColors.darkBlue,
                            BlendMode.srcIn,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Flexible(
                          child: Text(
                            'رفع لأعلى القائمة كل 3 أيام',
                            style: CustomTextStyles.style14w500.copyWith(
                              color: AppColors.darkBlue,
                              height: 0,
                            ),
                            textDirection: TextDirection.rtl,
                          ),
                        ),
                        SizedBox(width: 8.w),
                        SvgPicture.asset(
                          AppAssets.rocketIcon,
                          height: 24.h,
                          width: 24.w,
                          colorFilter: ColorFilter.mode(
                            AppColors.darkBlue,
                            BlendMode.srcIn,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Flexible(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text(
                                'تثبيت فى مقاول صحى',
                                style: CustomTextStyles.style14w500.copyWith(
                                  color: AppColors.darkBlue,
                                  height: 0,
                                ),
                                textDirection: TextDirection.rtl,
                              ),
                              Text(
                                '( خلال ال48 ساعة القادمة )',
                                style: CustomTextStyles.style14w500.copyWith(
                                  color: AppColors.redWatermelon,
                                  height: 0,
                                ),
                                textDirection: TextDirection.rtl,
                              ),
                            ],
                          ),
                        ),
                        SizedBox(width: 8.w),
                        SvgPicture.asset(
                          AppAssets.pinIcon,
                          height: 24.h,
                          width: 24.w,
                          colorFilter: ColorFilter.mode(
                            AppColors.darkBlue,
                            BlendMode.srcIn,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 3.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.r),
              child: BouquetCard(
                bouquetName: 'بلس',
                initialValueOfCheckBox: true,
                doubleViewsContainerNumber: 18,
                bouquetCardTapeText: 'أفضل قيمة مقابل سعر',
                bouquetDetails: _extraAndPlusBouquetDetails(),
              ),
            ),
            SizedBox(height: 3.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.r),
              child: BouquetCard(
                bouquetName: 'سوبر',
                doubleViewsContainerNumber: 24,
                bouquetCardTapeText: 'أعلى مشاهدات',
                bouquetDetails: _extraAndPlusBouquetDetails(),
              ),
            ),
            SizedBox(height: 32.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.r),
              child: Container(
                padding: EdgeInsets.all(8.r),
                decoration: BoxDecoration(
                  color: AppColors.grey,
                  border: Border.all(
                    width: 1.w,
                    color: AppColors.black.withValues(alpha: 0.05),
                  ),
                  borderRadius: BorderRadius.circular(8.r),
                ),
                child: Column(
                  spacing: 4.h,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      'باقات مخصصة لك',
                      style: CustomTextStyles.style14w500.copyWith(
                        color: AppColors.darkBlue,
                      ),
                      textDirection: TextDirection.rtl,
                    ),
                    Text(
                      'تواصل معنا لأختيار الباقة المناسبة لك',
                      style: CustomTextStyles.style12w400.copyWith(
                        color: AppColors.darkBlue,
                      ),
                      textDirection: TextDirection.rtl,
                    ),
                    Text(
                      'فريق المبيعات',
                      style: CustomTextStyles.style16w700.copyWith(
                        color: AppColors.blue2,
                      ),
                      textDirection: TextDirection.rtl,
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 199.h),
            Divider(height: 0,),
            SizedBox(height: 12.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.r),
              child: FilledButton(
                onPressed: () {},
                style: FilledButton.styleFrom(
                  padding: EdgeInsets.symmetric(vertical: 10.r),
                  backgroundColor: AppColors.blue2,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(32.r),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset(
                      AppAssets.arrowForwardIcon,
                      height: 24.h,
                      width: 24.w,
                      colorFilter: ColorFilter.mode(
                        AppColors.white,
                        BlendMode.srcIn,
                      ),
                    ),
                    SizedBox(width: 4.w),
                    Text(
                      'التالى',
                      style: CustomTextStyles.style16w700.copyWith(
                        color: AppColors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
