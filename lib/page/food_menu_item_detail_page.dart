import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_delivery_single_template/app_theme.dart';
import 'package:food_delivery_single_template/cubit/basket_cubit.dart';
import 'package:food_delivery_single_template/cubit/favorite_cubit.dart';
import 'package:food_delivery_single_template/cubit/menu_item_detail_cubit.dart';
import 'package:food_delivery_single_template/localization/locals.dart';
import 'package:food_delivery_single_template/model/choice.dart';
import 'package:food_delivery_single_template/widget/group_header.dart';
import 'package:food_delivery_single_template/widget/extra_item_picker.dart';
import 'package:food_delivery_single_template/widget/picker_item.dart';
import 'package:food_delivery_single_template/widget/removable_item_picker.dart';
import 'package:food_delivery_single_template/widget/option_item_picker.dart';
import 'package:intl/intl.dart';

class FoodMenuItemDetailPage extends StatelessWidget {
  final List<Choice> choices;

  const FoodMenuItemDetailPage({required this.choices, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);
    final bodyLarge = themeData.textTheme.bodyLarge;
    final headlineSmall = themeData.textTheme.headlineSmall;
    final boldHeadlineSmall =
        headlineSmall?.copyWith(fontWeight: FontWeight.bold);
    final currency = NumberFormat.currency(symbol: '\$');

    return Scaffold(
      appBar: AppBar(),
      body: Stack(
        alignment: AlignmentDirectional.bottomCenter,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(20.0),
                  bottomRight: Radius.circular(20.0),
                ),
                child: AspectRatio(
                  aspectRatio: 2.0,
                  child: BlocBuilder<MenuItemDetailCubit, MenuItemDetailState>(
                    builder: (context, state) {
                      return Image.asset(
                        "assets/${state.menuItem.image}.jpg",
                        fit: BoxFit.cover,
                      );
                    },
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    left: 16.0, top: 16.0, right: 16.0, bottom: 8.0),
                child: BlocBuilder<MenuItemDetailCubit, MenuItemDetailState>(
                  builder: (context, state) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Text(state.menuItem.name, style: boldHeadlineSmall),
                        const SizedBox(height: 8.0),
                        Text(state.menuItem.description, style: bodyLarge),
                        const SizedBox(height: 8.0),
                        Text(currency.format(state.price),
                            style: headlineSmall),
                      ],
                    );
                  },
                ),
              ),
              Expanded(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: _itemChoices(context, choices),
                  ),
                ),
              ),
            ],
          ),
          _bottomPanel(context),
          BlocBuilder<MenuItemDetailCubit, MenuItemDetailState>(
            builder: (context, state) {
              return _favoriteButton(context, state.menuItem.id);
            },
          ),
        ],
      ),
    );
  }

  Container _bottomPanel(BuildContext context) {
    final cubit = context.read<MenuItemDetailCubit>();
    final basketCubit = context.read<BasketCubit>();
    final locals = Locals.of(context);
    final themeData = Theme.of(context);
    final titleLarge = themeData.textTheme.titleLarge;

    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            blurRadius: 10,
            color: Colors.black.withOpacity(.4),
          ),
        ],
        color: themeData.cardColor,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(40),
          topRight: Radius.circular(40),
        ),
      ),
      child: Row(
        children: [
          ElevatedButton(
            onPressed: () {
              cubit.add();
            },
            style: ElevatedButton.styleFrom(
              shape: const CircleBorder(),
              padding: const EdgeInsets.all(4),
            ),
            child: Icon(
              Icons.add,
              color: themeData.colorScheme.onPrimary,
              size: 32.0,
            ),
          ),
          Container(
            constraints: const BoxConstraints(minWidth: 32.0),
            child: BlocBuilder<MenuItemDetailCubit, MenuItemDetailState>(
              builder: (context, state) {
                return Text(
                  state.quantity.toString(),
                  style: titleLarge,
                  textAlign: TextAlign.center,
                );
              },
            ),
          ),
          ElevatedButton(
            onPressed: () {
              cubit.remove();
            },
            style: ElevatedButton.styleFrom(
              shape: const CircleBorder(),
              padding: const EdgeInsets.all(4),
            ),
            child: Icon(
              Icons.remove,
              color: themeData.colorScheme.onPrimary,
              size: 32.0,
            ),
          ),
          const Spacer(),
          ElevatedButton(
            onPressed: () {
              cubit.addItemToBasket(basketCubit);
              Navigator.of(context).pop();
            },
            style: AppTheme.stadiumElevatedButton,
            child: Text(locals.addBasket),
          ),
        ],
      ),
    );
  }

  Positioned _favoriteButton(BuildContext context, String itemId) {
    final favCubit = context.read<FavoriteCubit>();

    return Positioned(
      top: 24.0,
      right: 24.0,
      child: BlocBuilder<FavoriteCubit, FavoriteState>(
        builder: (context, favState) {
          return GestureDetector(
            onTap: () {
              favCubit.toggleFavorite(itemId);
            },
            child: Container(
              padding: const EdgeInsets.all(12.0),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.black.withOpacity(.4),
              ),
              child: Icon(
                favState.favorites.any((item) => item.itemId == itemId)
                    ? Icons.favorite
                    : Icons.favorite_outline,
                size: 30.0,
                color: Colors.white,
              ),
            ),
          );
        },
      ),
    );
  }

  List<Widget> _itemChoices(BuildContext context, List<Choice> choices) {
    final cubit = context.read<MenuItemDetailCubit>();
    List<Widget> widgets = [];

    for (var choice in choices) {
      widgets.add(GroupHeader(choice.name));
      if (choice is Removables) {
        widgets.add(
          RemovableItemPicker(
            items: choice.choiceItems
                .map<PickerItem>(
                    (i) => PickerItem(i.name, i.price, i.isDefault))
                .toList(),
            group: choice.name,
            callback: cubit.toggleRemovable,
          ),
        );
      } else if (choice is Options) {
        widgets.add(
          OptionItemPicker(
            items: choice.choiceItems
                .map<PickerItem>(
                    (i) => PickerItem(i.name, i.price, i.isDefault))
                .toList(),
            group: choice.name,
            callback: cubit.setOption,
          ),
        );
      } else if (choice is Extras) {
        widgets.add(
          ExtraItemPicker(
            items: choice.choiceItems
                .map<PickerItem>(
                    (i) => PickerItem(i.name, i.price, i.isDefault))
                .toList(),
            group: choice.name,
            callback: cubit.toggleExtra,
          ),
        );
      }
    }

    widgets.add(const SizedBox(height: 80.0));

    return widgets;
  }
}
