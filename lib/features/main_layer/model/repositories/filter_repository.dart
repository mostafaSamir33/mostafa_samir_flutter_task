import '../models/filter_model.dart';
import '../services/database_helper.dart';

class FilterRepository {
  final DatabaseHelper _dbHelper = DatabaseHelper();

  Future<List<FilterModel>> getFilterOptions(String filterType) async {
    final db = await _dbHelper.database;
    final List<Map<String, dynamic>> maps = await db.query(
      'filter_options',
      where: 'filter_type = ?',
      whereArgs: [filterType],
    );
    return maps.map((map) => FilterModel.fromMap(map)).toList();
  }

  // Future<int> insertFilterOption(FilterModel filter) async {
  //   final db = await _dbHelper.database;
  //   return await db.insert('filter_options', filter.toMap());
  // }

  Future<void> insertFilterOptions(List<FilterModel> filters) async {
    final db = await _dbHelper.database;
    final batch = db.batch();

    for (var filter in filters) {
      batch.insert('filter_options', filter.toMap());
    }

    await batch.commit();
  }
}
