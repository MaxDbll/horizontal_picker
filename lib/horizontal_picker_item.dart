import 'package:flutter/material.dart';

class HoriztontalPickerItem extends StatelessWidget {
  const HoriztontalPickerItem(
      {super.key,
      required this.value,
      required this.child,
      required this.optionSize,
      required this.color,
      required this.selected,
      required this.onSelected,
      required this.tooltipkey,
      required this.showTooltip});

  final bool selected;
  final Widget child;
  final int value;
  final double optionSize;
  final Color color;
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
          color: color.withOpacity(.8),
          borderRadius: BorderRadius.circular(32),
        ),
        textStyle: Theme.of(context).textTheme.bodyMedium!.copyWith(
              color: color.withOpacity(.8),
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
              color: color,
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
