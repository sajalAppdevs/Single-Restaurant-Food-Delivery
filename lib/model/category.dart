import 'package:food_delivery_single_template/model/entity.dart';

// Type represent category entity
class Category extends Entity {
  final String name;
  final String image;

  const Category({required super.id, required this.name, required this.image});

  @override
  List<Object?> get props => [id, name, image];
}
