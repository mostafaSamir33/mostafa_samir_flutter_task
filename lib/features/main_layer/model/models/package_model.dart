class PackageModel {
  final int? id;
  final String name;
  final String price;
  final int? viewsCount;
  final bool isFeatured;
  final List<String> features;
  final String? tapeText;

  PackageModel({
    this.id,
    required this.name,
    required this.price,
    this.viewsCount,
    required this.isFeatured,
    required this.features,
    this.tapeText,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'price': price,
      'views_count': viewsCount,
      'is_featured': isFeatured ? 1 : 0,
      'features': features.join('|'),
      'tape_text': tapeText,
    };
  }

  factory PackageModel.fromMap(Map<String, dynamic> map) {
    return PackageModel(
      id: map['id'],
      name: map['name'],
      price: map['price'],
      viewsCount: map['views_count'],
      isFeatured: map['is_featured'] == 1,
      features: (map['features'] as String).split('|'),
      tapeText: map['tape_text'],
    );
  }
}