import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:otex/core/resources/app_assets.dart';
import 'package:otex/core/resources/app_colors.dart';
import 'package:otex/core/resources/custom_text_styles.dart';

class ProductCard extends StatelessWidget {
  final String productCardImage;

  const ProductCard({super.key, required this.productCardImage});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: AppColors.darkBlue.withValues(alpha: 0.1),
          width: 1.w,
        ),
        borderRadius: BorderRadius.circular(4.r),
      ),
      child: Column(
        children: [
          Expanded(
            flex: 3,
            child: Image.asset(
              productCardImage,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          Expanded(
            flex: 2,
            child: Stack(
              children: [
                Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(
                        top: 9.5.r,
                        left: 9.68.r,
                        right: 8.r,
                        bottom: 9.5.r,
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SvgPicture.asset(
                            AppAssets.percentIcon,
                            height: 20.h,
                            width: 20.w,
                          ),
                          Expanded(
                            child: Text(
                              'جاكيت من الصوف مناسب',
                              style: CustomTextStyles.style14w500.copyWith(
                                color: AppColors.darkBlue,
                              ),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              textDirection: TextDirection.rtl,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: 8.r,
                      ).copyWith(bottom: 8.r),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SvgPicture.asset(
                            AppAssets.heartIcon,
                            height: 24.h,
                            width: 24.w,
                          ),
                          SizedBox(width: 8.w),
                          Expanded(
                            child: Row(
                              textDirection: TextDirection.rtl,
                              children: [
                                Text(
                                  '32,000,000 جم/',
                                  style: CustomTextStyles.style14w500.copyWith(
                                    color: AppColors.orange,
                                  ),
                                  textDirection: TextDirection.rtl,
                                ),
                                Flexible(
                                  child: SizedBox(
                                    height: 15.h,
                                    child: Stack(
                                      alignment: Alignment.centerRight,
                                      children: [
                                        Text(
                                          '60,000,000',
                                          style: CustomTextStyles.style12w400
                                              .copyWith(
                                                color: AppColors.darkBlue
                                                    .withValues(alpha: 0.5),
                                              ),
                                          textDirection: TextDirection.rtl,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                        Positioned(
                                          left: 0.w,
                                          right: 0.w,
                                          child: Container(
                                            height: 1.h,
                                            color: AppColors.darkBlue
                                                .withValues(alpha: 0.5),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: 8.r,
                      ).copyWith(bottom: 31.r),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'تم بيع 3.3k+',
                            style: CustomTextStyles.style10w400.copyWith(
                              color: AppColors.darkBlue.withValues(alpha: 0.5),
                            ),
                            textDirection: TextDirection.rtl,
                          ),
                          SizedBox(width: 4.w),
                          SvgPicture.asset(
                            AppAssets.fireIcon,
                            height: 12.h,
                            width: 12.w,
                            colorFilter: ColorFilter.mode(
                              AppColors.darkBlue.withValues(alpha: 0.5),
                              BlendMode.srcIn,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Positioned(
                  left: 8.r,
                  right: 10.r,
                  bottom: 8.r,
                  child: Row(
                    children: [
                      Image.asset(
                        AppAssets.talatMostafaLogoIcon,
                        height: 22.h,
                        width: 15.w,
                      ),
                      SizedBox(width: 12.w),
                      InkWell(
                        onTap: () {},
                        child: Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: 8.r,
                            vertical: 4.r,
                          ),
                          decoration: BoxDecoration(
                            color: AppColors.white,
                            border: Border.all(
                              width: 1.w,
                              color: AppColors.black.withValues(alpha: 0.1),
                            ),
                            borderRadius: BorderRadius.circular(4.r),
                          ),
                          child: SvgPicture.asset(
                            AppAssets.cartIcon,
                            height: 16.h,
                            width: 16.w,
                          ),
                        ),
                      ),
                      Spacer(),
                      SvgPicture.asset(
                        AppAssets.rightPadgeIcon,
                        height: 26.h,
                        width: 26.w,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
