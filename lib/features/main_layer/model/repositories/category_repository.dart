import '../models/category_model.dart';
import '../services/database_helper.dart';

class CategoryRepository {
  final DatabaseHelper _dbHelper = DatabaseHelper();

  Future<List<CategoryModel>> getAllCategories() async {
    final db = await _dbHelper.database;
    final List<Map<String, dynamic>> maps = await db.query('categories');
    return maps.map((map) => CategoryModel.fromMap(map)).toList();
  }

  Future<void> insertCategories(List<CategoryModel> categories) async {
    final db = await _dbHelper.database;
    final batch = db.batch();

    for (var category in categories) {
      batch.insert('categories', category.toMap());
    }

    await batch.commit();
  }
}
