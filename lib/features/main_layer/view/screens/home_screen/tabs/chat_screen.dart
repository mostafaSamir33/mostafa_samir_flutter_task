import 'package:flutter/material.dart';

import '../../../../../../core/resources/custom_text_styles.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          'محادثة',
          style: CustomTextStyles.style16w700,
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
