import 'package:otex/features/main_layer/model/models/app_icon_model.dart';

import '../../features/main_layer/model/models/app_text_model.dart';

class AppGeneralMethods {
  static String getTextByKey({
    required List<AppTextModel> appTexts,
    required String textKey,
  }) {
    final text = appTexts.firstWhere(
      (text) => text.textKey == textKey,
      orElse:
          () => AppTextModel(
            screenName: 'fallback',
            textKey: textKey,
            textValue: '',
          ),
    );
    return text.textValue;
  }

  static String getIconByKey({
    required List<AppIconModel> appIcons,
    required String iconKey,
  }) {
    final icon = appIcons.firstWhere(
      (icon) => icon.iconKey == iconKey,
      orElse:
          () => AppIconModel(
            screenName: 'fallback',
            iconKey: iconKey,
            iconPath: 'assets/icons/filter_screen_icons/close_icon.svg',
          ),
    );
    return icon.iconPath;
  }
}
