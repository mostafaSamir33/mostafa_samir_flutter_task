import '../models/app_icon_model.dart';
import '../services/database_helper.dart';

class AppIconRepository {
  final DatabaseHelper _dbHelper = DatabaseHelper();

  Future<List<AppIconModel>> getIconsByScreen(String screenName) async {
    final db = await _dbHelper.database;
    final List<Map<String, dynamic>> maps = await db.query(
      'app_icons',
      where: 'screen_name = ?',
      whereArgs: [screenName],
    );
    return maps.map((map) => AppIconModel.fromMap(map)).toList();
  }

  Future<void> insertIcons(List<AppIconModel> icons) async {
    final db = await _dbHelper.database;
    final batch = db.batch();

    for (var icon in icons) {
      batch.insert('app_icons', icon.toMap());
    }

    await batch.commit();
  }
}