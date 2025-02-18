import 'package:flutter/material.dart';

class EnumStack<T extends Enum> extends StatelessWidget {
  const EnumStack({super.key, required this.value, required this.children});

  final T value;

  final Map<T, Widget> children;

  @override
  Widget build(BuildContext context) {
    return IndexedStack(
      index: children.keys.toList().indexOf(value),
      children: [
        ...children.values,
      ],
    );
  }
}
