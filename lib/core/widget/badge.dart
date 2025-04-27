import 'package:flutter/material.dart';

class CustomBadge extends StatelessWidget {
  final Widget child;
  final String count;

  const CustomBadge({
    super.key,
    required this.child,
    required this.count,
  });

  @override
  Widget build(BuildContext context) {
    return Badge(
      alignment: Alignment.topRight,
      offset: const Offset(6, -6),
      padding: const EdgeInsets.all(2),
      backgroundColor: Colors.red,
      label: Text(
        count,
        style: const TextStyle(
          fontSize: 8,
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
      ),
      child: child,
    );
  }
}
