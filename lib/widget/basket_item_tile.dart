import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_delivery_single_template/cubit/basket_cubit.dart';
import 'package:food_delivery_single_template/model/basket_item.dart';
import 'package:intl/intl.dart';

class BasketItemTile extends StatelessWidget {
  final BasketItem basketItem;
  const BasketItemTile({
    required this.basketItem,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);
    final titleMedium = themeData.textTheme.titleMedium;
    final labelMedium = themeData.textTheme.labelMedium;
    final lineThroughLabelMedium =
        labelMedium?.copyWith(decoration: TextDecoration.lineThrough);

    return Container(
      margin: const EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(20.0)),
        color: themeData.cardColor,
      ),
      child: Padding(
        padding: const EdgeInsets.all(4.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(4.0),
              child: ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(12.0)),
                child: Image.asset(
                  "assets/${basketItem.productImage}.jpg",
                  fit: BoxFit.cover,
                  width: 80,
                  height: 80,
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(4.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(basketItem.productName, style: titleMedium),
                    Visibility(
                      visible: basketItem.ingredients.isNotEmpty,
                      child: Padding(
                        padding: const EdgeInsets.only(top: 4.0),
                        child: Text(basketItem.ingredients,
                            style: lineThroughLabelMedium),
                      ),
                    ),
                    Visibility(
                      visible: basketItem.extrasAndOptions.isNotEmpty,
                      child: Padding(
                        padding: const EdgeInsets.only(top: 4.0),
                        child: Text(basketItem.extrasAndOptions,
                            style: labelMedium),
                      ),
                    ),
                    const SizedBox(height: 4.0),
                    _quantityAndPrice(context),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _quantityAndPrice(BuildContext context) {
    final cubit = context.read<BasketCubit>();
    final themeData = Theme.of(context);
    final titleMedium = themeData.textTheme.titleMedium;
    final currency = NumberFormat.currency(symbol: '\$');

    return Row(
      children: [
        ElevatedButton(
          onPressed: () {
            cubit.updateBasketItem(basketItem);
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
          constraints: const BoxConstraints(minWidth: 24.0),
          child: Text(
            basketItem.quantity.toString(),
            style: titleMedium,
            textAlign: TextAlign.center,
          ),
        ),
        ElevatedButton(
          onPressed: () {
            if (basketItem.quantity > 1) {
              cubit.removeBasketItem(basketItem);
            } else {
              cubit.deleteBasketItem(basketItem);
            }
          },
          style: ElevatedButton.styleFrom(
            shape: const CircleBorder(),
            padding: const EdgeInsets.all(4),
          ),
          child: Icon(
            basketItem.quantity > 1 ? Icons.remove : Icons.close,
            color: themeData.colorScheme.onPrimary,
            size: 32.0,
          ),
        ),
        const Spacer(),
        Text(
          currency.format(basketItem.total),
          style: titleMedium,
        ),
      ],
    );
  }
}
