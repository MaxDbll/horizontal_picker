library horizontal_picker;

import 'package:flutter/material.dart';

import 'horizontal_picker_item.dart';

// Display an horziontal list of elements with different value to select one
class HorizontalPicker extends StatefulWidget {
  const HorizontalPicker(
      {super.key,
      required this.onSelected,
      required this.items,
      this.value,
      this.optionSize = 64.0,
      this.space = 14.0,
      this.optionColor,
      this.showTooltip = false});

  final void Function(int) onSelected; // Callback when an option is selected
  final int? value; // Default selected value
  final List<HoriztontalPickerItem> items; // List of elements to display
  final double optionSize; // Size of each element
  final double space; // Space between each element
  final Color?
      optionColor; // Color of the element, if null use the default color, surfaceVariant
  final bool showTooltip; // Show tooltip when an element is selected

  @override
  State<HorizontalPicker> createState() => _HorizontalPickerState();
}

class _HorizontalPickerState extends State<HorizontalPicker> {
  int selectedValue = 0;
  List<GlobalKey<TooltipState>> tooltipKeys = [];
  late Color optionColor;

  @override
  void initState() {
    super.initState();

    // Default selected value
    selectedValue = widget.value ?? 0;

    // Init tooltip keys
    for (var _ in widget.items) {
      tooltipKeys.add(GlobalKey<TooltipState>());
    }
  }

  @override
  Widget build(BuildContext context) {
    optionColor =
        widget.optionColor ?? Theme.of(context).colorScheme.surfaceVariant;

    return SizedBox(
      height: widget.optionSize,
      child: ListView.separated(
        separatorBuilder: (context, index) => SizedBox(width: widget.space),
        shrinkWrap: true, // Use the minimum height
        scrollDirection: Axis.horizontal,
        itemCount: widget.items.length,
        itemBuilder: (context, index) {
          return HoriztontalPickerItem(
            color: optionColor,
            optionSize: widget.optionSize,
            selected:
                (selectedValue == index), // Check if the element is selected
            value: index,
            onSelected: (value) {
              setState(() {
                selectedValue = value;
                // Call the callback function
                widget.onSelected(value);
              });
            },
            tooltipkey: tooltipKeys[index],
            showTooltip: widget.showTooltip,
            child: widget.items[index],
          );
        },
      ),
    );
  }
}

class _internalItem extends StatelessWidget {
  const _internalItem(
      {required this.value,
      required this.child,
      required this.selected,
      required this.onSelected,
      required this.optionSize,
      required this.optionColor,
      required this.tooltipkey,
      required this.showTooltip});

  final bool selected;
  final Widget child;
  final int value;
  final double optionSize;
  final Color optionColor;
  final void Function(int) onSelected;
  final GlobalKey<TooltipState> tooltipkey;
  final bool showTooltip;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(optionSize),
      onTap: () async {
        onSelected(value);

        // Show tooltip for 500ms
        if (showTooltip) {
          tooltipkey.currentState?.ensureTooltipVisible();
          await Future.delayed(const Duration(milliseconds: 50));
        }
      },
      child: Tooltip(
        decoration: BoxDecoration(
          color: optionColor.withOpacity(.8),
          borderRadius: BorderRadius.circular(32),
        ),
        textStyle: Theme.of(context).textTheme.bodyMedium!.copyWith(
              color: optionColor.withOpacity(.8),
            ),
        verticalOffset: 40,
        key: tooltipkey,
        message: '$value',
        preferBelow: false,
        child: Opacity(
          opacity: selected ? 1 : 0.40,
          child: Container(
            width: optionSize,
            height: optionSize,
            // Display the element as a circle
            decoration: BoxDecoration(
              color: optionColor,
              shape: BoxShape.circle,
            ),
            child: Center(
              child: child,
            ),
          ),
        ),
      ),
    );
  }
}
