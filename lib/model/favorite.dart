import 'package:food_delivery_single_template/model/entity.dart';

// Type represent favorite entity
class Favorite extends Entity {
  // The id of the associated customer
  final String customerId;
  // The id of the associated place
  final String itemId;

  const Favorite({
    required super.id,
    required this.customerId,
    required this.itemId,
  });

  @override
  List<Object?> get props => [id, customerId, itemId];
}
