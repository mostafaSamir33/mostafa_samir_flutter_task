import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:otex/core/resources/app_colors.dart';
import 'package:otex/core/resources/custom_text_styles.dart';

class CategoriesTabBar extends StatelessWidget {
  final String tabImage;
  final String tabText;

  const CategoriesTabBar({
    super.key,
    required this.tabImage,
    required this.tabText,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          height: 56.h,
          width: 73.w,
          decoration: BoxDecoration(
            color: AppColors.black.withValues(alpha: 0.1),
            borderRadius: BorderRadius.circular(4.r),
          ),
          child: Image.asset(
            tabImage,
            fit: BoxFit.cover,
          ),
        ),
        SizedBox(height: 8.h),
        Flexible(
          child: Text(
            tabText,
            style: CustomTextStyles.style12w400.copyWith(
              color: AppColors.darkBlue,
            ),
          ),
        ),
      ],
    );
  }
}
