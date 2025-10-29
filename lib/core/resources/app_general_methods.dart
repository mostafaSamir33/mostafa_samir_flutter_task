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
            textValue: textKey,
          ),
    );
    return text.textValue;
  }
}
