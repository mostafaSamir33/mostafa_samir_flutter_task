class AppIconModel {
  final int? id;
  final String screenName;
  final String iconKey;
  final String iconPath;

  AppIconModel({
    this.id,
    required this.screenName,
    required this.iconKey,
    required this.iconPath,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'screen_name': screenName,
      'icon_key': iconKey,
      'icon_path': iconPath,
    };
  }

  factory AppIconModel.fromMap(Map<String, dynamic> map) {
    return AppIconModel(
      id: map['id'],
      screenName: map['screen_name'],
      iconKey: map['icon_key'],
      iconPath: map['icon_path'],
    );
  }
}