## Overview

`uni_selected_button` provides a group of buttons where only one button can be selected at a time.

## Getting started

### Add dependency
Add the following line to your `pubspec.yaml` file:

```yaml
dependencies:
  uni_selected_button: ^0.0.1
```

### Usage

1. Import the package in your Dart file

```dart
import 'package:uni_selected_button/uni_selected_button.dart';
```

2. Use `UniSelectedButton` widget, and provide a list of `SelectedButton` widgets as children.

```dart
UniButtonGroup(
  children: [
    SelectedButton(
        label: const Text('Light'),
        icon: const Icon(Icons.light_mode),
        value: ThemeMode.light,
        groupValue: _themeMode,
        onPressed: (value) => {},
    ),
    SelectedButton(
        label: const Text('Dark'),
        icon: const Icon(Icons.dark_mode),
        value: ThemeMode.dart,
        groupValue: _themeMode,
        onPressed: (value) => {},
    ),
    SelectedButton(
        label: const Text('System'),
        icon: const Icon(Icons.laptop),
        value: ThemeMode.system,
        groupValue: _themeMode,
        onPressed: (value) => {},
    ),
  ],
),
```

## Demo

![Demo example](https://github.com/huynguyennovem/uni_selected_button/assets/29337364/09eacf88-9f6d-4d6b-a6fc-6a8bab7c9e24)