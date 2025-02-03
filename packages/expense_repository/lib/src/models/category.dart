import '../entities/category_entity.dart';

class Category {
  late String categoryId;
  late String name;
  late int totalExpenses;
  late String icon;
  late String color;
  
  Category({
    required this.categoryId,
    required this.name,
    required this.totalExpenses,
    required this.icon,
    required this.color,
  });

  static final empty = Category(
    categoryId: '',
    name: '',
    totalExpenses: 0,
    icon: '',
    color: '',
  );

  CategoryEntity toEntity() {
    return CategoryEntity(
      categoryId: categoryId,
      name: name,
      totalExpenses: totalExpenses,
      icon: icon,
      color: color,
    );
  }

  static Category fromEntity(CategoryEntity entity) {
    return Category(
      categoryId: entity.categoryId,
      name: entity.name,
      totalExpenses: entity.totalExpenses,
      icon: entity.icon,
      color: entity.color,
    );
  }
}
