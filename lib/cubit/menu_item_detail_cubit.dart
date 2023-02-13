import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_delivery_single_template/cubit/basket_cubit.dart';
import 'package:food_delivery_single_template/locator.dart';
import 'package:food_delivery_single_template/model/choice.dart';
import 'package:food_delivery_single_template/model/choice_item.dart';
import 'package:food_delivery_single_template/model/food_menu_item.dart';
import 'package:food_delivery_single_template/service/service.dart';

class MenuItemDetailCubit extends Cubit<MenuItemDetailState> {
  final FoodMenuItem menuItem;

  final Service service = getIt<Service>();
  Map<String, List<String>> removables = {};
  Map<String, String> options = {};
  Map<String, List<String>> extras = {};

  MenuItemDetailCubit(this.menuItem)
      : super(MenuItemDetailState(menuItem, menuItem.price, 1)) {
    for (var choice in menuItem.choices) {
      if (choice is Removables) {
        removables[choice.name] = [];
      } else if (choice is Options) {
        options[choice.name] =
            choice.choiceItems.firstWhere((element) => element.isDefault).name;
      } else if (choice is Extras) {
        extras[choice.name] = [];
      }
    }
  }

  void add() {
    emit(MenuItemDetailState(menuItem, state.price, state.quantity + 1));
  }

  void remove() {
    if (state.quantity > 1) {
      emit(MenuItemDetailState(menuItem, state.price, state.quantity - 1));
    }
  }

  void toggleRemovable(String name, String group) {
    if (removables[group]!.contains(name)) {
      removables[group]!.remove(name);
    } else {
      removables[group]!.add(name);
    }

    emit(MenuItemDetailState(menuItem, state.price, state.quantity));
  }

  void setOption(String name, String group) {
    options[group] = name;
  }

  void toggleExtra(String name, String group) {
    if (extras[group]!.contains(name)) {
      extras[group]!.remove(name);
    } else {
      extras[group]!.add(name);
    }

    double price = menuItem.choices
        .expand<ChoiceItem>((choice) => choice.choiceItems)
        .where((item) =>
            extras.values.expand<String>((extra) => extra).contains(item.name))
        .fold(menuItem.price, (previous, element) => previous + element.price);

    emit(MenuItemDetailState(menuItem, price, state.quantity));
  }

  void addItemToBasket(BasketCubit cubit) {
    List<String> extrasAndOptions = List.from(options.values);
    extrasAndOptions.addAll(extras.values.expand((e) => e));

    cubit.addMenuItem(
        menuItem.name, menuItem.image, state.price, state.quantity,
        ingredients: removables.values.expand((r) => r).join(" · "),
        extrasAndOptions: extrasAndOptions.join(" · "));
  }
}

class MenuItemDetailState extends Equatable {
  final FoodMenuItem menuItem;
  final double price;
  final int quantity;

  const MenuItemDetailState(this.menuItem, this.price, this.quantity);

  @override
  List<Object?> get props => [menuItem, price, quantity];
}
