part of 'horizontal_picker.dart';

// Internal widget to display the Items
// This widget is used to handle the properties shardes of all the items
class _InternalItem<T> extends StatelessWidget {
  const _InternalItem({super.key, required this.selected, required this.onSelected, required this.size, required this.item, required this.index});

  final HorizontalPickerItem item; // The item to display
  final bool selected; // Is the item selected
  final void Function(T, int) onSelected; // Callback when the item is selected
  final int index; // Index of the item
  final double size; // Size of the item

  @override
  Widget build(BuildContext context) {
    // Get some properties from the item that used in the parent widget too
    final T value = item.value;
    final Color color = item.color ?? Theme.of(context).colorScheme.surfaceVariant;

    return InkWell(
      customBorder: const CircleBorder(),
      onTap: () async {
        // Call the callback function
        onSelected(value, index);
      },
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
    );
  }
}
