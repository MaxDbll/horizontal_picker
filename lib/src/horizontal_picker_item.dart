part of 'horizontal_picker.dart';

class HoriztontalPickerItem<T> extends StatelessWidget {
  const HoriztontalPickerItem(
      {super.key,
      required this.value,
      required this.child,
      this.color,
      this.optionSize = 64.0,
      this.shape = BoxShape.circle});

  final Widget child; // Commonly an Icon, Text or Image
  final T value; // The value of the item
  final BoxShape shape; // BoxShape.circle or BoxShape.rectangle
  final double optionSize; // Size of the element
  final Color? color; // Color of the element

  @override
  Widget build(BuildContext context) {
    // If the color is not provided, use the surfaceVariant color from the theme
    var itemColor = color ?? Theme.of(context).colorScheme.surfaceVariant;

    return Container(
      width: optionSize,
      height: optionSize,
      // By default display the element as a circle
      decoration: BoxDecoration(
        color: itemColor,
        shape: shape,
      ),
      child: Center(
        child: child,
      ),
    );
  }
}
