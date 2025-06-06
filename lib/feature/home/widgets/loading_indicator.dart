import 'package:flutter/material.dart';

/// A loading indicator widget that displays a circular progress indicator.
class LoadingIndicator extends StatelessWidget {
  const LoadingIndicator({
    super.key,
    this.height = 40,
  });
  final double height;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      height: height,
      child: CircularProgressIndicator.adaptive(),
    );
  }
}
