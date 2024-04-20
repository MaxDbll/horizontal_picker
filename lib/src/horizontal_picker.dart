import 'package:flutter/material.dart';

part 'horizontal_picker_item.dart';
part 'internal_item.dart';

// #TODO Add documentation

// Display an horziontal list of elements with different value to select one
class HorizontalPicker<T> extends StatefulWidget {
  const HorizontalPicker(
      {super.key,
      required this.onSelected,
      required this.items,
      this.value,
      this.space = 14.0,
      this.showTooltip = false});

  final void Function(T) onSelected; // Callback when an option is selected
  final int? value; // Default selected value
  final List<HoriztontalPickerItem> items; // List of elements to display
  final double space; // Space between each element
  final bool showTooltip; // Show tooltip when an element is selected

  @override
  State<HorizontalPicker<T>> createState() => _HorizontalPickerState<T>();
}

class _HorizontalPickerState<T> extends State<HorizontalPicker<T>> {
  int? selectedValue = 0;
  List<GlobalKey<TooltipState>> tooltipKeys = [];

  @override
  void initState() {
    super.initState();

    // Default selected value
    selectedValue = widget.value;

    // Init tooltip keys
    for (var _ in widget.items) {
      tooltipKeys.add(GlobalKey<TooltipState>());
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: ListView.separated(
        separatorBuilder: (context, index) => SizedBox(width: widget.space),
        shrinkWrap: true, // Use the minimum height
        scrollDirection: Axis.horizontal,
        itemCount: widget.items.length,
        itemBuilder: (context, index) {
          return _InternalItem(
            index: index,
            item: widget.items[index],
            selected:
                (selectedValue == index), // Check if the element is selected
            onSelected: (T value, int index) {
              setState(() {
                selectedValue = index;
                // Call the callback function
                widget.onSelected(value);
              });
            },
            tooltipkey: tooltipKeys[index],
            showTooltip: widget.showTooltip,
          );
        },
      ),
    );
  }
}
