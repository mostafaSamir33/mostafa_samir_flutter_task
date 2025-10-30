class FilterModel {
  final int? id;
  final String filterType;
  final String optionName;

  FilterModel({
    this.id,
    required this.filterType,
    required this.optionName,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'filter_type': filterType,
      'option_name': optionName,
    };
  }

  factory FilterModel.fromMap(Map<String, dynamic> map) {
    return FilterModel(
      id: map['id'],
      filterType: map['filter_type'],
      optionName: map['option_name'],
    );
  }
}