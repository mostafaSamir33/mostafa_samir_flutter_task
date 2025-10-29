import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:otex/core/resources/app_general_methods.dart';

import '../../../../../../../core/resources/app_colors.dart';
import '../../../../../../../core/resources/custom_text_styles.dart';
import '../../../../../model/models/app_text_model.dart';

class DoubleOfViewsText extends StatelessWidget {
  final List<AppTextModel> appTexts;

  const DoubleOfViewsText({super.key, required this.appTexts});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          children: [
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  AppGeneralMethods.getTextByKey(
                    appTexts: appTexts,
                    textKey: 'double_number',
                  ),
                  style: CustomTextStyles.style12w400.copyWith(
                    color: AppColors.darkBlue,
                    height: 1,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 0.25.h),
              ],
            ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Divider(
                height: 0,
                color: AppColors.darkBlue,
                thickness: (12 * 0.075).r,
              ),
            ),
          ],
        ),
        SizedBox(height: 2.h),
        Stack(
          children: [
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  AppGeneralMethods.getTextByKey(
                    appTexts: appTexts,
                    textKey: 'views',
                  ),
                  style: CustomTextStyles.style12w400.copyWith(
                    color: AppColors.darkBlue,
                    height: 1.h,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 0.25.h),
              ],
            ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Divider(
                height: 0,
                color: AppColors.darkBlue,
                thickness: (12 * 0.075).r,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
