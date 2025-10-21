import 'package:flutter/material.dart';

import '../../../../../../core/resources/custom_text_styles.dart';

class UserAdsScreen extends StatelessWidget {
  const UserAdsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          'أعلاناتي',
          style: CustomTextStyles.style16w700,
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
