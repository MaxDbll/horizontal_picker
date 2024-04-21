<!--
This README describes the package. If you publish this package to pub.dev,
this README's contents appear on the landing page for your package.

For information about how to write a good package README, see the guide for
[writing package pages](https://dart.dev/guides/libraries/writing-package-pages).

For general information about developing packages, see the Dart guide for
[creating packages](https://dart.dev/guides/libraries/create-library-packages)
and the Flutter guide for
[developing packages and plugins](https://flutter.dev/developing-packages).
-->

# Horitzontal picker

![Static Badge](https://img.shields.io/badge/1.0.0-blue?label=pub)
![Static Badge](https://img.shields.io/badge/>=%201.17.0-green?label=Flutter)
![Static Badge](https://img.shields.io/badge/License-red?label=MIT)


A Flutter package that provides an horizontal scrollable list of selectables items to pick an option.

Add screenshot

## Overview

A customizable widget to pick an option from a list of items. The widget is horizontally scrollable and allows to select an item by tapping on it.

## Getting started

1. Open your project's `pubspec.yaml` file
2. Add `horitzontal_picker` to your dependencies, replacing `[version]` with the latest version of the package

```yaml
dependencies:
  horitzontal_picker: ^[version]
```

## Import the package

```dart
import 'package:horitzontal_picker/horitzontal_picker.dart';
```

## Usage and examples
To use this package, just add the `HoritzontalPicker` widget to your widget tree.

As a required parameter, you need to provide a list of items `HorizontalPickerItem` to be displayed in the picker. 



```dart
import 'package:horitzontal_picker/horitzontal_picker.dart';

...

// Horizontal picker items with strings
List<String> textItems = <String>[
  '😟',
  '😕',
  '😐',
  '😊',
  '😍',
];

// Horizontal picker items with widgets
...
HorizontalPicker<int>(
    // on option selected callback
    onSelected: (int value) {
        print('Selected value: $value');
    },
    // list of items to be displayed
    items: textItems.map<HoriztontalPickerItem<int>>((e) {
        // return a HoriztontalPickerItem with the value and the child widget displayed
        return HoriztontalPickerItem<int>(
            value: textItems.indexOf(e) + 1,
            child: Text(e, style: const TextStyle(fontSize: 24)),
        );
    }).toList(),
)

```

## Issues and feedback
For reporting bugs, requesting features, or any other feedback, visit my [GitHub repository](https://github.com/MaxDbll/horizontal_picker).