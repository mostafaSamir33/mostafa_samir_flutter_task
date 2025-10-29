import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:otex/core/resources/app_assets.dart';
import 'package:otex/core/resources/app_colors.dart';
import 'package:otex/core/resources/app_general_methods.dart';
import 'package:otex/core/resources/custom_text_styles.dart';
import 'package:otex/features/main_layer/view_model/cubit/app_cubit.dart';
import 'package:otex/features/main_layer/view_model/cubit/app_cubit_states.dart';

import '../../../../model/models/package_model.dart';
import '../widgets/user_profile_screen_widgets/bouquet_card.dart';

class UserProfileScreen extends StatefulWidget {
  const UserProfileScreen({super.key});

  @override
  State<UserProfileScreen> createState() => _UserProfileScreenState();
}

class _UserProfileScreenState extends State<UserProfileScreen> {
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
        } else if (state is PackagesDataSuccessLoaded) {
          PackageModel firstPackageData = state.packages[0];
          PackageModel secondPackageData = state.packages[1];
          PackageModel thirdPackageData = state.packages[2];
          PackageModel fourthPackageData = state.packages[3];
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
                            AppGeneralMethods.getTextByKey(
                              appTexts: state.appTexts,
                              textKey: 'choose_packages',
                            ),
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
                      AppGeneralMethods.getTextByKey(
                        appTexts: state.appTexts,
                        textKey: 'choose_description',
                      ),
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
                      state: state,
                      bouquetName: firstPackageData.name,
                      bouquetDetails: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Flexible(
                            child: Text(
                              firstPackageData.features[0],
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
                      state: state,
                      bouquetName: secondPackageData.name,
                      initialValueOfCheckBox: secondPackageData.isFeatured,
                      doubleViewsContainerNumber: secondPackageData.viewsCount,
                      bouquetDetails: Column(
                        spacing: 8.h,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Flexible(
                                child: Text(
                                  secondPackageData.features[0],
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
                                  secondPackageData.features[1],
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
                                      secondPackageData.features[2],
                                      style: CustomTextStyles.style14w500
                                          .copyWith(
                                            color: AppColors.darkBlue,
                                            height: 0,
                                          ),
                                      textDirection: TextDirection.rtl,
                                    ),
                                    Text(
                                      secondPackageData.features[3],
                                      style: CustomTextStyles.style14w500
                                          .copyWith(
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
                      state: state,
                      bouquetName: thirdPackageData.name,
                      initialValueOfCheckBox: thirdPackageData.isFeatured,
                      doubleViewsContainerNumber: thirdPackageData.viewsCount,
                      bouquetCardTapeText: thirdPackageData.tapeText,
                      bouquetDetails: _extraAndPlusBouquetDetails(
                        thirdAndFourthPackagesFeaturesData:
                            thirdPackageData.features,
                      ),
                    ),
                  ),
                  SizedBox(height: 3.h),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.r),
                    child: BouquetCard(
                      state: state,
                      bouquetName: fourthPackageData.name,
                      doubleViewsContainerNumber: fourthPackageData.viewsCount,
                      bouquetCardTapeText: fourthPackageData.tapeText,
                      bouquetDetails: _extraAndPlusBouquetDetails(
                        thirdAndFourthPackagesFeaturesData:
                            fourthPackageData.features,
                      ),
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
                            AppGeneralMethods.getTextByKey(
                              appTexts: state.appTexts,
                              textKey: 'custom_packages',
                            ),
                            style: CustomTextStyles.style14w500.copyWith(
                              color: AppColors.darkBlue,
                            ),
                            textDirection: TextDirection.rtl,
                          ),
                          Text(
                            AppGeneralMethods.getTextByKey(
                              appTexts: state.appTexts,
                              textKey: 'contact_us',
                            ),
                            style: CustomTextStyles.style12w400.copyWith(
                              color: AppColors.darkBlue,
                            ),
                            textDirection: TextDirection.rtl,
                          ),
                          Text(
                            AppGeneralMethods.getTextByKey(
                              appTexts: state.appTexts,
                              textKey: 'contact_sales',
                            ),
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
                  Divider(height: 0),
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
                            AppGeneralMethods.getTextByKey(
                              appTexts: state.appTexts,
                              textKey: 'next',
                            ),
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
        return Center(child: CircularProgressIndicator(color: AppColors.blue));
      },
    );
  }

  Widget _extraAndPlusBouquetDetails({
    required List<String> thirdAndFourthPackagesFeaturesData,
  }) {
    return Column(
      spacing: 8.h,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Flexible(
              child: Text(
                thirdAndFourthPackagesFeaturesData[0],
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
                thirdAndFourthPackagesFeaturesData[1],
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
                    thirdAndFourthPackagesFeaturesData[2],
                    style: CustomTextStyles.style14w500.copyWith(
                      color: AppColors.darkBlue,
                      height: 0,
                    ),
                    textDirection: TextDirection.rtl,
                  ),
                  Text(
                    thirdAndFourthPackagesFeaturesData[3],
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
                thirdAndFourthPackagesFeaturesData[4],
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
                thirdAndFourthPackagesFeaturesData[5],
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
                thirdAndFourthPackagesFeaturesData[6],
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
                    thirdAndFourthPackagesFeaturesData[7],
                    style: CustomTextStyles.style14w500.copyWith(
                      color: AppColors.darkBlue,
                      height: 0,
                    ),
                    textDirection: TextDirection.rtl,
                  ),
                  Text(
                    thirdAndFourthPackagesFeaturesData[8],
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
}
