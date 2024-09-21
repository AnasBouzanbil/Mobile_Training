import 'package:flutter/material.dart';


class BasicAppButton extends StatelessWidget {
  final VoidCallback pressed;
  final Text child;
  final double?  height;
  const BasicAppButton({
    required this.child,
    required this.pressed,
    this.height,

    super.key,

  });

  @override
  Widget build(BuildContext context) {
    return  ElevatedButton(
      onPressed: pressed,
      style: ElevatedButton.styleFrom(
        minimumSize: Size.fromHeight(height ?? 80),
      ),
      child: child,

    );
  }
}
