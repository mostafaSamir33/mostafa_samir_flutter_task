import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/resources/app_colors.dart';
import '../../../../../core/resources/custom_text_styles.dart';

class CustomTextField extends StatelessWidget {
  final String? hintText;

  const CustomTextField({super.key, this.hintText});

  @override
  Widget build(BuildContext context) {
    return TextField(
      textAlign: TextAlign.right,
      textDirection: TextDirection.rtl,
      style: CustomTextStyles.style14w500.copyWith(color: AppColors.darkBlue),
      cursorColor: AppColors.blue,
      cursorRadius: Radius.circular(8.r),
      decoration: InputDecoration(
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            width: 1.w,
            color: AppColors.black.withValues(alpha: 0.1),
          ),
          borderRadius: BorderRadius.circular(8.r),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(width: 1.w, color: AppColors.blue),
          borderRadius: BorderRadius.circular(8.r),
        ),
        contentPadding: EdgeInsets.symmetric(
          horizontal: 12.r,
          vertical: (48.h - 20.h) / 2,
        ),
        fillColor: AppColors.white,
        filled: true,
        hintText: hintText,
        hintTextDirection: TextDirection.rtl,
        hintStyle: CustomTextStyles.style14w500.copyWith(
          color: AppColors.darkBlue.withValues(alpha: 0.5),
        ),
        isDense: true,
        alignLabelWithHint: true,
      ),
    );
  }
}
