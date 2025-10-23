import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:otex/core/resources/app_colors.dart';
import 'package:otex/core/resources/custom_text_styles.dart';
import 'package:otex/features/main_layer/view/screens/home_screen/widgets/user_profile_screen_widgets/three_thousand_egyption_pound_text.dart';

import 'bouquet_card_tape.dart';
import 'double_of_views_text.dart';

class BouquetCard extends StatefulWidget {
  final String bouquetName;
  final bool? initialValueOfCheckBox;
  final int? doubleViewsContainerNumber;
  final Widget bouquetDetails;
  final String? bouquetCardTapeText;

  const BouquetCard({
    super.key,
    required this.bouquetName,
    this.initialValueOfCheckBox = false,
    this.doubleViewsContainerNumber,
    required this.bouquetDetails,
    this.bouquetCardTapeText,
  });

  @override
  State<BouquetCard> createState() => _BouquetCardState();
}

class _BouquetCardState extends State<BouquetCard> {
  late bool _isAgreed;

  @override
  void initState() {
    super.initState();
    _isAgreed = widget.initialValueOfCheckBox!;
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.topRight,
      children: [
        Column(
          children: [
            Visibility(
              visible: widget.bouquetCardTapeText != null,
              child: SizedBox(height: 21.h),
            ),
            Container(
              padding: EdgeInsets.all(16.r),
              decoration: BoxDecoration(
                color: AppColors.white,
                border: Border.all(
                  width: 1.w,
                  color: AppColors.black.withValues(alpha: 0.1),
                ),
                borderRadius: BorderRadius.circular(8.r),
                boxShadow: [
                  BoxShadow(
                    color: AppColors.darkBlue.withValues(alpha: 0.04),
                    offset: Offset(0, 4.h),
                    blurRadius: 5.r,
                  ),
                ],
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      ThreeThousandEgyptionPoundText(),
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            widget.bouquetName,
                            style: CustomTextStyles.style16w700.copyWith(
                              color:
                                  _isAgreed
                                      ? AppColors.blue3
                                      : AppColors.darkBlue,
                            ),
                          ),
                          SizedBox(width: 4.w),
                          SizedBox(
                            width: 24.w,
                            height: 24.h,
                            child: Checkbox(
                              value: _isAgreed,
                              onChanged: (value) {
                                setState(() {
                                  _isAgreed = value ?? false;
                                });
                              },
                              side: BorderSide(
                                width: 2.w,
                                color: AppColors.darkBlue,
                              ),
                              activeColor: AppColors.blue3,
                              checkColor: AppColors.white,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(3.r),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: 8.h),
                  Divider(height: 0),
                  Padding(
                    padding: EdgeInsets.only(top: 12.r),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Visibility(
                          visible: widget.doubleViewsContainerNumber != null,
                          child: Expanded(
                            flex: 239,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Stack(
                                  alignment: Alignment.center,
                                  children: [
                                    Container(
                                      decoration: BoxDecoration(
                                        border: Border(
                                          top: BorderSide(
                                            width: 1.w,
                                            color: AppColors.green,
                                          ),
                                          left: BorderSide(
                                            width: 1.w,
                                            color: AppColors.green,
                                          ),
                                          right: BorderSide(
                                            width: 1.w,
                                            color: AppColors.green,
                                          ),
                                        ),
                                        color: AppColors.green.withValues(
                                          alpha: 0.05,
                                        ),
                                        borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(32.r),
                                          topRight: Radius.circular(32.r),
                                        ),
                                      ),
                                      height: 42.h,
                                      width: 71.w,
                                    ),
                                    Column(
                                      children: [
                                        SizedBox(height: 10.h),
                                        Text(
                                          widget.doubleViewsContainerNumber
                                              .toString(),
                                          style: CustomTextStyles.style14w700
                                              .copyWith(color: AppColors.green),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                SizedBox(height: 4.h),
                                DoubleOfViewsText(),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(width: 8.w),
                        Expanded(flex: 733, child: widget.bouquetDetails),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        Visibility(
          visible: widget.bouquetCardTapeText != null,
          child: ClipRRect(
            borderRadius: BorderRadius.only(topRight: Radius.circular(4.r)),
            child: BouquetCardTape(text: widget.bouquetCardTapeText ?? ''),
          ),
        ),
      ],
    );
  }
}
