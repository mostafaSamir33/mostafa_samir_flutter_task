class AppTextModel {
  final int? id;
  final String screenName;
  final String textKey;
  final String textValue;

  AppTextModel({
    this.id,
    required this.screenName,
    required this.textKey,
    required this.textValue,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'screen_name': screenName,
      'text_key': textKey,
      'text_value': textValue,
    };
  }

  factory AppTextModel.fromMap(Map<String, dynamic> map) {
    return AppTextModel(
      id: map['id'],
      screenName: map['screen_name'],
      textKey: map['text_key'],
      textValue: map['text_value'],
    );
  }
}
