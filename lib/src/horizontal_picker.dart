import 'package:flutter/material.dart';

part 'horizontal_picker_item.dart';
part 'internal_item.dart';

// Display an horziontal list of elements with different value to select one
class HorizontalPicker<T> extends StatefulWidget {
  const HorizontalPicker(
      {super.key,
      required this.onSelected,
      required this.items,
      this.value,
      this.optionSize = 64,
      this.space = 14.0});

  final void Function(T) onSelected; // Callback when an option is selected
  final int? value; // Default selected value
  final List<HoriztontalPickerItem> items; // List of elements to display
  final double optionSize; // Size of each element
  final double space; // Space between each element

  @override
  State<HorizontalPicker<T>> createState() => _HorizontalPickerState<T>();
}

class _HorizontalPickerState<T> extends State<HorizontalPicker<T>> {
  int? selectedValue = 0;
  double maxHeihgt = 0;

  @override
  void initState() {
    super.initState();

    // Default selected value
    selectedValue = widget.value;

    // Get the max height between the optionSize and selectedOptionSize
    maxHeihgt = widget.optionSize;
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: maxHeihgt,
      child: ListView.separated(
        separatorBuilder: (context, index) => SizedBox(width: widget.space),
        shrinkWrap: true, // Use the minimum height
        scrollDirection: Axis.horizontal,
        itemCount: widget.items.length,
        itemBuilder: (context, index) {
          return _InternalItem(
            size: widget.optionSize,
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
          );
        },
      ),
    );
  }
}
