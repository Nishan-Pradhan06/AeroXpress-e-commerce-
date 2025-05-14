import 'package:flutter/material.dart';

class CustomPadding extends StatefulWidget {
  final double? top;
  final double? left;
  final double? right;
  final double? bottom;
  final Widget child;
  const CustomPadding({
    super.key,
    this.top,
    this.left,
    this.right,
    this.bottom,
    required this.child,
  });

  @override
  State<CustomPadding> createState() => _CustomPaddingState();
}

class _CustomPaddingState extends State<CustomPadding> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: widget.top ?? 0,
        left: widget.left ?? 10,
        right: widget.right ?? 10,
        bottom: widget.bottom ?? 0,
      ),
      child: widget.child,
    );
  }
}
