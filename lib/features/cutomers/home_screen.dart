import 'package:flutter/material.dart';

import '../../core/animations/vertical_text_scroll.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});
  final List<String> hints = [
    'Hello World!',
    'Welcome to Flutter',
    'Scrolling Text Animation',
    'Enjoy coding 🚀',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Home Screen')),
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: TextField(
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              prefix: AnimatedHintTextField(
                hintTexts: hints,
                textStyle: TextStyle(color: Colors.grey),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
