import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:otex/core/resources/app_colors.dart';
import 'package:otex/core/resources/custom_text_styles.dart';

class BouquetCardTape extends StatelessWidget {
  final String text;

  const BouquetCardTape({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: TapePainter(),
      child: Container(
        padding: EdgeInsets.only(top: 9.r, bottom: 8.r, right: 4.r, left: 28.r),
        child: Text(
          text,
          style: CustomTextStyles.style12w500.copyWith(
            color: AppColors.redWatermelon,
          ),
        ),
      ),
    );
  }
}

class TapePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint =
        Paint()
          ..color = AppColors.lightPink
          ..style = PaintingStyle.fill;

    final path =
        Path()
          ..moveTo(15, 0)
          ..lineTo(size.width, 0)
          ..lineTo(size.width, size.height)
          ..lineTo(15, size.height)
          ..lineTo(25, size.height / 2)
          ..close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
