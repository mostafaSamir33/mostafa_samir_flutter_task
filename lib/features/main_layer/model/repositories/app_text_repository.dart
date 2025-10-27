import '../models/app_text_model.dart';
import '../services/database_helper.dart';

class AppTextRepository {
  final DatabaseHelper _dbHelper = DatabaseHelper();

  Future<List<AppTextModel>> getAppTextsByScreen(String screenName) async {
    final db = await _dbHelper.database;
    final List<Map<String, dynamic>> maps = await db.query(
      'app_texts',
      where: 'screen_name = ?',
      whereArgs: [screenName],
    );
    return maps.map((map) => AppTextModel.fromMap(map)).toList();
  }

  Future<String> getTextByKey(String screenName, String textKey) async {
    final db = await _dbHelper.database;
    final List<Map<String, dynamic>> maps = await db.query(
      'app_texts',
      where: 'screen_name = ? AND text_key = ?',
      whereArgs: [screenName, textKey],
    );
    if (maps.isNotEmpty) {
      return maps.first['text_value'];
    }
    return '';
  }

  // Future<int> insertAppText(AppTextModel appText) async {
  //   final db = await _dbHelper.database;
  //   return await db.insert('app_texts', appText.toMap());
  // }

  Future<void> insertAppTexts(List<AppTextModel> appTexts) async {
    final db = await _dbHelper.database;
    final batch = db.batch();

    for (var appText in appTexts) {
      batch.insert('app_texts', appText.toMap());
    }

    await batch.commit();
  }
}
