import 'package:flutter/material.dart';
import 'package:food_delivery_single_template/model/food_menu_item.dart';
import 'package:intl/intl.dart';

class FoodMenuItemListTile extends StatelessWidget {
  final FoodMenuItem item;
  final bool isFavorite;

  const FoodMenuItemListTile({
    required this.item,
    required this.isFavorite,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);
    final boldTitleMedium =
        themeData.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold);
    final bodyMedium = themeData.textTheme.bodyMedium;
    final throughLabelMedium = themeData.textTheme.labelMedium
        ?.copyWith(decoration: TextDecoration.lineThrough);
    final currency = NumberFormat.currency(symbol: '\$', decimalDigits: 0);

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Stack(
        children: [
          GestureDetector(
            onTap: () {
              Navigator.of(context)
                  .pushNamed("/menuitemdetail", arguments: item);
            },
            child: Container(
              width: 160.0,
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(Radius.circular(20.0)),
                color: themeData.cardColor,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Expanded(
                    child: ClipRRect(
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(20.0),
                        topRight: Radius.circular(20.0),
                      ),
                      child: Image.asset(
                        "assets/${item.image}.jpg",
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          item.name,
                          style: boldTitleMedium,
                          maxLines: 1,
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 4.0),
                        Text(
                          item.description,
                          style: bodyMedium,
                          maxLines: 2,
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Visibility(
            visible: isFavorite,
            child: Positioned(
              right: 12.0,
              top: 12.0,
              child: Icon(
                Icons.favorite,
                color: themeData.colorScheme.primary,
                size: 30.0,
              ),
            ),
          ),
          Positioned(
            right: 8.0,
            bottom: 80.0,
            child: Container(
              decoration: BoxDecoration(
                color: themeData.colorScheme.primary,
                borderRadius: const BorderRadius.all(Radius.circular(8.0)),
              ),
              child: Padding(
                padding: const EdgeInsets.all(4.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Visibility(
                      visible: item.onSale,
                      child: Text(
                        currency.format(item.regularPrice),
                        style: throughLabelMedium?.copyWith(
                            color: themeData.colorScheme.onPrimary),
                      ),
                    ),
                    const SizedBox(width: 4.0),
                    Text(
                      currency.format(item.price),
                      style: boldTitleMedium?.copyWith(
                          color: themeData.colorScheme.onPrimary),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
