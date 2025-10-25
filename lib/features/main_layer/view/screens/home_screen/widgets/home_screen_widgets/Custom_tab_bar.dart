import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:otex/core/resources/app_colors.dart';
import 'package:otex/core/resources/custom_text_styles.dart';

class CustomTabBar extends StatelessWidget {
  final String tabText;
  final bool isActive;

  const CustomTabBar({super.key, required this.tabText, this.isActive = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(12.r),
      decoration: BoxDecoration(
        color:
            isActive
                ? AppColors.orange.withValues(alpha: 0.05)
                : AppColors.white.withValues(alpha: 0.3),
        border: Border.all(
          color:
              isActive
                  ? AppColors.blue3.withValues(alpha: 0.1)
                  : AppColors.black.withValues(alpha: 0.1),
          width: 1.w,
        ),
        borderRadius: BorderRadius.circular(4.r),
      ),
      child: Text(
        tabText,
        style: CustomTextStyles.style14w500.copyWith(
          color:
              isActive
                  ? AppColors.orange
                  : AppColors.darkBlue.withValues(alpha: 0.5),
        ),
      ),
    );
  }
}
