class ProductModel {
  final int? id;
  final String name;
  final String originalPrice;
  final String discountedPrice;
  final String imagePath;
  final int categoryId;
  final String salesCount;

  ProductModel({
    this.id,
    required this.name,
    required this.originalPrice,
    required this.discountedPrice,
    required this.imagePath,
    required this.categoryId,
    required this.salesCount,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'original_price': originalPrice,
      'discounted_price': discountedPrice,
      'image_path': imagePath,
      'category_id': categoryId,
      'sales_count': salesCount,
    };
  }

  factory ProductModel.fromMap(Map<String, dynamic> map) {
    return ProductModel(
      id: map['id'],
      name: map['name'],
      originalPrice: map['original_price'],
      discountedPrice: map['discounted_price'],
      imagePath: map['image_path'],
      categoryId: map['category_id'],
      salesCount: map['sales_count'],
    );
  }
}