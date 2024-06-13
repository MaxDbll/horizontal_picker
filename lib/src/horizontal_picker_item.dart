part of 'horizontal_picker.dart';

class HorizontalPickerItem<T> extends StatelessWidget {
  const HorizontalPickerItem({super.key, required this.value, required this.child, this.color});

  final Widget child; // Commonly an Icon, Text or Image
  final T value; // The value of the item
  final Color? color; // Color of the element

  @override
  Widget build(BuildContext context) {
    // If the color is not provided, use the surfaceVariant color from the theme

    return child;
  }
}
