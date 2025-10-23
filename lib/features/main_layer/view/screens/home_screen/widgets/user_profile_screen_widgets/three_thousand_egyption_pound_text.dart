import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../../core/resources/app_colors.dart';
import '../../../../../../../core/resources/custom_text_styles.dart';

class ThreeThousandEgyptionPoundText extends StatelessWidget {
  const ThreeThousandEgyptionPoundText({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      textDirection: TextDirection.rtl,
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Stack(
          children: [
            Column(
              children: [
                Text(
                  '3,000',
                  style: CustomTextStyles.style16w700.copyWith(
                    color: AppColors.orange,
                  ),
                ),
                SizedBox(height: (16 * 0.25).h),
              ],
            ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Divider(color: AppColors.orange, thickness: (16 * 0.14).h),
            ),
          ],
        ),
        Stack(
          children: [
            Column(
              children: [
                Text(
                  'ج',
                  style: CustomTextStyles.style16w700.copyWith(
                    color: AppColors.orange,
                  ),
                ),
                SizedBox(height: (16 * 0.25).h),
              ],
            ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Divider(
                color: Colors.transparent,
                thickness: (16 * 0.14).h,
              ),
            ),
          ],
        ),
        Stack(
          children: [
            Column(
              children: [
                Text(
                  '.م',
                  style: CustomTextStyles.style16w700.copyWith(
                    color: AppColors.orange,
                  ),
                  textDirection: TextDirection.rtl,
                ),
                SizedBox(height: (16 * 0.25).h),
              ],
            ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Divider(
                color: AppColors.orange,
                thickness: (16 * 0.14).h,
                indent: 5.w,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
