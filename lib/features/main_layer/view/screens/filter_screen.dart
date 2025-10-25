import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:otex/core/resources/app_assets.dart';
import 'package:otex/core/resources/app_colors.dart';
import 'package:otex/core/resources/custom_text_styles.dart';
import 'package:otex/features/main_layer/view/widgets/filter_screen_widgets/custom_selection_tabs.dart';
import 'package:otex/features/main_layer/view/widgets/filter_screen_widgets/custom_text_field.dart';

class FilterScreen extends StatefulWidget {
  static const String routeName = '/FilterScreen';

  const FilterScreen({super.key});

  @override
  State<FilterScreen> createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  List<String> kindTabs = ['الكل', 'توين هاوس', 'فيلا منفصلة', 'تاون هاوس'];
  int selectedKindTabsIndex = 0;

  List<String> numberOfRoomsTabs = [
    '4 غرف',
    '5 غرف+',
    'الكل',
    'غرفتين',
    '3 غرف',
  ];
  int selectedNumberOfRoomsTabsIndex = 1;

  List<String> payWayTabs = ['أى', 'تقسيط', 'كاش'];
  int selectedPayWayTabsIndex = 2;

  List<String> propertyConditionTabs = ['أى', 'جاهز', 'قيد الأنشاء'];
  int selectedPropertyConditionTabsIndex = 1;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        body: SafeArea(
          child: ListView(
            padding: EdgeInsets.only(top: 12.r, bottom: 16.r),
            children: [
              Padding(
                padding: EdgeInsets.only(
                  right: 12.r,
                  left: 16.r,
                  bottom: 32.r,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'رجوع للأفتراضى',
                      style: CustomTextStyles.style16w700.copyWith(
                        color: AppColors.blue2,
                      ),
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'فلترة',
                          style: CustomTextStyles.style24w500.copyWith(
                            color: AppColors.darkBlue,
                          ),
                        ),
                        SizedBox(width: 12.w),
                        InkWell(
                          onTap: () => Navigator.of(context).pop(),
                          child: SvgPicture.asset(
                            AppAssets.closeIcon,
                            height: 24.h,
                            width: 24.w,
                            colorFilter: ColorFilter.mode(
                              AppColors.darkBlue,
                              BlendMode.srcIn,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 16.r,
                ).copyWith(bottom: 12.r),
                child: Text(
                  'الفئة',
                  style: CustomTextStyles.style16w500.copyWith(
                    color: AppColors.black.withValues(alpha: 0.5),
                  ),
                  textAlign: TextAlign.end,
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 16.r,
                ).copyWith(bottom: 28.r),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'تغيير',
                      style: CustomTextStyles.style14w700.copyWith(
                        color: AppColors.blue3,
                      ),
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(
                              'عقارات',
                              style: CustomTextStyles.style14w500.copyWith(
                                color: AppColors.darkBlue,
                              ),
                            ),
                            Text(
                              'فلل البيع',
                              style: CustomTextStyles.style12w400.copyWith(
                                color: AppColors.black.withValues(alpha: 0.5),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(width: 8.w),
                        InkWell(
                          onTap: () => Navigator.of(context).pop(),
                          child: Padding(
                            padding: EdgeInsets.all(8.r),
                            child: SvgPicture.asset(
                              AppAssets.handCarryHouseIcon,
                              height: 24.h,
                              width: 24.w,
                              colorFilter: ColorFilter.mode(
                                AppColors.orange,
                                BlendMode.srcIn,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Divider(height: 0,),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.r, vertical: 20.r),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SvgPicture.asset(
                      AppAssets.smallArrowForwardIcon,
                      height: 24.h,
                      width: 24.w,
                      colorFilter: ColorFilter.mode(
                        AppColors.darkBlue,
                        BlendMode.srcIn,
                      ),
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(
                              'الموقع',
                              style: CustomTextStyles.style14w500.copyWith(
                                color: AppColors.darkBlue,
                              ),
                            ),
                            Text(
                              'مصر',
                              style: CustomTextStyles.style12w400.copyWith(
                                color: AppColors.black.withValues(alpha: 0.5),
                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(
                            vertical: 3.5.r,
                          ).copyWith(left: 8.r),
                          child: SvgPicture.asset(
                            AppAssets.locationIcon,
                            height: 24.h,
                            width: 24.w,
                            colorFilter: ColorFilter.mode(
                              AppColors.darkBlue,
                              BlendMode.srcIn,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Divider(height: 0,),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 16.r,
                ).copyWith(top: 20.r, bottom: 12.r),
                child: Text(
                  'الأقساط الشهرية',
                  style: CustomTextStyles.style16w500.copyWith(
                    color: AppColors.black.withValues(alpha: 0.5),
                  ),
                  textAlign: TextAlign.right,
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 16.r,
                ).copyWith(bottom: 20.r),
                child: Row(
                  spacing: 12.w,
                  children: [
                    Expanded(child: CustomTextField()),
                    Expanded(child: CustomTextField()),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 16.r,
                ).copyWith(bottom: 12.r),
                child: Text(
                  'النوع',
                  style: CustomTextStyles.style16w500.copyWith(
                    color: AppColors.black.withValues(alpha: 0.5),
                  ),
                  textAlign: TextAlign.right,
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 16.r,
                ).copyWith(bottom: 20.r),
                child: Wrap(
                  textDirection: TextDirection.rtl,
                  direction: Axis.horizontal,
                  spacing: 12.w,
                  runSpacing: 12.h,
                  children: List.generate(kindTabs.length, (index) {
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedKindTabsIndex = index;
                        });
                      },
                      child: CustomSelectionTabs(
                        tabText: kindTabs[index],
                        isActive: selectedKindTabsIndex == index,
                      ),
                    );
                  }),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 16.r,
                ).copyWith(bottom: 12.r),
                child: Text(
                  'عدد الغرف',
                  style: CustomTextStyles.style16w500.copyWith(
                    color: AppColors.black.withValues(alpha: 0.5),
                  ),
                  textAlign: TextAlign.right,
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 16.r,
                ).copyWith(bottom: 20.r),
                child: Wrap(
                  textDirection: TextDirection.rtl,
                  direction: Axis.horizontal,
                  spacing: 12.w,
                  runSpacing: 12.h,
                  children: List.generate(numberOfRoomsTabs.length, (index) {
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedNumberOfRoomsTabsIndex = index;
                        });
                      },
                      child: CustomSelectionTabs(
                        tabText: numberOfRoomsTabs[index],
                        isActive: selectedNumberOfRoomsTabsIndex == index,
                      ),
                    );
                  }),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 16.r,
                ).copyWith(bottom: 12.r),
                child: Text(
                  'السعر',
                  style: CustomTextStyles.style16w500.copyWith(
                    color: AppColors.black.withValues(alpha: 0.5),
                  ),
                  textAlign: TextAlign.right,
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 16.r,
                ).copyWith(bottom: 20.r),
                child: Row(
                  spacing: 12.w,
                  children: [
                    Expanded(child: CustomTextField(hintText: 'أقصى سعر')),
                    Expanded(child: CustomTextField(hintText: 'أقل سعر')),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 16.r,
                ).copyWith(bottom: 12.r),
                child: Text(
                  'طريقة الدفع',
                  style: CustomTextStyles.style16w500.copyWith(
                    color: AppColors.black.withValues(alpha: 0.5),
                  ),
                  textAlign: TextAlign.right,
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 16.r,
                ).copyWith(bottom: 20.r),
                child: Wrap(
                  textDirection: TextDirection.rtl,
                  direction: Axis.horizontal,
                  spacing: 12.w,
                  runSpacing: 12.h,
                  children: List.generate(payWayTabs.length, (index) {
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedPayWayTabsIndex = index;
                        });
                      },
                      child: CustomSelectionTabs(
                        tabText: payWayTabs[index],
                        isActive: selectedPayWayTabsIndex == index,
                      ),
                    );
                  }),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 16.r,
                ).copyWith(bottom: 12.r),
                child: Text(
                  'حالة العقار',
                  style: CustomTextStyles.style16w500.copyWith(
                    color: AppColors.black.withValues(alpha: 0.5),
                  ),
                  textAlign: TextAlign.right,
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 16.r,
                ).copyWith(bottom: 78.r),
                child: Wrap(
                  textDirection: TextDirection.rtl,
                  direction: Axis.horizontal,
                  spacing: 12.w,
                  runSpacing: 12.h,
                  children: List.generate(propertyConditionTabs.length, (index) {
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedPropertyConditionTabsIndex = index;
                        });
                      },
                      child: CustomSelectionTabs(
                        tabText: propertyConditionTabs[index],
                        isActive: selectedPropertyConditionTabsIndex == index,
                      ),
                    );
                  }),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.r),
                child: FilledButton(
                  onPressed: () {},
                  style: FilledButton.styleFrom(
                    padding: EdgeInsets.symmetric(vertical: 12.5.r),
                    backgroundColor: AppColors.blue2,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(32.r),
                    ),
                  ),
                  child:  Text(
                    'شاهد 10,000+ نتائج',
                    style: CustomTextStyles.style16w700.copyWith(
                      color: AppColors.white,
                    ),
                    textDirection: TextDirection.rtl,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
