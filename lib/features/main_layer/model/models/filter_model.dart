class FilterModel {
  final int? id;
  final String filterType;
  final String optionName;
  final bool isSelected;

  FilterModel({
    this.id,
    required this.filterType,
    required this.optionName,
    required this.isSelected,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'filter_type': filterType,
      'option_name': optionName,
      'is_selected': isSelected ? 1 : 0,
    };
  }

  factory FilterModel.fromMap(Map<String, dynamic> map) {
    return FilterModel(
      id: map['id'],
      filterType: map['filter_type'],
      optionName: map['option_name'],
      isSelected: map['is_selected'] == 1,
    );
  }
}