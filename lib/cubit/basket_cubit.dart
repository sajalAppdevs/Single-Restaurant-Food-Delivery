import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_delivery_single_template/locator.dart';
import 'package:food_delivery_single_template/model/basket_item.dart';
import 'package:food_delivery_single_template/service/service.dart';

class BasketCubit extends Cubit<BasketState> {
  final Service service = getIt<Service>();

  BasketCubit() : super(BasketState.empty());

  void getBasketItems() async {
    final basketItems = await service.getBasketItems();
    emit(BasketState(basketItems.toList(), _basketTotal(basketItems)));
  }

  void addMenuItem(String productName, String productImage,
      double unitPrice, int quantity,
      {String? ingredients, String? extrasAndOptions}) async {
    await service.addBasketItem(
        productName, productImage, unitPrice, quantity,
        ingredients: ingredients, extrasAndOptions: extrasAndOptions);
    final basketItems = await service.getBasketItems();
    emit(BasketState(basketItems.toList(), _basketTotal(basketItems)));
  }

  void updateBasketItem(BasketItem item) async {
    await service.updateBasketItem(item.id, item.quantity + 1);
    final basketItems = await service.getBasketItems();
    emit(BasketState(basketItems.toList(), _basketTotal(basketItems)));
  }

  void removeBasketItem(BasketItem item) async {
    await service.updateBasketItem(item.id, item.quantity - 1);
    final basketItems = await service.getBasketItems();
    emit(BasketState(basketItems.toList(), _basketTotal(basketItems)));
  }

  void deleteBasketItem(BasketItem item) async {
    await service.deleteBasketItem(item.id);
    final basketItems = await service.getBasketItems();
    emit(BasketState(basketItems.toList(), _basketTotal(basketItems)));
  }

  void deleteAll() async {
    await service.deleteAllBasketItems();
    emit(BasketState.empty());
  }

  double _basketTotal(List<BasketItem> basketItems) {
    return basketItems.fold<double>(
        0, (previous, item) => previous + item.total);
  }
}

class BasketState extends Equatable {
  final List<BasketItem> basketItems;
  final double basketTotal;

  const BasketState(this.basketItems, this.basketTotal);

  factory BasketState.empty() {
    return const BasketState([], 0.0);
  }

  @override
  List<Object?> get props => [basketItems, basketTotal];
}
