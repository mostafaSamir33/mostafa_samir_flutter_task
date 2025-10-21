import 'package:flutter/material.dart';
import 'package:otex/core/resources/custom_text_styles.dart';

class AddAdsScreen extends StatelessWidget {
  const AddAdsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          'أضف أعلان',
          style: CustomTextStyles.style16w700,
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
