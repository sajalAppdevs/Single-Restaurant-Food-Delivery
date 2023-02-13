import 'package:flutter/material.dart';
import 'package:food_delivery_single_template/widget/picker_item.dart';

class OptionItemPicker extends StatefulWidget {
  final List<PickerItem> items;
  final String group;
  final void Function(String name, String group) callback;

  const OptionItemPicker(
      {required this.items,
      required this.group,
      required this.callback,
      Key? key})
      : super(key: key);

  @override
  State<OptionItemPicker> createState() => _OptionItemPickerState();
}

class _OptionItemPickerState extends State<OptionItemPicker> {
  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);
    final bodyLarge = themeData.textTheme.bodyLarge;

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
              for (var i in widget.items) {
                i.selected = false;
              }

              item.selected = !item.selected;
            });
          },
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                Icon(
                    item.selected
                        ? Icons.radio_button_checked
                        : Icons.radio_button_unchecked,
                    size: 24,
                    color: themeData.colorScheme.primary),
                const SizedBox(width: 8.0),
                Expanded(
                  child: Text(item.name, style: bodyLarge),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
