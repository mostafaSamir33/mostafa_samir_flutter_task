import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/resources/app_colors.dart';
import '../../../../../core/resources/custom_text_styles.dart';

class CustomSelectionTabs extends StatelessWidget {
  final String tabText;
  final bool isActive;

  const CustomSelectionTabs({
    super.key,
    required this.tabText,
    required this.isActive,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8.r, vertical: 11.5.r),
      constraints: BoxConstraints(minHeight: 0, minWidth: 0),
      decoration: BoxDecoration(
        color:
            isActive
                ? AppColors.blue2.withValues(alpha: 0.05)
                : AppColors.white,
        border: Border.all(
          color:
              isActive
                  ? AppColors.blue2
                  : AppColors.black.withValues(alpha: 0.1),
          width: isActive ? 2.w : 1.w,
        ),
        borderRadius: BorderRadius.circular(30.r),
      ),
      child: Text(
        tabText,
        style: CustomTextStyles.style14w500.copyWith(
          color:
              isActive
                  ? AppColors.blue2
                  : AppColors.darkBlue.withValues(alpha: 0.5),
        ),
        textDirection: TextDirection.rtl,
      ),
    );
  }
}
