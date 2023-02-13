import 'package:food_delivery_single_template/model/choice.dart';
import 'package:food_delivery_single_template/model/entity.dart';

class FoodMenuItem extends Entity {
  // Name for the product
  final String name;
  // Description for the product
  final String description;
  // Image of the menu item
  final String image;
  // Current price of the product
  final double price;
  // Regular price of the product
  final double regularPrice;
  // Id of associated category
  final String categoryId;
  // Choices for this menu item.
  final List<Choice> choices;
  // True, if product is featured
  final bool isFeatured;
  // True, if product is popular
  final bool isPopular;
  // True, if it is favorite item for the logged customer
  final bool isFavorite;

  // Calculated field:
  bool get onSale => price != regularPrice;

  const FoodMenuItem({
    required super.id,
    required this.name,
    required this.description,
    required this.image,
    required this.price,
    required this.regularPrice,
    required this.categoryId,
    required this.choices,
    this.isFeatured = false,
    this.isPopular = false,
    this.isFavorite = false,
  });

  FoodMenuItem copyWith({bool? isFavorite}) {
    return FoodMenuItem(
        id: id,
        name: name,
        description: description,
        image: image,
        price: price,
        regularPrice: regularPrice,
        categoryId: categoryId,
        choices: choices,
        isFeatured: isFeatured,
        isPopular: isPopular,
        isFavorite: isFavorite ?? this.isFavorite);
  }

  @override
  List<Object?> get props => [
        id,
        name,
        description,
        image,
        price,
        regularPrice,
        categoryId,
        choices,
        isFeatured,
        isPopular,
        isFavorite,
      ];
}
