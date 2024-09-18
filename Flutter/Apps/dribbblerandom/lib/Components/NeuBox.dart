import 'package:flutter/material.dart';



class Neubox extends StatelessWidget {
  final Widget? child;
  const Neubox({super.key,
  required this.child
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(30),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        boxShadow:
        [
          BoxShadow(
          color: Colors.grey.shade500,
          blurRadius: 19,
          offset: Offset(10, 4),
        ),
          BoxShadow(
            color: Colors.white,
            blurRadius: 15,
            offset: Offset(-4, -4),
          ),
          ]
      ),
      child: child,

    );
  }
}
