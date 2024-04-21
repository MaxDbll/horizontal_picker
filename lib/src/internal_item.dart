part of 'horizontal_picker.dart';

// Internal widget to display the Items
// This widget is used to handle the selection callback and the tooltip
class _InternalItem<T> extends StatelessWidget {
  const _InternalItem(
      {super.key,
      required this.selected,
      required this.onSelected,
      required this.tooltipkey,
      required this.showTooltip,
      required this.size,
      required this.item,
      required this.index});

  final HoriztontalPickerItem item; // The item to display
  final bool selected; // Is the item selected
  final void Function(T, int) onSelected; // Callback when the item is selected
  final GlobalKey<TooltipState> tooltipkey; // Key to show the tooltip
  final bool showTooltip; // Show tooltip when the item is selected
  final int index;
  final double size;

  @override
  Widget build(BuildContext context) {
    // Get some properties from the item that used in the parent widget too
    final T value = item.value;
    final Color color =
        item.color ?? Theme.of(context).colorScheme.surfaceVariant;

    return InkWell(
      customBorder: const CircleBorder(),
      onTap: () async {
        // Call the callback function
        onSelected(value, index);

        // Show tooltip
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
              width: size,
              height: size,
              decoration: BoxDecoration(
                color: color,
                shape: BoxShape.circle,
              ),
              child: Center(child: item.child),
            )),
      ),
    );
  }
}
