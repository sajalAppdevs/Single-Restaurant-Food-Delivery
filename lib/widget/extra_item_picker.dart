import 'package:flutter/material.dart';
import 'package:food_delivery_single_template/widget/picker_item.dart';
import 'package:intl/intl.dart';

class ExtraItemPicker extends StatefulWidget {
  final List<PickerItem> items;
  final String group;
  final void Function(String name, String group) callback;

  const ExtraItemPicker(
      {required this.items,
      required this.group,
      required this.callback,
      Key? key})
      : super(key: key);

  @override
  State<ExtraItemPicker> createState() => _ExtraItemPickerState();
}

class _ExtraItemPickerState extends State<ExtraItemPicker> {
  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);
    final bodyLarge = themeData.textTheme.bodyLarge;
    final currency = NumberFormat.currency(symbol: "\$");

    return ListView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: widget.items.length,
      itemBuilder: (context, index) {
        final item = widget.items[index];

        return GestureDetector(
          onTap: () {
            widget.callback(item.name, widget.group);

            setState(() {
              item.selected = !item.selected;
            });
          },
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                Icon(
                  item.selected
                      ? Icons.check_box
                      : Icons.check_box_outline_blank,
                  size: 24,
                  color: themeData.colorScheme.primary,
                ),
                const SizedBox(width: 8.0),
                Expanded(child: Text(item.name, style: bodyLarge)),
                const SizedBox(width: 8.0),
                Text(currency.format(item.price)),
              ],
            ),
          ),
        );
      },
    );
  }
}
