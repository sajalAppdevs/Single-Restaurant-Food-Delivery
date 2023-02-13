import 'package:flutter/material.dart';
import 'package:food_delivery_single_template/widget/picker_item.dart';

class RemovableItemPicker extends StatefulWidget {
  final List<PickerItem> items;
  final String group;
  final void Function(String name, String group) callback;

  const RemovableItemPicker({
    required this.items,
    required this.group,
    required this.callback,
    Key? key,
  }) : super(key: key);

  @override
  State<RemovableItemPicker> createState() => _RemovableItemPickerState();
}

class _RemovableItemPickerState extends State<RemovableItemPicker> {
  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);
    final bodyLarge = themeData.textTheme.bodyLarge;
    final lineThroughBodyLarge = themeData.textTheme.bodyLarge
        ?.copyWith(decoration: TextDecoration.lineThrough);

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
            child: Text(
              item.name,
              style: item.selected ? lineThroughBodyLarge : bodyLarge,
            ),
          ),
        );
      },
    );
  }
}
