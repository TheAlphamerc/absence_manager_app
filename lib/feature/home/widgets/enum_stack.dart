import 'package:flutter/material.dart';

/// A widget that displays a stack of widgets based on an enum value.
/// ```
/// EnumStack<Status>(
///   value: state.status,
///   children: {
///    Status.initial: const SizedBox.shrink(),
///    Status.loading: const Center(
///      child: CircularProgressIndicator.adaptive(),
///     ),
///    Status.error: ErrorView(message: state.message ?? ""),},
///  );
/// ```
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
