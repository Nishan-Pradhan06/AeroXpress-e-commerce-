import 'dart:async';
import 'package:flutter/material.dart';

class AnimatedHintTextField extends StatefulWidget {
  final List<String> hintTexts;
  final Duration displayDuration;
  final Duration transitionDuration;
  final TextStyle? textStyle;
  final TextEditingController? controller;

  const AnimatedHintTextField({
    super.key,
    required this.hintTexts,
    this.displayDuration = const Duration(seconds: 3),
    this.transitionDuration = const Duration(milliseconds: 600),
    this.textStyle,
    this.controller,
  });

  @override
  State<AnimatedHintTextField> createState() => _AnimatedHintTextFieldState();
}

class _AnimatedHintTextFieldState extends State<AnimatedHintTextField> {
  int _currentIndex = 0;
  late Timer _timer;

  @override
  void initState() {
    super.initState();
    _startTimer();
  }

  void _startTimer() {
    _timer = Timer.periodic(
      widget.displayDuration + widget.transitionDuration,
      (Timer timer) {
        setState(() {
          _currentIndex = (_currentIndex + 1) % widget.hintTexts.length;
        });
      },
    );
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: widget.controller,
      decoration: InputDecoration(
        border: const OutlineInputBorder(),
        hintText: '', // Placeholder for the hint
        hintStyle:
            widget.textStyle ??
            const TextStyle(fontSize: 16, color: Colors.grey),
        // Embed the animated text as the hint
        label: _buildAnimatedHint(),
      ),
    );
  }

  Widget _buildAnimatedHint() {
    return SizedBox(
      height: 20, // Adjust height based on your design
      child: AnimatedSwitcher(
        duration: widget.transitionDuration,
        transitionBuilder: (Widget child, Animation<double> animation) {
          final inAnimation = Tween<Offset>(
            begin: const Offset(0, 1), // Enter from bottom
            end: Offset.zero, // End at the center
          ).animate(
            CurvedAnimation(parent: animation, curve: Curves.easeInOut),
          );

          final outAnimation = Tween<Offset>(
            begin: Offset.zero, // Start at the center
            end: const Offset(0, -1), // Exit to the top
          ).animate(
            CurvedAnimation(parent: animation, curve: Curves.easeInOut),
          );

          if (child.key == ValueKey(widget.hintTexts[_currentIndex])) {
            // Entering text
            return SlideTransition(
              position: inAnimation,
              child: FadeTransition(opacity: animation, child: child),
            );
          } else {
            // Exiting text
            return SlideTransition(
              position: outAnimation,
              child: FadeTransition(
                opacity: Tween<double>(begin: 1, end: 0).animate(animation),
                child: child,
              ),
            );
          }
        },
        child: Text(
          widget.hintTexts[_currentIndex],
          key: ValueKey<String>(widget.hintTexts[_currentIndex]),
          textAlign: TextAlign.start,
          overflow: TextOverflow.ellipsis,
          style:
              widget.textStyle ??
              const TextStyle(fontSize: 16, color: Colors.grey),
        ),
      ),
    );
  }
}
