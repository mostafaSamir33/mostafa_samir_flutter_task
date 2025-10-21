import 'package:flutter/material.dart';

class AppScrollBehavior extends MaterialScrollBehavior {
  @override
  Widget buildOverscrollIndicator(
    BuildContext context,
    Widget child,
    ScrollableDetails details,
  ) {
    // Return the default overscroll indicator (bouncing effect)
    return super.buildOverscrollIndicator(context, child, details);
  }
}
