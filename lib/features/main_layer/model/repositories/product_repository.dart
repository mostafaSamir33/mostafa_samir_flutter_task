import '../models/product_model.dart';
import '../services/database_helper.dart';

class ProductRepository {
  final DatabaseHelper _dbHelper = DatabaseHelper();

  Future<List<ProductModel>> getAllProducts() async {
    final db = await _dbHelper.database;
    final List<Map<String, dynamic>> maps = await db.query('products');
    return maps.map((map) => ProductModel.fromMap(map)).toList();
  }

  // Future<List<ProductModel>> getProductsByCategory(int categoryId) async {
  //   final db = await _dbHelper.database;
  //   final List<Map<String, dynamic>> maps = await db.query(
  //     'products',
  //     where: 'category_id = ?',
  //     whereArgs: [categoryId],
  //   );
  //   return maps.map((map) => ProductModel.fromMap(map)).toList();
  // }

  // Future<int> insertProduct(ProductModel product) async {
  //   final db = await _dbHelper.database;
  //   return await db.insert('products', product.toMap());
  // }

  Future<void> insertProducts(List<ProductModel> products) async {
    final db = await _dbHelper.database;
    final batch = db.batch();

    for (var product in products) {
      batch.insert('products', product.toMap());
    }

    await batch.commit();
  }
}
