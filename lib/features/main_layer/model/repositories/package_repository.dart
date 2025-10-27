import '../models/package_model.dart';
import '../services/database_helper.dart';

class PackageRepository {
  final DatabaseHelper _dbHelper = DatabaseHelper();

  Future<List<PackageModel>> getAllPackages() async {
    final db = await _dbHelper.database;
    final List<Map<String, dynamic>> maps = await db.query('packages');
    return maps.map((map) => PackageModel.fromMap(map)).toList();
  }

  // Future<int> insertPackage(PackageModel package) async {
  //   final db = await _dbHelper.database;
  //   return await db.insert('packages', package.toMap());
  // }

  Future<void> insertPackages(List<PackageModel> packages) async {
    final db = await _dbHelper.database;
    final batch = db.batch();

    for (var package in packages) {
      batch.insert('packages', package.toMap());
    }

    await batch.commit();
  }
}
