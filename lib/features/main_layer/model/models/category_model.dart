class CategoryModel {
  final int? id;
  final String name;
  final String imagePath;

  CategoryModel({
    this.id,
    required this.name,
    required this.imagePath,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'image_path': imagePath,
    };
  }

  factory CategoryModel.fromMap(Map<String, dynamic> map) {
    return CategoryModel(
      id: map['id'],
      name: map['name'],
      imagePath: map['image_path'],
    );
  }
}